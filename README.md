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

### STEP05: use docker compose to start your local docker stack 
Start docker stack:
- Create network 
- Create docker images
- Start docker containers
- Create and attach volumes to docker containers

```
$ docker-compose up -d 
```

Stop your docker stack: 
 - Stop and remove all containers
 - Remove all volumnes
 - Remove the network
 - Remove all local docker images
```
$ docker-compose down --rmi all -v
```

### STEP06: use docker compose to start your production docker stack
Start docker stack:
- Create network 
- Pull docker images
- Start docker containers
- Create and attach volumes to docker containers

```
$ docker-compose -f ./docker-compose-pro.yaml up -d 
```

Stop your docker stack: 
 - Stop and remove all containers
 - Remove all volumnes
 - Remove the network
 - Remove all local docker images
```
$ docker-compose -f ./docker-compose-pro.yaml down --rmi all -v
```

