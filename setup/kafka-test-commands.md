# Kafka test commands

Create a topic with 1 partition and replication factor 1:

    container exec broker kafka-topics --bootstrap-server broker:9092 --create --topic demo

Describe a topic:

    docker container exec broker kafka-topics --bootstrap-server broker:9092 --describe --topic demo

List all topics:

    docker container exec broker kafka-topics --bootstrap-server broker:9092 --list

Delete a topic:

    docker container exec broker kafka-topics --bootstrap-server broker:9092 --delete --topic demo