#include <stdio.h>
#include <stdbool.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"
#include "freertos/timers.h"
#include "water_pump.h"

#define WATER_LEVEL_HIGH_GPIO GPIO_NUM_32
#define WATER_LEVEL_MID_GPIO GPIO_NUM_33
#define WATER_LEVEL_LOW_GPIO GPIO_NUM_34
#define PUMP_GPIO   GPIO_NUM_27

bool tank_full = true;
bool tank_empty = false;
int low;
int mid;
int high;

void myTimerCallBack(TimerHandle_t xTimer)
{
    const char *strTimerName;
    strTimerName = pcTimerGetName(xTimer);
    printf("Timer Name = %s!  \n", strTimerName);
    gpio_set_level(PUMP_GPIO, 0);
}

void water_for_5s(void)
{
    TimerHandle_t  myTimer1 = NULL;

    myTimer1 = xTimerCreate("myTimer1", pdMS_TO_TICKS(5000), pdTRUE, (void *) 1, myTimerCallBack);
    xTimerStart(myTimer1, 0);
}

void full_tank(void)
{
    printf("water refilled");
}

void empty_tank(void)
{
    tank_empty = true;
    printf("please refill water");
}

void pin_config(gpio_num_t PIN)
{
    gpio_reset_pin(PIN);
    gpio_set_direction(PIN , GPIO_MODE_INPUT);
}

void input_config(void)
{
    pin_config(WATER_LEVEL_LOW_GPIO);
    pin_config(WATER_LEVEL_MID_GPIO);
    pin_config(WATER_LEVEL_HIGH_GPIO);
}

void read_pins(void)
{
    low = gpio_get_level(WATER_LEVEL_LOW_GPIO);
    mid = gpio_get_level(WATER_LEVEL_MID_GPIO);
    high = gpio_get_level(WATER_LEVEL_HIGH_GPIO);
}

void pump_config(void)
{
    gpio_reset_pin(PUMP_GPIO);
    gpio_set_direction( PUMP_GPIO , GPIO_MODE_OUTPUT);
    gpio_set_level(PUMP_GPIO, 0);
}



void water_pump(void)
{
    input_config(); //resets and sets pins as input
    pump_config(); //resets and sets pin as initial low output
    read_pins(); //get pin value 0 or 1


    //conditions

    if( high == 1 && mid == 1 && low == 1 )
    {
        full_tank();
    }

    if(low != 1)
    {
        gpio_set_level(PUMP_GPIO, 1);
        water_for_5s();
    }
    else
    {
        empty_tank();
    }


}


