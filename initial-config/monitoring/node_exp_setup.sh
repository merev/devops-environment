#!/bin/bash

echo "* Download Node exporter archive ..."
wget https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz 

echo "* Extract the archive and remove it ..."
tar xzvf node_exporter-1.5.0.linux-amd64.tar.gz  && rm -rf node_exporter-1.5.0.linux-amd64.tar.gz

echo "* Start the node exporter ..."
./node_exporter-1.5.0.linux-amd64/node_exporter &> /tmp/node-exporter.log &