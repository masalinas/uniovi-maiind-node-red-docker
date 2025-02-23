#!/bin/bash
echo "Waiting for MongoDB to start..."
sleep 5  # Ensure MongoDB is fully started before importing

echo "Importing collection..."
mongoimport --uri "mongodb://admin:password@localhost:27017/?authSource=admin&readPreference=primary&ssl=false" \
--db maiind \
--collection messages \
--type json \
--file /data/maiind.messages.json \
--jsonArray

echo "MongoDB import completed."