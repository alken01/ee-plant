#include <stdio.h>
#include <stdlib.h>
#include <driver/mcpwm.h>
#include <driver/ledc.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "pwm.h"
#include "driver/adc.h"
#include "esp_adc_cal.h"
#include "adc_read.h"
#include "driver/gpio.h"
#include "water_pump.h"

#define TEMPERATURE_GPIO GPIO_NUM_13
#define LIGHT_GPIO GPIO_NUM_12
#define FAN_GPIO GPIO_NUM_27
#define HEATER_GPIO GPIO_NUM_4
#define MOISTURE_GPIO GPIO_NUM_5
#define LEVEL_GPIO GPIO_NUM_27

#define DEFAULT_VREF    1100        // Use adc2_vref_to_gpio() to obtain a better estimate
#define NO_OF_SAMPLES   64          // Multisampling

static esp_adc_cal_characteristics_t *adc_chars;
#if CONFIG_IDF_TARGET_ESP32
static const adc_channel_t channel_temperature = ADC_CHANNEL_1;     //GPIO34 if ADC1, GPIO14 if ADC2
static const adc_channel_t channel_light = ADC_CHANNEL_4;
static const adc_channel_t channel_moisture = ADC_CHANNEL_4;
static const adc_channel_t channel_level = ADC_CHANNEL_9;
static const adc_bits_width_t width = ADC_WIDTH_BIT_12;
#elif CONFIG_IDF_TARGET_ESP32S2
static const adc_channel_t channel = ADC_CHANNEL_6;     // GPIO7 if ADC1, GPIO17 if ADC2
static const adc_bits_width_t width = ADC_WIDTH_BIT_13;
#endif
static const adc_atten_t atten = ADC_ATTEN_DB_0;
static const adc_unit_t unit = ADC_UNIT_1;

float temperature;
float light;
float moisture;
int water_level;

bool tank_empty = false;

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

void config_read_moisture(void)
{
    gpio_reset_pin(MOISTURE_GPIO);
    gpio_set_direction(MOISTURE_GPIO,GPIO_MODE_OUTPUT);
    gpio_set_level(MOISTURE_GPIO, 1);
}

void config_read_level(void)
{
    gpio_reset_pin(LEVEL_GPIO);
    gpio_set_direction(LEVEL_GPIO, GPIO_MODE_OUTPUT);
    gpio_set_level(LEVEL_GPIO, 1);
}

void reset_read_light(void)
{
    gpio_set_level(LIGHT_GPIO, 0);
}

void reset_read_temp(void)
{
    gpio_set_level(TEMPERATURE_GPIO, 0);
}
void reset_read_moisture(void)
{
    gpio_set_level(MOISTURE_GPIO, 0);
}

void reset_read_level(void)
{
    gpio_set_level(LEVEL_GPIO, 0);
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
    //esp_adc_cal_value_t val_type = esp_adc_cal_characterize(unit, atten, width, DEFAULT_VREF, adc_chars);
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
    //esp_adc_cal_value_t val_type = esp_adc_cal_characterize(unit, atten, width, DEFAULT_VREF, adc_chars);
}

void config_adc_moisture(void)
{
    if (unit == ADC_UNIT_1) {
        adc1_config_width(width);
        adc1_config_channel_atten(channel_moisture, atten);
    } else {
        adc2_config_channel_atten((adc2_channel_t)channel_moisture, atten);
    }

    adc_chars = calloc(1, sizeof(esp_adc_cal_characteristics_t));
    //esp_adc_cal_value_t val_type = esp_adc_cal_characterize(unit, atten, width, DEFAULT_VREF, adc_chars);
}

void config_adc_level(void)
{
    if (unit == ADC_UNIT_1) {
        adc1_config_width(width);
        adc1_config_channel_atten(channel_level, atten);
    } else {
        adc2_config_channel_atten((adc2_channel_t)channel_level, atten);
    }

    adc_chars = calloc(1, sizeof(esp_adc_cal_characteristics_t));
    //esp_adc_cal_value_t val_type = esp_adc_cal_characterize(unit, atten, width, DEFAULT_VREF, adc_chars);
}

void set_pwm(void)
{
    ledc_timer_config_t ledc_timer = {
            .duty_resolution = LEDC_TIMER_13_BIT, // resolution of PWM duty
            .freq_hz = 5000,                      // frequency of PWM signal
            .speed_mode = LEDC_HIGH_SPEED_MODE,           // timer mode
            .timer_num = LEDC_TIMER_0,            // timer index
            .clk_cfg = LEDC_AUTO_CLK,              // Auto select the source clock
    };
    ledc_timer_config(&ledc_timer);
    ledc_channel_config_t ledc_channel = {
            .channel    = LEDC_CHANNEL_0,
            .duty       = 0,
            .gpio_num   = 33,
            .speed_mode = LEDC_HIGH_SPEED_MODE,
            .hpoint     = 0,
            .timer_sel  = LEDC_TIMER_0,
            .flags.output_invert = 0
    };
    ledc_channel_config(&ledc_channel);
    ledc_set_duty(ledc_channel.speed_mode, ledc_channel.channel, 4000);
    ledc_update_duty(ledc_channel.speed_mode, ledc_channel.channel);
}

void reset_pwm(void)
{
    ledc_timer_config_t ledc_timer = {
            .duty_resolution = LEDC_TIMER_13_BIT, // resolution of PWM duty
            .freq_hz = 5000,                      // frequency of PWM signal
            .speed_mode = LEDC_HIGH_SPEED_MODE,           // timer mode
            .timer_num = LEDC_TIMER_0,            // timer index
            .clk_cfg = LEDC_AUTO_CLK,              // Auto select the source clock
    };
    ledc_timer_config(&ledc_timer);
    ledc_channel_config_t ledc_channel = {
            .channel    = LEDC_CHANNEL_0,
            .duty       = 0,
            .gpio_num   = 33,
            .speed_mode = LEDC_HIGH_SPEED_MODE,
            .hpoint     = 0,
            .timer_sel  = LEDC_TIMER_0,
            .flags.output_invert = 0
    };
    ledc_channel_config(&ledc_channel);
    ledc_set_duty(ledc_channel.speed_mode, ledc_channel.channel, 0);
    ledc_update_duty(ledc_channel.speed_mode, ledc_channel.channel);
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

        vTaskDelay(1000);


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

        vTaskDelay(1000);

        config_adc_moisture();
        config_read_moisture();
        adc_reading = 0;
        for (int i = 0; i < NO_OF_SAMPLES; i++) {
            if (unit == ADC_UNIT_1) {
                adc_reading += adc1_get_raw((adc1_channel_t)channel_moisture);
            } else {
                int raw;
                adc2_get_raw((adc2_channel_t)channel_moisture, width, &raw);
                adc_reading += raw;
            }
        }
        adc_reading /= NO_OF_SAMPLES;
        uint32_t moisture_value = adc_reading; //esp_adc_cal_raw_to_voltage(adc_reading, adc_chars);
        reset_read_moisture();

        vTaskDelay(1000);

        config_adc_level();
        config_read_level();
        adc_reading = 0;
        for (int i = 0; i < NO_OF_SAMPLES; i++) {
            if (unit == ADC_UNIT_1) {
                adc_reading += adc1_get_raw((adc1_channel_t)channel_level);
            }
            else {
                int raw;
                adc2_get_raw((adc2_channel_t)channel_level, width, &raw);
                adc_reading += raw;
            }
        }
        adc_reading /= NO_OF_SAMPLES;
        uint32_t level_voltage = esp_adc_cal_raw_to_voltage(adc_reading, adc_chars);
        reset_read_level();

        //printf("Voltage: %dmV\n", voltage);
        //printf("Voltage: %dmV\n", voltage2);

        //float temperature = -(((3320.0/(voltage/1000.0))-664.0)/470) + 46.2765; // -> 5V
        temperature = -(4.616919/(voltage/1000.0)) + (47.689); // -> 3.3V
        light = (((float)voltage2 - 75.0 )/(1057.0 - 75.0))*100;
        moisture = ((float)moisture_value/2000)*100; //max moisture value = 2000 in water
        water_level = (int)level_voltage;
        printf("Temperature = %f °C\n", temperature);
        printf("Light = %f Percentage\n", light);
        printf("Soil = %f \n", moisture);
        vTaskDelay(pdMS_TO_TICKS(1000));
        con = 0;
    }

    if(light < 50)
    {
        gpio_set_level(LIGHT_GPIO, 1);
    }
    else
    {
        gpio_set_level(LIGHT_GPIO, 0);
    }

    if(temperature > 21.5)
    {
        gpio_reset_pin(FAN_GPIO);
        gpio_set_direction(FAN_GPIO,GPIO_MODE_OUTPUT);
        gpio_set_level(FAN_GPIO, 1);

        reset_pwm();

        //gpio_reset_pin(HEATER_GPIO);
        //gpio_set_direction(HEATER_GPIO,GPIO_MODE_OUTPUT);
        //gpio_set_level(HEATER_GPIO, 0);
    }
    else
    {
        gpio_reset_pin(FAN_GPIO);
        gpio_set_direction(FAN_GPIO,GPIO_MODE_OUTPUT);
        gpio_set_level(FAN_GPIO, 0);

        set_pwm();

        //gpio_reset_pin(HEATER_GPIO);
        //gpio_set_direction(HEATER_GPIO,GPIO_MODE_OUTPUT);
        //gpio_set_level(HEATER_GPIO, 1);
    }

    //FILL THIS IN

    if(water_level < 300)
    {
        tank_empty = true;
    }
    else
    {
        tank_empty = false;
    }

    if(moisture  < 30 ) //random value
    {
        if(!tank_empty)
        {
            water_for_5s();
        }
    }
}