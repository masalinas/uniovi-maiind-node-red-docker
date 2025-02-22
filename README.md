# Description
Uniovi node-red and Docker training. This repo it's a Dockerfile to create a custom node-red including:
 - Securize with a default credentials admin/undergorund
 - With some libraries just installed: mongodb and dashboard
 - With a simple sample flow

## Steps 
Follow the next steps to build an run your custom node-red container.

### STEP01: Build your node-red image
 ```
docker build -t uniovi-node-red:1.0.0 .
 ```

### STEP02: Start your node-red container
 ```
docker run -d --name uniovi-node-red -p 1880:1880 -v node_red_data:/data uniovi-node-red:1.0.0
 ```

### STEP03: Tag your image to be published in your Docker-Huv private repository
```
docker tag uniovi-node-red:1.0.0 ofertoio/uniovi-node-red:1.0.0
 ```

### STEP04: Publish your custom node-red image to be shared
Previous to publish in your docker-hub respository you must login inside like this:
 ```
docker login
 ```

Then you can publish your image:

 ```
docker push ofertoio/uniovi-node-red:1.0.0
 ```