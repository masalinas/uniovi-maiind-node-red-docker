# Description
The mongoDB service include:
    - Standalone mondoDB with Basic Security credentials: **admin/password**
    - Sample Database.
    - Sample Collection with some Documents.

# Steps 
Follow the next steps to build and run your docker mongodb image.

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

 ![mongo-connection](../captures/mongo-connection.png "mongo-connection")

 ![mongo-compass](../captures/mongo-compass.png "mongo-compass")

 ### STEP04: Tag your custom mongo docker image to be published in your docker-hub private repository
```
$ docker tag maiind-mongo:1.0.0 ofertoio/maiind-mongo:1.0.0
 ```

### STEP05: Publish your custom mongo docker image in your private repository to be shared
Previous to publish in your docker-hub respository you must login inside like this:
 ```
$ docker login
 ```

Then you can publish your image:

 ```
$ docker push ofertoio/maiind-mongo:1.0.0
 ```