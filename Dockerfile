# Use the official Node-RED image as a base
FROM nodered/node-red:latest

ARG NODE_RED_CONFIG="node-red"

# Install additional Node-RED nodes or libraries globally
USER root
RUN npm install node-red-node-mongodb node-red-dashboard

# Switch back to the default user
USER node-red

# Copy your Node-RED settings and flows
COPY $NODE_RED_CONFIG/settings.js /data/settings.js
COPY $NODE_RED_CONFIG/flows.v1.json /data/flows.json