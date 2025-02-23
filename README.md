# Description
Maiind mongodb and node-red custom services deployed as Docker Containers locally and published in your private docker-hub rspository.

- The mongoDB service include:
    - Standalone Basic Security service.
    - Sample Database.
    - Sample Collection with some Documents.

- The node-red service include:
    - Securized with basic credentials.
    - With [node-red-node-mongodb](https://flows.nodered.org/node/node-red-node-mongodb) and [node-red-dashboard](https://flows.nodered.org/node/node-red-dashboard) nodes just installed.
    - With a simple flow called **Greeting Flow**.

# Steps 
Follow the next steps to build an run your custom mongodb and node-red services.

### STEP01: Build your custom mongo image
 ```
$ docker build -t maiind-mongo:1.0.0 .
 ```

 ### STEP02: Start your custom mongodb container in the network maiind
 ```
 $ docker run \
 -d \
 --name maiind-mongo \
 --network maiind \
 -p 27017:27017 \
 -e MONGO_INITDB_ROOT_USERNAME=admin \
 -e MONGO_INITDB_ROOT_PASSWORD=password \
 -e MONGO_INITDB_DATABASE=maiind \
 -v mongo_data:/data/db \
 maiind-mongo:1.0.0
 ```

We can use the Open source mongoDB manager called [MongoDB Compass](https://www.mongodb.com/products/tools/compass)

 ![mongo-connection](captures/mongo-connection.png "mongo-connection")

 ![mongo-compass](captures/mongo-compass.png "mongo-compass")

 ### STEP03: Tag your custom mongo docker image to be published in your docker-hub private repository
```
$ docker tag maiind-mongo:1.0.0 ofertoio/maiind-mongo:1.0.0
 ```

### STEP04: Publish your custom mongo docker image in your private repository to be shared
 ```
$ docker push ofertoio/maiind-mongo:1.0.0
 ```

### STEP05: start a sample node-red to get the settings.js file and create an admin password
 ```
$ docker run -d --rm --name node-red nodered/node-red
 ```

login inside  and execute this command to create a password
 ```
$ docker exec -it node-red bash
$ node-red admin hash-pw
 ```

from host copy the settings.js file 
 ```
$ docker cp node-red:/data/settings.js ./
 ```

stop the sample node-red. Docker will removed it automatically
```
$ docker stop node-red
```

### STEP06: Create a network maiind
```
$ docker network create maiind
```

### STEP07: Build your custom node-red docker image
 ```
$ docker build -t maiind-node-red:3.0.0 .
 ```

### STEP08: Start your custom node-red docker container in the network maiind
 ```
$ docker run \
-d \
--name maiind-node-red \
--network maiind \
-p 1880:1880 \
-v node_red_data:/data \
maiind-node-red:3.0.0
```

![Porainer](captures/portainer.png "Porainer")

![node-red-login](captures/node-red-login.png "node-red-login")

![greetings-flow](captures/greetings-flow.png "greetings-flow")

![mongo-flow](captures/mongo-flow.png "mongo-flow")

**NOTE**: the mongodb flows imported by the image not set the mongo credentials by security. You must set after login inside node-RED

### STEP09: Tag your custom node-red docker image to be published in your docker-hub private repository
```
$ docker tag maiind-node-red:3.0.0 ofertoio/maiind-node-red:3.0.0
 ```

### STEP10: Publish your custom node-red docker image in your private repository to be shared
Previous to publish in your docker-hub respository you must login inside like this:
 ```
$ docker login
 ```

Then you can publish your image:

 ```
$ docker push ofertoio/maiind-node-red:3.0.0
 ```