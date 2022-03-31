idf_component_register(SRCS "main.c"
        SRCS "adc_read.c"
        SRCS "wifi.c"
        SRCS "pwm.c"
        SRCS "connect.c"
        INCLUDE_DIRS "."
        EMBED_TXTFILES DigiCertAssuredIDRootCA.pem
        )