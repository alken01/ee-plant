# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.21

# compile ASM with /home/tuur/.espressif/tools/xtensa-esp32-elf/esp-2021r2-patch3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc
# compile C with /home/tuur/.espressif/tools/xtensa-esp32-elf/esp-2021r2-patch3-8.4.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc
ASM_DEFINES = -DMBEDTLS_CONFIG_FILE=\"mbedtls/esp_config.h\" -DUNITY_INCLUDE_CONFIG_H

ASM_INCLUDES = -I/home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/config -I/home/tuur/a21iot02/ESP32/sample_project/main -I/home/tuur/esp-idf-master/components/newlib/platform_include -I/home/tuur/esp-idf-master/components/freertos/FreeRTOS-Kernel/include -I/home/tuur/esp-idf-master/components/freertos/esp_additions/include/freertos -I/home/tuur/esp-idf-master/components/freertos/FreeRTOS-Kernel/portable/xtensa/include -I/home/tuur/esp-idf-master/components/freertos/esp_additions/include -I/home/tuur/esp-idf-master/components/esp_hw_support/include -I/home/tuur/esp-idf-master/components/esp_hw_support/include/soc -I/home/tuur/esp-idf-master/components/esp_hw_support/include/soc/esp32 -I/home/tuur/esp-idf-master/components/esp_hw_support/port/esp32/. -I/home/tuur/esp-idf-master/components/heap/include -I/home/tuur/esp-idf-master/components/log/include -I/home/tuur/esp-idf-master/components/lwip/include/apps -I/home/tuur/esp-idf-master/components/lwip/include/apps/sntp -I/home/tuur/esp-idf-master/components/lwip/lwip/src/include -I/home/tuur/esp-idf-master/components/lwip/port/esp32/include -I/home/tuur/esp-idf-master/components/lwip/port/esp32/include/arch -I/home/tuur/esp-idf-master/components/soc/include -I/home/tuur/esp-idf-master/components/soc/esp32/. -I/home/tuur/esp-idf-master/components/soc/esp32/include -I/home/tuur/esp-idf-master/components/hal/esp32/include -I/home/tuur/esp-idf-master/components/hal/include -I/home/tuur/esp-idf-master/components/hal/platform_port/include -I/home/tuur/esp-idf-master/components/esp_rom/include -I/home/tuur/esp-idf-master/components/esp_rom/include/esp32 -I/home/tuur/esp-idf-master/components/esp_rom/esp32 -I/home/tuur/esp-idf-master/components/esp_common/include -I/home/tuur/esp-idf-master/components/esp_system/include -I/home/tuur/esp-idf-master/components/esp_system/port/soc -I/home/tuur/esp-idf-master/components/esp_system/port/include/private -I/home/tuur/esp-idf-master/components/xtensa/include -I/home/tuur/esp-idf-master/components/xtensa/esp32/include -I/home/tuur/esp-idf-master/components/driver/include -I/home/tuur/esp-idf-master/components/driver/esp32/include -I/home/tuur/esp-idf-master/components/driver/deprecated -I/home/tuur/esp-idf-master/components/esp_pm/include -I/home/tuur/esp-idf-master/components/esp_ringbuf/include -I/home/tuur/esp-idf-master/components/efuse/include -I/home/tuur/esp-idf-master/components/efuse/esp32/include -I/home/tuur/esp-idf-master/components/vfs/include -I/home/tuur/esp-idf-master/components/esp_wifi/include -I/home/tuur/esp-idf-master/components/esp_event/include -I/home/tuur/esp-idf-master/components/esp_netif/include -I/home/tuur/esp-idf-master/components/esp_eth/include -I/home/tuur/esp-idf-master/components/tcpip_adapter/include -I/home/tuur/esp-idf-master/components/esp_phy/include -I/home/tuur/esp-idf-master/components/esp_phy/esp32/include -I/home/tuur/esp-idf-master/components/esp_timer/include -I/home/tuur/esp-idf-master/components/mbedtls/port/include -I/home/tuur/esp-idf-master/components/mbedtls/mbedtls/include -I/home/tuur/esp-idf-master/components/mbedtls/esp_crt_bundle/include -I/home/tuur/esp-idf-master/components/app_update/include -I/home/tuur/esp-idf-master/components/spi_flash/include -I/home/tuur/esp-idf-master/components/bootloader_support/include -I/home/tuur/esp-idf-master/components/bootloader_support/bootloader_flash/include -I/home/tuur/esp-idf-master/components/nvs_flash/include -I/home/tuur/esp-idf-master/components/pthread/include -I/home/tuur/esp-idf-master/components/wpa_supplicant/include -I/home/tuur/esp-idf-master/components/wpa_supplicant/port/include -I/home/tuur/esp-idf-master/components/wpa_supplicant/esp_supplicant/include -I/home/tuur/esp-idf-master/components/app_trace/include -I/home/tuur/esp-idf-master/components/asio/asio/asio/include -I/home/tuur/esp-idf-master/components/asio/port/include -I/home/tuur/esp-idf-master/components/unity/include -I/home/tuur/esp-idf-master/components/unity/unity/src -I/home/tuur/esp-idf-master/components/cmock/CMock/src -I/home/tuur/esp-idf-master/components/console -I/home/tuur/esp-idf-master/components/http_parser -I/home/tuur/esp-idf-master/components/esp-tls -I/home/tuur/esp-idf-master/components/esp-tls/esp-tls-crypto -I/home/tuur/esp-idf-master/components/esp_adc_cal/include -I/home/tuur/esp-idf-master/components/esp_gdbstub/include -I/home/tuur/esp-idf-master/components/esp_gdbstub/xtensa -I/home/tuur/esp-idf-master/components/esp_gdbstub/esp32 -I/home/tuur/esp-idf-master/components/esp_hid/include -I/home/tuur/esp-idf-master/components/tcp_transport/include -I/home/tuur/esp-idf-master/components/esp_http_client/include -I/home/tuur/esp-idf-master/components/esp_http_server/include -I/home/tuur/esp-idf-master/components/esp_https_ota/include -I/home/tuur/esp-idf-master/components/esp_lcd/include -I/home/tuur/esp-idf-master/components/esp_lcd/interface -I/home/tuur/esp-idf-master/components/protobuf-c/protobuf-c -I/home/tuur/esp-idf-master/components/protocomm/include/common -I/home/tuur/esp-idf-master/components/protocomm/include/security -I/home/tuur/esp-idf-master/components/protocomm/include/transports -I/home/tuur/esp-idf-master/components/mdns/include -I/home/tuur/esp-idf-master/components/esp_local_ctrl/include -I/home/tuur/esp-idf-master/components/sdmmc/include -I/home/tuur/esp-idf-master/components/esp_serial_slave_link/include -I/home/tuur/esp-idf-master/components/esp_websocket_client/include -I/home/tuur/esp-idf-master/components/espcoredump/include -I/home/tuur/esp-idf-master/components/espcoredump/include/port/xtensa -I/home/tuur/esp-idf-master/components/wear_levelling/include -I/home/tuur/esp-idf-master/components/fatfs/diskio -I/home/tuur/esp-idf-master/components/fatfs/vfs -I/home/tuur/esp-idf-master/components/fatfs/src -I/home/tuur/esp-idf-master/components/freemodbus/common/include -I/home/tuur/esp-idf-master/components/idf_test/include -I/home/tuur/esp-idf-master/components/idf_test/include/esp32 -I/home/tuur/esp-idf-master/components/ieee802154/include -I/home/tuur/esp-idf-master/components/json/cJSON -I/home/tuur/esp-idf-master/components/mqtt/esp-mqtt/include -I/home/tuur/esp-idf-master/components/perfmon/include -I/home/tuur/esp-idf-master/components/spiffs/include -I/home/tuur/esp-idf-master/components/ulp/ulp_common/include -I/home/tuur/esp-idf-master/components/ulp/ulp_common/include/esp32 -I/home/tuur/esp-idf-master/components/wifi_provisioning/include

ASM_FLAGS = -g -ffunction-sections -fdata-sections -Wall -Werror=all -Wno-error=unused-function -Wno-error=unused-variable -Wno-error=deprecated-declarations -Wextra -Wno-unused-parameter -Wno-sign-compare -ggdb -Og -fmacro-prefix-map=/home/tuur/a21iot02/ESP32/sample_project=. -fmacro-prefix-map=/home/tuur/esp-idf-master=/IDF -fstrict-volatile-bitfields -Wno-error=unused-but-set-variable -fno-jump-tables -fno-tree-switch-conversion -D_GNU_SOURCE -DIDF_VER=\"HEAD-HASH-NOTFOUND\" -DESP_PLATFORM -D_POSIX_READER_WRITER_LOCKS

C_DEFINES = -DMBEDTLS_CONFIG_FILE=\"mbedtls/esp_config.h\" -DUNITY_INCLUDE_CONFIG_H

C_INCLUDES = -I/home/tuur/a21iot02/ESP32/sample_project/cmake-build-debug/config -I/home/tuur/a21iot02/ESP32/sample_project/main -I/home/tuur/esp-idf-master/components/newlib/platform_include -I/home/tuur/esp-idf-master/components/freertos/FreeRTOS-Kernel/include -I/home/tuur/esp-idf-master/components/freertos/esp_additions/include/freertos -I/home/tuur/esp-idf-master/components/freertos/FreeRTOS-Kernel/portable/xtensa/include -I/home/tuur/esp-idf-master/components/freertos/esp_additions/include -I/home/tuur/esp-idf-master/components/esp_hw_support/include -I/home/tuur/esp-idf-master/components/esp_hw_support/include/soc -I/home/tuur/esp-idf-master/components/esp_hw_support/include/soc/esp32 -I/home/tuur/esp-idf-master/components/esp_hw_support/port/esp32/. -I/home/tuur/esp-idf-master/components/heap/include -I/home/tuur/esp-idf-master/components/log/include -I/home/tuur/esp-idf-master/components/lwip/include/apps -I/home/tuur/esp-idf-master/components/lwip/include/apps/sntp -I/home/tuur/esp-idf-master/components/lwip/lwip/src/include -I/home/tuur/esp-idf-master/components/lwip/port/esp32/include -I/home/tuur/esp-idf-master/components/lwip/port/esp32/include/arch -I/home/tuur/esp-idf-master/components/soc/include -I/home/tuur/esp-idf-master/components/soc/esp32/. -I/home/tuur/esp-idf-master/components/soc/esp32/include -I/home/tuur/esp-idf-master/components/hal/esp32/include -I/home/tuur/esp-idf-master/components/hal/include -I/home/tuur/esp-idf-master/components/hal/platform_port/include -I/home/tuur/esp-idf-master/components/esp_rom/include -I/home/tuur/esp-idf-master/components/esp_rom/include/esp32 -I/home/tuur/esp-idf-master/components/esp_rom/esp32 -I/home/tuur/esp-idf-master/components/esp_common/include -I/home/tuur/esp-idf-master/components/esp_system/include -I/home/tuur/esp-idf-master/components/esp_system/port/soc -I/home/tuur/esp-idf-master/components/esp_system/port/include/private -I/home/tuur/esp-idf-master/components/xtensa/include -I/home/tuur/esp-idf-master/components/xtensa/esp32/include -I/home/tuur/esp-idf-master/components/driver/include -I/home/tuur/esp-idf-master/components/driver/esp32/include -I/home/tuur/esp-idf-master/components/driver/deprecated -I/home/tuur/esp-idf-master/components/esp_pm/include -I/home/tuur/esp-idf-master/components/esp_ringbuf/include -I/home/tuur/esp-idf-master/components/efuse/include -I/home/tuur/esp-idf-master/components/efuse/esp32/include -I/home/tuur/esp-idf-master/components/vfs/include -I/home/tuur/esp-idf-master/components/esp_wifi/include -I/home/tuur/esp-idf-master/components/esp_event/include -I/home/tuur/esp-idf-master/components/esp_netif/include -I/home/tuur/esp-idf-master/components/esp_eth/include -I/home/tuur/esp-idf-master/components/tcpip_adapter/include -I/home/tuur/esp-idf-master/components/esp_phy/include -I/home/tuur/esp-idf-master/components/esp_phy/esp32/include -I/home/tuur/esp-idf-master/components/esp_timer/include -I/home/tuur/esp-idf-master/components/mbedtls/port/include -I/home/tuur/esp-idf-master/components/mbedtls/mbedtls/include -I/home/tuur/esp-idf-master/components/mbedtls/esp_crt_bundle/include -I/home/tuur/esp-idf-master/components/app_update/include -I/home/tuur/esp-idf-master/components/spi_flash/include -I/home/tuur/esp-idf-master/components/bootloader_support/include -I/home/tuur/esp-idf-master/components/bootloader_support/bootloader_flash/include -I/home/tuur/esp-idf-master/components/nvs_flash/include -I/home/tuur/esp-idf-master/components/pthread/include -I/home/tuur/esp-idf-master/components/wpa_supplicant/include -I/home/tuur/esp-idf-master/components/wpa_supplicant/port/include -I/home/tuur/esp-idf-master/components/wpa_supplicant/esp_supplicant/include -I/home/tuur/esp-idf-master/components/app_trace/include -I/home/tuur/esp-idf-master/components/asio/asio/asio/include -I/home/tuur/esp-idf-master/components/asio/port/include -I/home/tuur/esp-idf-master/components/unity/include -I/home/tuur/esp-idf-master/components/unity/unity/src -I/home/tuur/esp-idf-master/components/cmock/CMock/src -I/home/tuur/esp-idf-master/components/console -I/home/tuur/esp-idf-master/components/http_parser -I/home/tuur/esp-idf-master/components/esp-tls -I/home/tuur/esp-idf-master/components/esp-tls/esp-tls-crypto -I/home/tuur/esp-idf-master/components/esp_adc_cal/include -I/home/tuur/esp-idf-master/components/esp_gdbstub/include -I/home/tuur/esp-idf-master/components/esp_gdbstub/xtensa -I/home/tuur/esp-idf-master/components/esp_gdbstub/esp32 -I/home/tuur/esp-idf-master/components/esp_hid/include -I/home/tuur/esp-idf-master/components/tcp_transport/include -I/home/tuur/esp-idf-master/components/esp_http_client/include -I/home/tuur/esp-idf-master/components/esp_http_server/include -I/home/tuur/esp-idf-master/components/esp_https_ota/include -I/home/tuur/esp-idf-master/components/esp_lcd/include -I/home/tuur/esp-idf-master/components/esp_lcd/interface -I/home/tuur/esp-idf-master/components/protobuf-c/protobuf-c -I/home/tuur/esp-idf-master/components/protocomm/include/common -I/home/tuur/esp-idf-master/components/protocomm/include/security -I/home/tuur/esp-idf-master/components/protocomm/include/transports -I/home/tuur/esp-idf-master/components/mdns/include -I/home/tuur/esp-idf-master/components/esp_local_ctrl/include -I/home/tuur/esp-idf-master/components/sdmmc/include -I/home/tuur/esp-idf-master/components/esp_serial_slave_link/include -I/home/tuur/esp-idf-master/components/esp_websocket_client/include -I/home/tuur/esp-idf-master/components/espcoredump/include -I/home/tuur/esp-idf-master/components/espcoredump/include/port/xtensa -I/home/tuur/esp-idf-master/components/wear_levelling/include -I/home/tuur/esp-idf-master/components/fatfs/diskio -I/home/tuur/esp-idf-master/components/fatfs/vfs -I/home/tuur/esp-idf-master/components/fatfs/src -I/home/tuur/esp-idf-master/components/freemodbus/common/include -I/home/tuur/esp-idf-master/components/idf_test/include -I/home/tuur/esp-idf-master/components/idf_test/include/esp32 -I/home/tuur/esp-idf-master/components/ieee802154/include -I/home/tuur/esp-idf-master/components/json/cJSON -I/home/tuur/esp-idf-master/components/mqtt/esp-mqtt/include -I/home/tuur/esp-idf-master/components/perfmon/include -I/home/tuur/esp-idf-master/components/spiffs/include -I/home/tuur/esp-idf-master/components/ulp/ulp_common/include -I/home/tuur/esp-idf-master/components/ulp/ulp_common/include/esp32 -I/home/tuur/esp-idf-master/components/wifi_provisioning/include

C_FLAGS = -mlongcalls -Wno-frame-address  -g -ffunction-sections -fdata-sections -Wall -Werror=all -Wno-error=unused-function -Wno-error=unused-variable -Wno-error=deprecated-declarations -Wextra -Wno-unused-parameter -Wno-sign-compare -ggdb -Og -fmacro-prefix-map=/home/tuur/a21iot02/ESP32/sample_project=. -fmacro-prefix-map=/home/tuur/esp-idf-master=/IDF -fstrict-volatile-bitfields -Wno-error=unused-but-set-variable -fno-jump-tables -fno-tree-switch-conversion -std=gnu99 -Wno-old-style-declaration -D_GNU_SOURCE -DIDF_VER=\"HEAD-HASH-NOTFOUND\" -DESP_PLATFORM -D_POSIX_READER_WRITER_LOCKS

