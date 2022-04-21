#include "freertos/FreeRTOS.h"
#include <freertos/task.h>
#include <FreeRTOSConfig.h>
#include "adc_read.h"
#include "wifi.h"
#include "pwm.h"
#include "sdkconfig.h"
#include <stdio.h>
#include "freertos/task.h"
#include "driver/gpio.h"
#include "sdkconfig.h"
#include "water_pump.h"
#include "https_request.h"
//void adc_read(void *pvParameter);



void app_main(void)
{
    //xTaskCreate(&adc_read, "adc_read", configMINIMAL_STACK_SIZE, NULL, 1, NULL);
    wifi();

    //while(1) {
        //adc_read();
        //pwm();
    //}
}