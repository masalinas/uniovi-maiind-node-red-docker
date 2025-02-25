# Use the official mongoDB image as a base
FROM mongo:latest

# Default container configuration folder
ARG CONFIG_PATH="configuration"

# Create a directory for the data
RUN mkdir -p /data

# Copy the JSON file and the initialization script
COPY $CONFIG_PATH/maiind.messages.json /data/maiind.messages.json
COPY $CONFIG_PATH/init-db.sh /docker-entrypoint-initdb.d/init-db.sh

# Set execution permissions for the script
RUN chmod +x /docker-entrypoint-initdb.d/init-db.sh

# Expose MongoDB default port
EXPOSE 27017

# Start MongoDB
CMD ["mongod"]
