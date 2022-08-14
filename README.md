# The EE-Plant 🌱
## EE5 Project - Team IoT 02
![alt text](https://raw.githubusercontent.com/alken01/ee-plant/main/Extra/logo.png)

## Poster
![alt text](https://raw.githubusercontent.com/alken01/ee-plant/main/Extra/poster.jpeg)

### Intro
If you do not have the time to take care of your plants or when you are away from home for a few days, the EE-Plant can help you! The system can look after different plant species, from common house plants to exotic ones. Specialised algorithms are designed with that in mind, tailored for every kind. 

The EE-Plant comes with an Android app that updates the user about the plant. Is it too cold? The temperature goes up! Is it too dry? The system will water the plant. If the reservoir's water level is low, the app will notify the user.

Of course, you can take matters into your own hands and adjust every command accordingly.

### Sensors
The following sensors monitor the system 24/7:

- the soil moisture
- the air humidity
- temperature
- light intake

### Actuators
The following actuators regulate and control the system:

- a heater warms up the air
- a fan cools down the environment and regulates the humidity
- a spray machine, connected to a servo motor, sprays water and increase the humidity
- the water reservoir, attached with a pump and a servo motor, waters the soil

### Finally
The system's exterior is made out of a plexiglass box, MDF and 3D printed components. A power bank supplies the system with 5V. The ESP32 communicates with the database in the server through its Wi-Fi module. Data from the sensors is saved in these databases. It is then made available to the user via the app in form of graphs over time

> With the EE-Plant everything is about nature and comfort.


## Sprints

### Sprint 1
In sprint 1 we worked mainly on the system's sensors.
The following user stories were closed:

- As a user I want to organise the data in databases
- As a user I want to know the temperature
- As a user I want to know the humidity and the moisture
- As a user I want to know the water level of the reservoir
- As a user I want to know if the plant is in light

[Video Sprint 1](https://kuleuven.mediaspace.kaltura.com/media/EE5+Team+IoT+2+-+Sprint+1/1_wgv9ouep)

### Sprint 2

The following user stories were closed:

- As a user I want to know the water level of the reservoir
- As a user I want to know if the plant is in light
- As a user I want to know the humidity and the moisture
- As a user I want to know the temperature
- As a user I want to organise the data in databases
- As a user I want a nice exterior design/case

Progress was made in the following:

- As a user I want to have a custom REST API
- As a user I want an Android App to control the device
- As a user I want to control the lighting

[Video Sprint 2](https://kuleuven.mediaspace.kaltura.com/media/EE5+Team+IoT+2+-+Sprint+2/1_kdvxv84o)

### Sprint 3

The following user stories were closed:

- As a user I want an iOS app to control the device
- As a user I want to have a smart device
- As a user I want everything to fit in the same case
- As a user I want to water the plant
- As a user I want to have web connectivity
- As a user I want to have as minimal wiring as possible (PCB)

[Video Sprint 3](https://kuleuven.mediaspace.kaltura.com/media/ee-plant+sprint+3+bew/1_60p68z9a)



