#include <stdlib.h>
#include <driver/ledc.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "appMain.h"
#include <driver/adc.h>
#include "esp_adc_cal.h"
#include "driver/gpio.h"

#define TEMPERATURE_ENABLE_GPIO GPIO_NUM_19
#define LIGHT_ENABLE_GPIO GPIO_NUM_18
#define MOISTURE_ENABLE_GPIO GPIO_NUM_5
#define LEVEL_ENABLE_GPIO GPIO_NUM_27

#define DEFAULT_VREF    1100
#define NO_OF_SAMPLES   64          // Multisampling

static esp_adc_cal_characteristics_t *adc_chars;

static const adc_channel_t channel_temperature = ADC_CHANNEL_6;
static const adc_channel_t channel_light = ADC_CHANNEL_0;
static const adc_channel_t channel_moisture = ADC_CHANNEL_3;
static const adc_channel_t channel_level = ADC_CHANNEL_5;

/* ADC CHANNEL LIST
 * ADC_CHANNEL_0 -> GPIO36 (PIN A4)
 * ADC_CHANNEL_1 -> NOT FOUND
 * ADC_CHANNEL_2 -> NOT FOUND
 * ADC_CHANNEL_3 -> GPIO39 (PIN A3)
 * ADC_CHANNEL_4 -> GPIO32 (PIN32)
 * ADC_CHANNEL_5 -> GPIO33 (PIN33)
 * ADC_CHANNEL_6 -> GPIO34 (PIN A2)
 * ADC_CHANNEL_7 -> NOT FOUND (when floating value = 2080, weird normally =142)
 * ADC_CHANNEL_8 -> NOT A ADC1 CHANNEL
 * ADC_CHANNEL_9 -> NOT A ADC1 CHANNEL
 * */




ledc_channel_config_t ledc_heater_channel;



void config_read_light(void)
{
    gpio_reset_pin(LIGHT_ENABLE_GPIO);
    gpio_set_direction(LIGHT_ENABLE_GPIO, GPIO_MODE_OUTPUT);
    gpio_set_level(LIGHT_ENABLE_GPIO, 1);
}

void config_read_temp(void)
{
    gpio_reset_pin(TEMPERATURE_ENABLE_GPIO);
    gpio_set_direction(TEMPERATURE_ENABLE_GPIO, GPIO_MODE_OUTPUT);
    gpio_set_level(TEMPERATURE_ENABLE_GPIO, 1);
}

void config_read_moisture(void)
{
    gpio_reset_pin(MOISTURE_ENABLE_GPIO);
    gpio_set_direction(MOISTURE_ENABLE_GPIO, GPIO_MODE_OUTPUT);
    gpio_set_level(MOISTURE_ENABLE_GPIO, 1);
}

void config_read_level(void){
    gpio_reset_pin(LEVEL_ENABLE_GPIO);
    gpio_set_direction(LEVEL_ENABLE_GPIO, GPIO_MODE_OUTPUT);
    gpio_set_level(LEVEL_ENABLE_GPIO, 1);
}

void reset_read_light(void){
    gpio_set_level(LIGHT_ENABLE_GPIO, 0);
}

void reset_read_temp(void)
{
    gpio_set_level(TEMPERATURE_ENABLE_GPIO, 0);
}
void reset_read_moisture(void)
{
    gpio_set_level(MOISTURE_ENABLE_GPIO, 0);
}

void reset_read_level(void)
{
    gpio_set_level(LEVEL_ENABLE_GPIO, 0);
}


void configADC(void){
    static const adc_bits_width_t width=ADC_WIDTH_BIT_12;
    static const adc_atten_t attenuation= ADC_ATTEN_DB_11;

    adc_chars = calloc(1, sizeof(esp_adc_cal_characteristics_t));
    esp_adc_cal_value_t val_type = esp_adc_cal_characterize(ADC_UNIT_1,attenuation,width,DEFAULT_VREF,adc_chars);

    adc1_config_width(width);
    adc1_config_channel_atten((adc1_channel_t) channel_temperature, attenuation);
    adc1_config_channel_atten((adc1_channel_t) channel_light, attenuation);
    adc1_config_channel_atten((adc1_channel_t) channel_moisture, attenuation);
    adc1_config_channel_atten((adc1_channel_t) channel_level, attenuation);
}

uint32_t read_temperature(void){
    uint32_t reading = adc1_get_raw((adc1_channel_t) channel_temperature);
    uint32_t temperature_voltage = esp_adc_cal_raw_to_voltage(reading,adc_chars);
    return temperature_voltage;
}

uint32_t read_moisture(void){
    uint32_t reading = adc1_get_raw((adc1_channel_t) channel_moisture);
    uint32_t moisture_voltage = esp_adc_cal_raw_to_voltage(reading,adc_chars);
    return moisture_voltage;
}

uint32_t read_light(void){
    uint32_t reading = adc1_get_raw((adc1_channel_t) channel_light);
    uint32_t light_voltage = esp_adc_cal_raw_to_voltage(reading,adc_chars);
    return light_voltage;
}

uint32_t read_level(void){
    uint32_t reading = adc1_get_raw((adc1_channel_t) channel_level);
    uint32_t level_voltage = esp_adc_cal_raw_to_voltage(reading,adc_chars);
    return level_voltage;
}


_Noreturn void start_adc(void* arg)
{
    configADC();

    while(1){

        //********* sensors *********//

        config_read_temp(); //enable the sensor
        vTaskDelay(50); //wait half a second
        uint32_t temperature_voltage = read_temperature();
        //reset_read_temp(); //disable the sensor


        config_read_moisture();
        vTaskDelay(50); //wait half a second
        uint32_t moisture_voltage = read_moisture();
        reset_read_moisture(); //disable the sensor


        config_read_light();
        vTaskDelay(50); //wait half a second
        uint32_t light_voltage = read_light();
        reset_read_light(); //disable the sensor


        config_read_level();
        vTaskDelay(50); //wait half a second
        uint32_t level_voltage = read_level();
        reset_read_level();

        double temperature_value = -(69.5319/(temperature_voltage/1000.0)) + (67.55);
        double water_level_value = (int)level_voltage;
        double light_value = (((float)light_voltage - 96)/(2304))*100;
        double soil_moisture_value = 0;
        if(moisture_voltage<300){
            soil_moisture_value=0;
        }
        else if(moisture_voltage<700){
            soil_moisture_value= (double)(700-moisture_voltage)/(700-300)*100;
        }
        else soil_moisture_value= 100;

        /*
        printf("sensor raw values: temp: %d soil: %d light: %d water: %d\n",temperature_voltage,moisture_voltage,light_voltage,level_voltage);
        printf("sensor values: temp: %f soil: %f light: %f water: %f\n",temperature_value,soil_moisture_value,light_value,water_level_value);
        */

        struct sensor_data_struct sensor_data;
        //temperature
        sensor_data.sensor_ID=1;
        sensor_data.sensor_value = temperature_value;
        xQueueSend(queue,&sensor_data,portMAX_DELAY);
        xQueueSend(adc_queue,&sensor_data,portMAX_DELAY);

        //moisture
        sensor_data.sensor_ID=5;
        sensor_data.sensor_value=soil_moisture_value;
        xQueueSend(queue,&sensor_data,portMAX_DELAY);
        xQueueSend(adc_queue,&sensor_data,portMAX_DELAY);

        //light
        sensor_data.sensor_ID=2;
        sensor_data.sensor_value=light_value;
        xQueueSend(queue,&sensor_data,portMAX_DELAY);
        xQueueSend(adc_queue,&sensor_data,portMAX_DELAY);

        //water_level
        sensor_data.sensor_ID=4;
        sensor_data.sensor_value=water_level_value;
        xQueueSend(queue,&sensor_data,portMAX_DELAY);
        xQueueSend(adc_queue,&sensor_data,portMAX_DELAY);


        vTaskDelay(100*30); //wait 30 seconds before reading again
    }
}
