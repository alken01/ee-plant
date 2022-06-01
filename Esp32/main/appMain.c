#include <sys/cdefs.h>
#include "appMain.h"

TaskHandle_t TaskHandle_Write_Https; //producer task for queue
TaskHandle_t TaskHandle_Read_Https; //consumer task for queue



_Noreturn void start_sql_write(void* arg){
    struct sensor_data_struct sensor_data_received;
    while(1){
        for(int i=0; i < QUEUE_SIZE; i++){
            xQueueReceive(queue,&sensor_data_received,portMAX_DELAY);

            char URL_base[100]="https://a21iot02.studev.groept.be/database/putSensorData.php?amount=";
            char sensor_value_string[10];
            snprintf(sensor_value_string,10,"%f",sensor_data_received.sensor_value);
            strcat(URL_base, sensor_value_string);
            strcat(URL_base,"&sensor=");
            snprintf(sensor_value_string,10,"%d",sensor_data_received.sensor_ID);
            strcat(URL_base,sensor_value_string);
            printf("%s\n",URL_base);
            //printf("writing!\n");
            xTaskCreate(https_write_with_url, "https_write_task", 8192, (void*)&URL_base, 5, &TaskHandle_Write_Https);
            vTaskDelay(400);//wait 4 seconds before next data is sent
            //we can increase this value to 20/5 = 4 as 5 values will come in every 20 seconds
        }
    }
}

_Noreturn void start_sql_read(void* arg){
    while(1){
        //printf("reading!\n");
        char URL_base[100]="https://a21iot02.studev.groept.be/database/getLed.php";
        xTaskCreate(https_read_with_url, "https_read_task", 8192, (void*)&URL_base, 5, &TaskHandle_Read_Https);
        vTaskDelay(400); //read every 5 seconds
    }
}


_Noreturn void app_main(void){
    wifi();//init WIFI

    queue = xQueueCreate(QUEUE_SIZE, sizeof(struct sensor_data_struct));
    if(queue == NULL){
        printf("Error creating the queue");
    }

    flag_queue = xQueueCreate(QUEUE_SIZE, sizeof(struct sensor_flag_struct));
    if(flag_queue== NULL){
        printf("Error creating the flag_queue");
    }

    adc_queue = xQueueCreate(QUEUE_SIZE, sizeof(struct sensor_data_struct));
    if(adc_queue == NULL){
        printf("Error creating the queue");
    }



    TaskHandle_t TaskHandle_Humidity; //producer task for queue
    xTaskCreate(start_humidity,
                "HumidityTask",
                1024*2,
                NULL,
                3,
    &TaskHandle_Humidity);


    TaskHandle_t TaskHandle_ADC;//producer task for light/soil-moisture/temperature

    xTaskCreate(start_adc,
                "ADCTask",
                1024*4,
                NULL,
                3,
                &TaskHandle_ADC);


    TaskHandle_t TaskHandle_SQL_Write;//consumer task for queue
    xTaskCreate(start_sql_write,
                "SQLTask",
                1024*4,
                NULL,
                3,
                &TaskHandle_SQL_Write);

    TaskHandle_t TaskHandle_SQL_Read;//consumer task for queue
    xTaskCreate(start_sql_read,
                "SQLTask",
                1024*4,
                NULL,
                3,
                &TaskHandle_SQL_Read);

    TaskHandle_t TaskHandle_Actuators;//consumer/producer task
    xTaskCreate(start_actuators,
                "Actuator_ask",
                1024*4,
                NULL,
                3,
                &TaskHandle_Actuators);


    while(1) vTaskDelay(100000);// make this task run infinitly

    // needed when we don't run it forever and need clean up
    stop_humidity(NULL); //stop the tasks and modules created by the humidity task
    vTaskDelete(TaskHandle_Humidity);//stop the humidity task
    vTaskDelete(TaskHandle_ADC);
    vTaskDelete(TaskHandle_Actuators);
    vTaskDelete(TaskHandle_SQL_Write);
    vTaskDelete(TaskHandle_SQL_Read);

    esp_restart();

}