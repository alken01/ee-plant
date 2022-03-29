#include <stdio.h>
#include <stdlib.h>
#include <driver/mcpwm.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "pwm.h"
#include "driver/adc.h"
#include "esp_adc_cal.h"
#include "adc_read.h"
#include "driver/gpio.h"

#define TEMPERATURE_GPIO GPIO_NUM_13
#define LIGHT_GPIO GPIO_NUM_12
#define FAN_GPIO GPIO_NUM_27
#define HEATER_GPIO GPIO_NUM_4

#define DEFAULT_VREF    1100        // Use adc2_vref_to_gpio() to obtain a better estimate
#define NO_OF_SAMPLES   64          // Multisampling

static esp_adc_cal_characteristics_t *adc_chars;
#if CONFIG_IDF_TARGET_ESP32
static const adc_channel_t channel_temperature = ADC_CHANNEL_4;     //GPIO34 if ADC1, GPIO14 if ADC2
static const adc_channel_t channel_light = ADC_CHANNEL_3;
static const adc_bits_width_t width = ADC_WIDTH_BIT_12;
#elif CONFIG_IDF_TARGET_ESP32S2
static const adc_channel_t channel = ADC_CHANNEL_6;     // GPIO7 if ADC1, GPIO17 if ADC2
static const adc_bits_width_t width = ADC_WIDTH_BIT_13;
#endif
static const adc_atten_t atten = ADC_ATTEN_DB_0;
static const adc_unit_t unit = ADC_UNIT_1;

float temperature;
float light;

void config_read_light(void)
{
    gpio_reset_pin(LIGHT_GPIO);
    gpio_set_direction(LIGHT_GPIO,GPIO_MODE_OUTPUT);
    gpio_set_level(LIGHT_GPIO, 1);
}

void config_read_temp(void)
{
    gpio_reset_pin(TEMPERATURE_GPIO);
    gpio_set_direction(TEMPERATURE_GPIO,GPIO_MODE_OUTPUT);
    gpio_set_level(TEMPERATURE_GPIO, 1);
}

void reset_read_light(void)
{
    gpio_set_level(LIGHT_GPIO, 0);
}

void reset_read_temp(void)
{
    gpio_set_level(TEMPERATURE_GPIO, 0);
}

void config_adc_temperature(void)
{
    if (unit == ADC_UNIT_1) {
        adc1_config_width(width);
        adc1_config_channel_atten(channel_temperature, atten);
    } else {
        adc2_config_channel_atten((adc2_channel_t)channel_temperature, atten);
    }

    adc_chars = calloc(1, sizeof(esp_adc_cal_characteristics_t));
    esp_adc_cal_value_t val_type = esp_adc_cal_characterize(unit, atten, width, DEFAULT_VREF, adc_chars);
}

void config_adc_light(void)
{
    if (unit == ADC_UNIT_1) {
        adc1_config_width(width);
        adc1_config_channel_atten(channel_light, atten);
    } else {
        adc2_config_channel_atten((adc2_channel_t)channel_light, atten);
    }

    adc_chars = calloc(1, sizeof(esp_adc_cal_characteristics_t));
    esp_adc_cal_value_t val_type = esp_adc_cal_characterize(unit, atten, width, DEFAULT_VREF, adc_chars);
}

void adc_read(void)
{
    int con = 1;

    //Continuously sample ADC1
    while (con) {
        config_adc_temperature();
        config_read_temp();
        uint32_t adc_reading = 0;
        //Multisampling
        for (int i = 0; i < NO_OF_SAMPLES; i++) {
            if (unit == ADC_UNIT_1) {
                adc_reading += adc1_get_raw((adc1_channel_t)channel_temperature);
            } else {
                int raw;
                adc2_get_raw((adc2_channel_t)channel_temperature, width, &raw);
                adc_reading += raw;
            }
        }
        adc_reading /= NO_OF_SAMPLES;
        //Convert adc_reading to voltage in mV
        uint32_t voltage = esp_adc_cal_raw_to_voltage(adc_reading, adc_chars) - 3;
        reset_read_temp();


        config_adc_light();
        config_read_light();
        adc_reading = 0;
        for (int i = 0; i < NO_OF_SAMPLES; i++) {
            if (unit == ADC_UNIT_1) {
                adc_reading += adc1_get_raw((adc1_channel_t)channel_light);
            } else {
                int raw;
                adc2_get_raw((adc2_channel_t)channel_light, width, &raw);
                adc_reading += raw;
            }
        }
        adc_reading /= NO_OF_SAMPLES;
        uint32_t voltage2 = esp_adc_cal_raw_to_voltage(adc_reading, adc_chars);
        reset_read_light();

        //printf("Voltage: %dmV\n", voltage);
        //printf("Voltage: %dmV\n", voltage2);

        //float temperature = -(((3320.0/(voltage/1000.0))-664.0)/470) + 46.2765; // -> 5V
        temperature = -(4.616919/(voltage/1000.0)) + (47.689); // -> 3.3V
        light = (((float)voltage2 - 75.0 )/(1057.0 - 75.0))*100;
        printf("Temperature = %f °C\n", temperature);
        printf("Light = %f Percentage\n", light);
        vTaskDelay(pdMS_TO_TICKS(1000));
        con = 0;


    }

    if(temperature > 27.0)
    {
        gpio_reset_pin(FAN_GPIO);
        gpio_set_direction(FAN_GPIO,GPIO_MODE_OUTPUT);
        gpio_set_level(FAN_GPIO, 1);

        mcpwm_stop(MCPWM_UNIT_0,MCPWM_TIMER_0);


        gpio_reset_pin(HEATER_GPIO);
        gpio_set_direction(HEATER_GPIO,GPIO_MODE_OUTPUT);
        gpio_set_level(HEATER_GPIO, 0);
    }
    else
    {
        gpio_reset_pin(FAN_GPIO);
        gpio_set_direction(FAN_GPIO,GPIO_MODE_OUTPUT);
        gpio_set_level(FAN_GPIO, 0);

        mcpwm_gpio_init(MCPWM_UNIT_0, MCPWM0A, HEATER_GPIO); // To drive a RC servo, one MCPWM generator is enough
        mcpwm_config_t pwm_config = {
                .frequency = 1, // frequency = 50Hz, i.e. for every servo motor time period should be 20ms
                .cmpr_a = 0,     // duty cycle of PWMxA = 0
                .counter_mode = MCPWM_UP_COUNTER,
                .duty_mode = MCPWM_DUTY_MODE_0,
        };
        mcpwm_init(MCPWM_UNIT_0, MCPWM_TIMER_0, &pwm_config);
        mcpwm_start(MCPWM_UNIT_0,MCPWM_TIMER_0);
    }
}