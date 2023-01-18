#!/bin/bash
# Execute this script as root from the terraform workspace directory (/home/vagrant/terraform-workdir).

echo "* Run the kafka cluster and the consumer-producer app ..."
terraform -chdir=kafka-cluster init
terraform -chdir=kafka-cluster apply -auto-approve

echo "* Wait till the cluster is ready ..."
sleep 15

echo "* Run the kafka-exporter ..."
docker container run -d --rm -p 9308:9308 danielqsj/kafka-exporter --kafka.server=192.168.99.103:9092