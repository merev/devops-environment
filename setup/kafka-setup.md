# How to setup the Kafka cluster?
The Kafka cluster is not initially started.

## Run the cluster

You should start it by executing the following script as root from the terraform working directory - ***/home/vagrant/terraform-workdir/start-kafka.sh***

Command:

    bash start-kafka.sh

## Start kafka-exporter for monitoring purposes

You can run kafka-exporter container by applying the following ansible playbook - ***/home/vagrant/ansible/kafka-exporter.yml*** 

Command:

    sudo ansible-playbook kafka-exporter.yml
