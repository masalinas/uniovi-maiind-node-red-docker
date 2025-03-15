# Description
The node-RED service include:
- Securized with basic credentials: **admin/password**.
- With [node-red-node-mongodb](https://flows.nodered.org/node/node-red-node-mongodb) and [node-red-dashboard](https://flows.nodered.org/node/node-red-dashboard) nodes just installed.
- With a simple flow called **Greeting Flow** and **Mongo Flow**

# Steps 
Follow the next steps to build and run your docker node-RED image.

### STEP01: Build your custom node-red docker image
 ```
$ docker build -t maiind-node-red:4.0.0 .
 ```

### STEP02: Start your custom node-red docker container in the network maiind
 ```
$ docker run \
-d \
--name maiind-node-red \
--network maiind \
-p 1880:1880 \
-v node_red_data:/data \
maiind-node-red:1.0.0
```

Now we can open the node-RED UI Console from [http://localhost:1880](http://localhost:1880) with credentials **admin/password**

![Porainer](../captures/portainer.png "Porainer")

![node-red-login](../captures/node-red-login.png "node-red-login")

![greetings-flow](../captures/greetings-flow.png "greetings-flow")

![mongo-flow](../captures/mongo-flow.png "mongo-flow")

**NOTE**: the mongodb flows imported by the image not set the mongo credentials by security. You must set after login inside node-RED

### STEP03: Tag your custom node-red docker image to be published in your docker-hub private repository
```
$ docker tag maiind-node-red:4.0.0 ofertoio/maiind-node-red:4.0.0
 ```

### STEP04: Publish your custom node-red docker image in your private repository to be shared
 ```
$ docker push ofertoio/maiind-node-red:4.0.0
 ```