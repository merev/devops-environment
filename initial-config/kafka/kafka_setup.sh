#!/bin/bash

echo "* Add any prerequisites ..."
apt-get update -y && apt-get install -y python3 python3-pip openjdk-17-jre

echo "* Add kafka-python ..."
pip3 install kafka-python

echo "* Import the compose configurations ..."
mkdir /home/vagrant/kafka-workdir
cp -r /shared/kafka/* /home/vagrant/kafka-workdir

echo "* Run the kafka cluster ..."
docker-compose -f kafka-workdir/config/kafka-setup.yaml up -d

echo "* Wait until the cluster is ready ..."
sleep 30

echo "* Run the test applications ..."
docker-compose -f kafka-workdir/test-apps/kafka-numbers-stream.yml up -d
docker-compose -f kafka-workdir/test-apps/kafka-facts-stream.yml up -d


echo "* Run the kafka-exporter ..."
docker container run -d --rm -p 9308:9308 danielqsj/kafka-exporter --kafka.server=192.168.99.101:9092











