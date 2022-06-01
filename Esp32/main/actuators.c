#include "appMain.h"
#include "actuators.h"
#include "water_pump.h"
#include <driver/ledc.h>


#define HEATER_OUTPUT_GPIO GPIO_NUM_17
#define FAN_OUTPUT_GPIO GPIO_NUM_16
#define LIGHT_OUTPUT_GPIO GPIO_NUM_21

ledc_channel_config_t ledc_heater_channel;



void config_heater_PWM(){
    ledc_timer_config_t ledc_timer = {
            .duty_resolution = LEDC_TIMER_13_BIT, // resolution of PWM duty
            .freq_hz = 5000,                      // frequency of PWM signal
            .speed_mode = LEDC_HIGH_SPEED_MODE,           // timer mode
            .timer_num = LEDC_TIMER_0,            // timer index
            .clk_cfg = LEDC_AUTO_CLK,              // Auto select the source clock
    };
    ledc_timer_config(&ledc_timer);

    ledc_heater_channel.channel = LEDC_CHANNEL_0;
    ledc_heater_channel.duty=0;
    ledc_heater_channel.gpio_num=HEATER_OUTPUT_GPIO;
    ledc_heater_channel.speed_mode=LEDC_HIGH_SPEED_MODE;
    ledc_heater_channel.hpoint=0;
    ledc_heater_channel.timer_sel=LEDC_TIMER_0;
    ledc_heater_channel.flags.output_invert=0;
    ledc_channel_config(&ledc_heater_channel);
}

void set_heater_pwm()
{
    ledc_set_duty(ledc_heater_channel.speed_mode, ledc_heater_channel.channel, 4000);
    ledc_update_duty(ledc_heater_channel.speed_mode, ledc_heater_channel.channel);
}

void reset_heater_pwm()
{
    ledc_set_duty(ledc_heater_channel.speed_mode, ledc_heater_channel.channel, 0);
    ledc_update_duty(ledc_heater_channel.speed_mode, ledc_heater_channel.channel);
}


_Noreturn void start_actuators(void* arg){
    config_heater_PWM();


    int light_flag=0;
    int fan_flag=0;
    int water_flag=0;
    int heater_flag=0;

    double temperature_value=0;
    double soil_moisture_value=0;
    int water_level_value=0;
    double light_value=300;



    while(1){
        //read from queues:
        struct sensor_flag_struct sensor_flag_received;
        for(int i=0; i < 4; i++){
            xQueueReceive(flag_queue,&sensor_flag_received, 100);
            if(sensor_flag_received.sensor_ID==0){ //water
                water_flag=sensor_flag_received.sensor_flag;
            }
            else if(sensor_flag_received.sensor_ID==1){ //heater
                heater_flag= sensor_flag_received.sensor_flag;
            }
            else if(sensor_flag_received.sensor_ID==2){ //lights
                light_flag= sensor_flag_received.sensor_flag;
            }
            else if(sensor_flag_received.sensor_ID==3){ //fan
                fan_flag = sensor_flag_received.sensor_flag;
            }

        }

        struct sensor_data_struct sensor_data_received;
        for(int i=0; i<4;i++){
            xQueueReceive(adc_queue,&sensor_data_received, 100);

            if(sensor_data_received.sensor_ID==1){
                temperature_value=sensor_data_received.sensor_value;
            }
            else if(sensor_data_received.sensor_ID==5){
                soil_moisture_value=sensor_data_received.sensor_value;
            }
            else if(sensor_data_received.sensor_ID==2){
                light_value=sensor_data_received.sensor_value;
            }
            else if(sensor_data_received.sensor_ID==4){
                water_level_value=(int)sensor_data_received.sensor_value;
            }

        }



        //actuator logic:
        gpio_set_direction(LIGHT_OUTPUT_GPIO, GPIO_MODE_OUTPUT);
        if(light_value<40 || light_flag==1){
            gpio_set_level(LIGHT_OUTPUT_GPIO, 1);
        }
        else{
            gpio_set_level(LIGHT_OUTPUT_GPIO, 0);//disable fan
        }

        gpio_set_direction(FAN_OUTPUT_GPIO, GPIO_MODE_OUTPUT);
        if(temperature_value>25.0){
            gpio_set_level(FAN_OUTPUT_GPIO, 1);
            reset_heater_pwm();
        }
        else{
            gpio_set_level(FAN_OUTPUT_GPIO, 0);//disable fan
            set_heater_pwm();//enable heating element
        }

        if(fan_flag==1){
            gpio_set_level(FAN_OUTPUT_GPIO, 1);
        }
        if(heater_flag == 1){
            set_heater_pwm();//enable heating element
        }


        if((soil_moisture_value>30 || water_flag==1) && water_level_value>300){ //if its dry and there is water or if the flag is set and there is water
            //water_for_5s();
        }

    }

}