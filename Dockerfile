# Use the official Node-RED image as a base
FROM nodered/node-red:latest

# Install additional Node-RED nodes or libraries globally
USER root
RUN npm install node-red-node-mongodb node-red-dashboard

# Switch back to the default user
USER node-red

# Optionally, copy your Node-RED settings or flows if you have any
COPY settings.js /data/settings.js
COPY flows.json /data/flows.json