cmake_minimum_required(VERSION 3.21)
project(a21iot02 C)

set(CMAKE_C_STANDARD 11)

add_executable(a21iot02
        ESP32/adc_sensors/adc_WaterLevelSensor.c
        ESP32/esp-idf-master/examples/get-started/sample_project/main/main/main.c)
