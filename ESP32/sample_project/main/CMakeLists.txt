idf_component_register(SRCS "main.c"
        SRCS "adc_read.c"
        SRCS "wifi.c"
        SRCS "pwm.c"
        SRCS "connect.c"
        SRCS "water_pump.c"
        SRCS "https_request.c"
        "."
        EMBED_TXTFILES DigiCertAssuredIDRootCA.pem
        )