#include <string.h>
#include <stdlib.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_log.h"
#include "esp_system.h"
#include "esp_tls.h"
#include "esp_crt_bundle.h"
#include "appMain.h"

#include "esp_http_client.h"

#define MAX_HTTP_RECV_BUFFER 1024
static const char *TAG = "HTTP_CLIENT";

/* for if a permit is needed
extern const char howsmyssl_com_root_cert_pem_start[] asm("_binary_howsmyssl_com_root_cert_pem_start");
extern const char howsmyssl_com_root_cert_pem_end[]   asm("_binary_howsmyssl_com_root_cert_pem_end");

extern const char postman_root_cert_pem_start[] asm("_binary_postman_root_cert_pem_start");
extern const char postman_root_cert_pem_end[]   asm("_binary_postman_root_cert_pem_end");
 */


esp_err_t http_event_handler(esp_http_client_event_t *evt){
    static char *output_buffer;  // Buffer to store response of http request from event handler
    static int output_len;       // Stores number of bytes read
    switch(evt->event_id) {
        case HTTP_EVENT_ERROR:
            ESP_LOGD(TAG, "HTTP_EVENT_ERROR");
            break;
        case HTTP_EVENT_ON_CONNECTED:
            ESP_LOGD(TAG, "HTTP_EVENT_ON_CONNECTED");
            break;
        case HTTP_EVENT_HEADER_SENT:
            ESP_LOGD(TAG, "HTTP_EVENT_HEADER_SENT");
            break;
        case HTTP_EVENT_ON_HEADER:
            ESP_LOGD(TAG, "HTTP_EVENT_ON_HEADER, key=%s, value=%s", evt->header_key, evt->header_value);
            break;
        case HTTP_EVENT_ON_DATA:
            ESP_LOGD(TAG, "HTTP_EVENT_ON_DATA, len=%d", evt->data_len);

            if ( /* !esp_http_client_is_chunked_response(evt->client) */ true) { //don't care about chunked or non chunked data
                // If user_data buffer is configured, copy the response into the buffer
                if (evt->user_data) {
                    memcpy(evt->user_data + output_len, evt->data, evt->data_len);
                } else {
                    if (output_buffer == NULL) {
                        output_buffer = (char *) malloc(esp_http_client_get_content_length(evt->client));
                        output_len = 0;
                        if (output_buffer == NULL) {
                            ESP_LOGE(TAG, "Failed to allocate memory for output buffer");
                            return ESP_FAIL;
                        }
                    }
                    memcpy(output_buffer + output_len, evt->data, evt->data_len);
                }
                output_len += evt->data_len;
            }
            break;
        case HTTP_EVENT_ON_FINISH:
            ESP_LOGD(TAG, "HTTP_EVENT_ON_FINISH");
            if (output_buffer != NULL) {
                // Response is accumulated in output_buffer. Uncomment the below line to print the accumulated response
                // ESP_LOG_BUFFER_HEX(TAG, output_buffer, output_len);
                free(output_buffer);
                output_buffer = NULL;
            }
            output_len = 0;
            break;
        case HTTP_EVENT_DISCONNECTED:
            ESP_LOGI(TAG, "HTTP_EVENT_DISCONNECTED");
            int mbedtls_err = 0;
            esp_err_t err = esp_tls_get_and_clear_last_error(evt->data, &mbedtls_err, NULL);
            if (err != 0) {
                ESP_LOGI(TAG, "Last esp error code: 0x%x", err);
                ESP_LOGI(TAG, "Last mbedtls failure: 0x%x", mbedtls_err);
            }
            if (output_buffer != NULL) {
                free(output_buffer);
                output_buffer = NULL;
            }
            output_len = 0;
            break;
        case HTTP_EVENT_REDIRECT:
            ESP_LOGD(TAG, "HTTP_EVENT_REDIRECT");
            esp_http_client_set_header(evt->client, "From", "user@example.com");
            esp_http_client_set_header(evt->client, "Accept", "text/html");
            break;
    }
    return ESP_OK;
}

_Noreturn  void https_write_with_url(void* URL){
    char local_response_buffer[0] = {}; //will not be used
    esp_http_client_config_t config = {
            .url = (char*)URL,
            .event_handler = http_event_handler,
            .user_data= local_response_buffer, //will not be used
            .crt_bundle_attach = esp_crt_bundle_attach,
    };
    esp_http_client_handle_t client = esp_http_client_init(&config);
    esp_err_t err = esp_http_client_perform(client);

    if (err == ESP_OK) {
        ESP_LOGI(TAG, "HTTPS Status = %d, content_length = %lld",
                 esp_http_client_get_status_code(client),
                 esp_http_client_get_content_length(client));
    } else {
        ESP_LOGE(TAG, "Error perform http request %s", esp_err_to_name(err));
    }
    esp_http_client_cleanup(client);
    vTaskDelete(NULL);//delete task after data has been inserted. will be remade for each inserted data
}

_Noreturn  void https_read_with_url(void* URL){
    char local_response_buffer[MAX_HTTP_RECV_BUFFER] = {0};
    esp_http_client_config_t config = {
            .url = (char*)URL,
            .event_handler = http_event_handler,
            .crt_bundle_attach = esp_crt_bundle_attach,
            .user_data =  local_response_buffer,
            .buffer_size= MAX_HTTP_RECV_BUFFER,
            .disable_auto_redirect = true
    };
    esp_http_client_handle_t client = esp_http_client_init(&config);
    esp_err_t err = esp_http_client_perform(client);

    if (err == ESP_OK) {
        ESP_LOGI(TAG, "HTTPS Status = %d, content_length = %lld",
                 esp_http_client_get_status_code(client),
                 esp_http_client_get_content_length(client));
    } else {
        ESP_LOGE(TAG, "Error perform http request %s", esp_err_to_name(err));
    }

   //ESP_LOG_BUFFER_CHAR(TAG, local_response_buffer, strlen(local_response_buffer));
    esp_http_client_cleanup(client);


    struct sensor_flag_struct flag_struct;
    flag_struct.sensor_ID=0;
    flag_struct.sensor_flag=(int)(local_response_buffer[0]-'0');
    xQueueSend(flag_queue, &flag_struct, portMAX_DELAY);

    flag_struct.sensor_ID=1;
    flag_struct.sensor_flag=(int)(local_response_buffer[1]-'0');
    xQueueSend(flag_queue, &flag_struct, portMAX_DELAY);

    flag_struct.sensor_ID=2;
    flag_struct.sensor_flag=(int)(local_response_buffer[2]-'0');
    xQueueSend(flag_queue, &flag_struct, portMAX_DELAY);

    flag_struct.sensor_ID=3;
    flag_struct.sensor_flag=(int)(local_response_buffer[3]-'0');
    xQueueSend(flag_queue, &flag_struct, portMAX_DELAY);


    vTaskDelete(NULL);//delete task after data has been inserted. will be remade for each inserted data
}







