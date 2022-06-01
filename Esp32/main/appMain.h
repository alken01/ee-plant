#ifndef appMain
#define appMain

#include "AirHumidity.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/queue.h"
#include "https_request.h"
#include <string.h>
#include "driver/gpio.h"
#include "wifi.h"
#include "adc.h"
#include "actuators.h"

#define QUEUE_SIZE 100



QueueHandle_t queue;
QueueHandle_t flag_queue;
QueueHandle_t adc_queue;


struct sensor_flag_struct{
    int sensor_ID;
    int sensor_flag;
};

struct sensor_data_struct{
    int sensor_ID;
    double sensor_value;
};

#endif