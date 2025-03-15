# Description
Maiind mongoDB, node-RED and RabbitMQ custom services deployed as Docker Containers locally and published in your private docker-hub rspository.

# Steps 
Follow the next steps to build a PoC with: MongoDB, RabbitMQ and node-RED integrated as Docker services

### STEP01: Create a network maiind
```
$ docker network create maiind
```

### STEP02: Build your custom mongo image
Read more [here](./mongo/README.md)

### STEP03: Build your custom RabbitMQ image
Read more [here](./rabbitmq/README.md)

### STEP04: Build your custom node-RED image
Read more [here](./node-red/README.md)