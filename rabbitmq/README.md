# Description
The RabbitMQ service include:
    - Securized with basic credentials: **admin/password**.
    - With MQTT Plugin activated

# Steps 
Follow the next steps to build and run your docker rabbitmq image.

### STEP01: Build your custom rabbitmq docker image
 ```
$ docker build -t maiind-rabbitmq:1.0.0 .
 ```

 ### STEP02: Start your rabbitmq docker container in the network maiind
  ```
$ docker run \
-d \
--name maiind-rabbitmq \
--network maiind \
-p 5672:5672 \
-p 15672:15672 \
-e RABBITMQ_DEFAULT_USER=admin \
-e RABBITMQ_DEFAULT_PASS=password \
maiind-rabbitmq:1.0.0
 ```

Now we can open the RabbitMQ Management Console from [http://localhost:15672](http://localhost:15672) with credentials **admin/password**

![RabbitMQ Management](../captures/rabbitmq-management.png "RabbitMQ Management")

### STEP03: Build your custom rabbitmq docker image
 ```
$ docker tag maiind-rabbitmq:1.0.0 ofertoio/maiind-rabbitmq:1.0.0 .
 ```

### STEP04: Publish your custom rabbitmq docker image in your private repository to be shared
 ```
$ docker push ofertoio/maiind-rabbitmq:1.0.0
 ```
