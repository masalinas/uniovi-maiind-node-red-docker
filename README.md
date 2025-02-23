# Description
Uniovi node-red and Docker training. This repo it's a Dockerfile to create a custom node-red service including:
 - Securized with default credentials **admin/password**.
 - With [node-red-node-mongodb](https://flows.nodered.org/node/node-red-node-mongodb) and [node-red-dashboard](https://flows.nodered.org/node/node-red-dashboard) nodes just installed.
 - With a simple flow called **Greeting Flow**.

## Steps 
Follow the next steps to build an run your custom node-red container.

### STEP01: start a sample node-red to get the settings.js file and create a admin password
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

stop the sample node-red
```
$ docker stop node-red
```

### STEP02: Create a network 
```
$ docker network create maiind
```

### STEP03: Build your custom node-red docker image
 ```
$ docker build -t maiind-node-red:3.0.0 .
 ```

### STEP04: Start your custom node-red docker container in the network uniovi
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

### STEP05: Tag your custom node-red docker image to be published in your docker-hub private repository
```
$ docker tag maiind-node-red:1.0.0 ofertoio/maiind-node-red:3.0.0
 ```

### STEP06: Publish your custom node-red docker image in your private repository to be shared
Previous to publish in your docker-hub respository you must login inside like this:
 ```
$ docker login
 ```

Then you can publish your image:

 ```
$ docker push ofertoio/maiind-node-red:1.0.0
 ```


### STEP07: Build your custom mongo image
 ```
$ docker build -t maiind-mongo:1.0.0 .
 ```

 ### STEP08: Start mongodb container
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

 ![mongo-connection](captures/mongo-connection.png "mongo-connection")

 ![mongo-compass](captures/mongo-compass.png "mongo-compass")

 
 