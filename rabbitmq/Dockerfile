# Use the official RabbitMQ image as a base
FROM rabbitmq:4.0-management

# Install additional RabbitMQ plugins
RUN rabbitmq-plugins enable --offline rabbitmq_mqtt

# Expose RabbitMQ default port: AMQP, MQTT and RabbitMQ Management UI ports 
EXPOSE 5672
EXPOSE 15672
EXPOSE 1883
