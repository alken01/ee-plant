#include "appMain.h"
#include <sys/cdefs.h>
#include <stdio.h>
#include "driver/gpio.h"
#include "driver/pulse_cnt.h"


#define GPIO_FREQ_INPUT GPIO_NUM_22
#define GPIO_ENABLE GPIO_NUM_32
#define MEASURE_TIME 3//measuring time in seconds
#define CALIBRATION_VALUE 0 //calibration value for frequency
#define PCNT_HIGH_LIMIT 2000
#define PCNT_LOW_LIMIT  -1


int overflow_counter=0;
pcnt_unit_handle_t pcnt_unit;
TaskHandle_t TaskHandle_Counter;

int sensor_value_arr[18]= {7155,7080,7010,6945,6880,6820,6760,6705,6650,6600,6550,6500,6450,6400,6355,6305,6260,6210};
int humidity_value_arr[18]= {10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95};

void IRAM_ATTR pcnt_event_handler(void* arg){
    overflow_counter++;
    pcnt_unit_clear_count(pcnt_unit); //reset counter

}

void pcnt_get_counter(void* args) {
    int result;
    pcnt_unit_get_count(pcnt_unit, (int *)&result);
    int counts = result + (overflow_counter * PCNT_HIGH_LIMIT); //total amount of counts
    int frequency = (counts/MEASURE_TIME);

    //get Frequency:
    int index=0;
    while(frequency<sensor_value_arr[index]){
        index++;
    }

    //interpolate
    double humidity=0;
    double inter=0;
    if(index>0) {
        inter = (double)(sensor_value_arr[index - 1] - (frequency-CALIBRATION_VALUE)) / (sensor_value_arr[index - 1] - sensor_value_arr[index]);
        humidity= humidity_value_arr[index-1] - inter * (humidity_value_arr[index-1]-humidity_value_arr[index]);

    }
    else if(frequency<6210){
        humidity=95; //max humidity level that can be measured
    }
    else if(frequency>7155){
        humidity=5; //min humidity level that can be measured
    }
    if(inter<0){
        humidity=5;
    }

    printf("counter value: %d\n",counts);
    printf("frequency: %d\n",frequency);
    printf("air humidity value: %f\n\n",humidity);

    struct sensor_data_struct humidity_data;
    humidity_data.sensor_ID=3;
    humidity_data.sensor_value=humidity;
    xQueueSend(queue,&humidity_data,portMAX_DELAY); //send data to global queue
}


_Noreturn void counter_task(void* arg) {

    while (1) {
        TickType_t last_wake_time = xTaskGetTickCount();

        /*
        gpio_set_direction(GPIO_ENABLE,GPIO_MODE_OUTPUT);
        gpio_set_level(GPIO_ENABLE,1); //enable enable-pin
        */

        overflow_counter=0;
        pcnt_unit_clear_count(pcnt_unit);
        pcnt_unit_start(pcnt_unit);

        //vTaskDelayUntil(&last_wake_time,(MEASURE_TIME - MEASURE_TIME*0.175)*100);
        vTaskDelayUntil(&last_wake_time,(MEASURE_TIME)*100);
        last_wake_time = xTaskGetTickCount();

        pcnt_unit_stop(pcnt_unit);
        pcnt_get_counter(NULL);

        //gpio_set_level(GPIO_ENABLE,0); //disable enable-pin

        vTaskDelay(30*100);//wait 30 seconds before reading again
    }
}


void stop_humidity(void* arg){
    pcnt_unit_stop(pcnt_unit); //stop the pcnt unit
    vTaskDelete(TaskHandle_Counter); //remove the task
}

_Noreturn void start_humidity(void* arg) {

    gpio_set_direction(GPIO_FREQ_INPUT, GPIO_MODE_INPUT);
    gpio_set_pull_mode(GPIO_FREQ_INPUT, GPIO_PULLUP_ONLY);

    gpio_set_direction(GPIO_ENABLE,GPIO_MODE_OUTPUT);
    gpio_set_level(GPIO_ENABLE,0);
    gpio_set_pull_mode(GPIO_ENABLE,GPIO_PULLUP_ONLY);

    gpio_set_direction(GPIO_ENABLE,GPIO_MODE_OUTPUT);
    gpio_set_level(GPIO_ENABLE,1); //enable enable-pin




    pcnt_unit_config_t unit_config = {
            .high_limit = PCNT_HIGH_LIMIT,
            .low_limit = PCNT_LOW_LIMIT,
    };

    pcnt_unit = NULL;
    ESP_ERROR_CHECK(pcnt_new_unit(&unit_config, &pcnt_unit));

    pcnt_chan_config_t chan_config = {
            .edge_gpio_num = GPIO_FREQ_INPUT,
            .level_gpio_num = -1,
    };

    pcnt_channel_handle_t pcnt_chan = NULL;
    ESP_ERROR_CHECK(pcnt_new_channel(pcnt_unit, &chan_config, &pcnt_chan));

    ESP_ERROR_CHECK(pcnt_channel_set_edge_action(pcnt_chan, PCNT_CHANNEL_EDGE_ACTION_HOLD, PCNT_CHANNEL_EDGE_ACTION_INCREASE));

    ESP_ERROR_CHECK(pcnt_unit_add_watch_point(pcnt_unit, PCNT_HIGH_LIMIT));

    pcnt_event_callbacks_t cbs = {
            .on_reach = (pcnt_watch_cb_t) pcnt_event_handler
    };

    pcnt_unit_register_event_callbacks(pcnt_unit, &cbs, NULL);

    pcnt_glitch_filter_config_t filter_config={
            .max_glitch_ns=10000,
    };
    ESP_ERROR_CHECK(pcnt_unit_set_glitch_filter(pcnt_unit,&filter_config));


    xTaskCreate(counter_task,
                "counterTask",
                4096,
                NULL,
                7,
                &TaskHandle_Counter);

    while(1) vTaskDelay(1000); //keep parent task running

}


//docs: https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/peripherals/pcnt.html
//tutorial: https://lochnerweb.de/frequency-measurement-on-esp32