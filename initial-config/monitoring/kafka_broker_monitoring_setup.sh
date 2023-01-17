#!/bin/bash

echo "* Create JMX agent directory ..."
mkdir /home/vagrant/kafka_2.13-3.3.1/jmxagent

echo "* Download the JMX agent ..."
wget https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.17.2/jmx_prometheus_javaagent-0.17.2.jar -P /home/vagrant/kafka_2.13-3.3.1/jmxagent

echo "* Download the example YAML configuration ..."
wget https://raw.githubusercontent.com/prometheus/jmx_exporter/master/example_configs/kafka-2_0_0.yml -P /home/vagrant/kafka_2.13-3.3.1/jmxagent

echo "* Export a special environment variable ..."
cp /shared/kafka-config/kafka-opts.sh /etc/profile.d/


