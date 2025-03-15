# Description
Poc using a MongoDB, RabbitMQ and node-RED services integrated and package as Docker Images.

# Steps 
Follow these steps to build and run your MongoDB, RabbitMQ and node-RED Docker services:

### STEP01: Create a docker network
Create a Docker network called maiind
```
$ docker network create maiind
```

### STEP02: Build your custom MongoDB docker image
Read more [here](./mongo/README.md)

### STEP03: Build your custom RabbitMQ docker image
Read more [here](./rabbitmq/README.md)

### STEP04: Build your custom node-RED docker image
Read more [here](./node-red/README.md)