#include <sys/cdefs.h>
#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"
#include "driver/pulse_cnt.h"


#define GPIO_FREQ GPIO_NUM_21
#define MEASURE_TIME 3 //measuring time in seconds
#define CALIBRATION_VALUE 0 //calibration value for frequency
#define EXAMPLE_PCNT_HIGH_LIMIT 2000
#define EXAMPLE_PCNT_LOW_LIMIT  -1


int overflow_counter=0;
pcnt_unit_handle_t pcnt_unit;

int sensor_value_arr[18]= {7155,7080,7010,6945,6880,6820,6760,6705,6650,6600,6550,6500,6450,6400,6355,6305,6260,6210};
int humidity_value_arr[18]= {10,15,20,25,30,35,40,45,50,55,60,65,70,75,80,85,90,95};

void IRAM_ATTR pcnt_event_handler(void* arg){
    overflow_counter++;
    pcnt_unit_clear_count(pcnt_unit); //reset counter

}

void pcnt_get_counter(void* args) {
    int result;
    pcnt_unit_get_count(pcnt_unit, (int *)&result);
    int counts = result + (overflow_counter * EXAMPLE_PCNT_HIGH_LIMIT); //total amount of counts
    printf("counts: %d\n", counts);
    int frequency = ((counts)/MEASURE_TIME);
    printf("frequency: %d\n",frequency);

    //get Frequency:
    int index=0;
    while(frequency<sensor_value_arr[index]){
        index++;
    }
    //interpolate
    double humidity;
    if(index>0) {
        double inter = (double)(sensor_value_arr[index - 1] - (frequency-CALIBRATION_VALUE)) / (sensor_value_arr[index - 1] - sensor_value_arr[index]);
        humidity= humidity_value_arr[index-1] - inter * (humidity_value_arr[index-1]-humidity_value_arr[index]);
    }
    else if(index >18){
        humidity=95; //max humidity level that can be measured
    }
    else{
        humidity=5; //min humidity level that can be detected
    }
    printf("index: %d\n",index);
    printf("humidity: %f\n\n",humidity);

}


_Noreturn void counter_task(void* arg) {

    while (1) {
        TickType_t last_wake_time = xTaskGetTickCount();

        overflow_counter=0;
        pcnt_unit_clear_count(pcnt_unit);
        pcnt_unit_start(pcnt_unit);

        vTaskDelayUntil(&last_wake_time,(MEASURE_TIME - MEASURE_TIME*0.175)*100);
        last_wake_time = xTaskGetTickCount();
        //vTaskDelay(100* (MEASURE_TIME-MEASURE_TIME*0.145)); //gecalibreerde waarde zodat het klopt. stray cap = 21pF so 12% so value could come from there

        pcnt_unit_stop(pcnt_unit);
        pcnt_get_counter(NULL);
    }


    pcnt_unit_stop(pcnt_unit); //won't reach but if the application is closed this should be called

}

    void start_humidity(void) {

    gpio_set_direction(GPIO_FREQ, GPIO_MODE_INPUT);
    gpio_set_pull_mode(GPIO_FREQ,GPIO_FLOATING);


    pcnt_unit_config_t unit_config = {
            .high_limit = EXAMPLE_PCNT_HIGH_LIMIT,
            .low_limit = EXAMPLE_PCNT_LOW_LIMIT,
    };

    pcnt_unit = NULL;
    ESP_ERROR_CHECK(pcnt_new_unit(&unit_config, &pcnt_unit));

    pcnt_chan_config_t chan_config = {
            .edge_gpio_num = GPIO_FREQ,
            .level_gpio_num = -1,
    };

    pcnt_channel_handle_t pcnt_chan = NULL;
    ESP_ERROR_CHECK(pcnt_new_channel(pcnt_unit, &chan_config, &pcnt_chan));

    ESP_ERROR_CHECK(pcnt_channel_set_edge_action(pcnt_chan, PCNT_CHANNEL_EDGE_ACTION_INCREASE, PCNT_CHANNEL_EDGE_ACTION_HOLD));

    ESP_ERROR_CHECK(pcnt_unit_add_watch_point(pcnt_unit, EXAMPLE_PCNT_HIGH_LIMIT));

    pcnt_event_callbacks_t cbs = {
            .on_reach = (pcnt_watch_cb_t) pcnt_event_handler
    };

    pcnt_unit_register_event_callbacks(pcnt_unit, &cbs, NULL);



    xTaskCreate(counter_task,
                "counterTask",
                4096,
                NULL,
                7,
                NULL);

}


//###########################################################################"



//docs: https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/peripherals/pcnt.html
//tutorial: https://lochnerweb.de/frequency-measurement-on-esp32
