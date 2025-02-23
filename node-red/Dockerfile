# Use the official Node-RED image as a base
FROM nodered/node-red:latest

# Default container configuration folder
ARG CONFIG_PATH="configuration"

# Install additional Node-RED nodes or libraries globally
USER root
RUN npm install node-red-node-mongodb node-red-dashboard

# Switch back to the default user
USER node-red

# Copy your Node-RED settings and flows
COPY $CONFIG_PATH/settings.js /data/settings.js
COPY $CONFIG_PATH/flows.v3.json /data/flows.json

# Expose node-RED default port
EXPOSE 1880