#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"
#include "freertos/timers.h"
#include "water_pump.h"

#define PUMP_GPIO   GPIO_NUM_23
TimerHandle_t  timer_pump = NULL;


void pump_config(void)
{
    gpio_reset_pin(PUMP_GPIO);
    gpio_set_direction( PUMP_GPIO , GPIO_MODE_OUTPUT);
    gpio_set_level(PUMP_GPIO, 0);
}

void myTimerCallBack(TimerHandle_t xTimer){
    gpio_set_level(PUMP_GPIO, 0);
    xTimerDelete(timer_pump,10);
}

void water_for_5s(void)
{
    pump_config();
    gpio_set_level(PUMP_GPIO, 1);
    timer_pump = xTimerCreate("Timer_pump", pdMS_TO_TICKS(5*1000), pdFALSE, (void *) 1, myTimerCallBack);
    xTimerStart(timer_pump, 0);
}







