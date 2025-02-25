# Use the official RabbitMQ image as a base
FROM rabbitmq:4.0-management

# Install additional RabbitMQ plugins
RUN rabbitmq-plugins enable --offline rabbitmq_mqtt

# Expose node-RED default port
EXPOSE 5672
EXPOSE 15672
EXPOSE 1883
