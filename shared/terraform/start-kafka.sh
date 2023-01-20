#!/bin/bash
# Execute this script as root from the terraform workspace directory (/home/vagrant/terraform-workdir).

echo "* Run the kafka cluster and the consumer-producer app ..."
terraform -chdir=kafka-cluster init
terraform -chdir=kafka-cluster apply -auto-approve
