#include <stdio.h>
#include <stdbool.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"
#include "freertos/timers.h"
#include "water_pump.h"

#define PUMP_GPIO   GPIO_NUM_23

void pump_config(void)
{
    gpio_reset_pin(PUMP_GPIO);
    gpio_set_direction( PUMP_GPIO , GPIO_MODE_OUTPUT);
    gpio_set_level(PUMP_GPIO, 0);
}

void myTimerCallBack(TimerHandle_t xTimer)
{
    const char *strTimerName;
    strTimerName = pcTimerGetName(xTimer);
    printf("Timer: %s done! \nPlants watered\n", strTimerName);
    gpio_set_level(PUMP_GPIO, 0);
}

void water_for_5s(void)
{
    pump_config();
    gpio_set_level(PUMP_GPIO, 1);
    TimerHandle_t  Timer_pump = NULL;
    Timer_pump = xTimerCreate("Timer_pump", pdMS_TO_TICKS(5000), pdFALSE, (void *) 1, myTimerCallBack);
    xTimerStart(Timer_pump, 0);
}







