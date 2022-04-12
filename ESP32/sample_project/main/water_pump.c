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
    printf("Timer: %s done! \nPlants watered\n", strTimerName);
    gpio_set_level(PUMP_GPIO, 0);
}

void water_for_5s(void)
{
    gpio_set_level(PUMP_GPIO, 1);
    TimerHandle_t  Timer_pump = NULL;
    Timer_pump = xTimerCreate("Timer_pump", pdMS_TO_TICKS(5000), pdFALSE, (void *) 1, myTimerCallBack);
    xTimerStart(Timer_pump, 0);
}

void full_tank(void)
{
    tank_empty = false;
    printf(" full tank: water refilled \n");
}

void almost_full_tank(void)
{
    printf("almost full tank: \n");
}

void empty_tank(void)
{
    tank_empty = true;
    printf("tank empty: please refill water \n");
}

void almost_empty_tank(void)
{
    printf("tank almost empty: please refill water\n ");

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

// MAIN FUNCTIONS

void read_level(void)
{
    input_config(); //resets and sets pins as input
    vTaskDelay(100);
    pump_config(); //resets and sets pin as initial low output
    vTaskDelay(100);
    read_pins(); //get pin value 0 or 1
    vTaskDelay(100);

    //conditions

    if( high == 1 && mid == 1 && low == 1 )
    {
        full_tank();

    }
    if(high == 0 && mid == 1 && low == 1)
    {
        almost_full_tank();
    }
    if(high == 0 && mid == 0 && low == 1)
    {
        almost_empty_tank();
    }
    if(high == 0 && mid == 0 && low == 0)
    {
        empty_tank();
    }
}

void pump(void)
{
    if(!tank_empty)
    {
        water_for_5s();
    }
    else
    {
        printf("Please refill water first. \n");
    }
}


