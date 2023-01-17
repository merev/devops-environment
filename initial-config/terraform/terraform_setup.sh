#!/bin/bash

echo "* Download terraform archive ..."
wget https://releases.hashicorp.com/terraform/1.1.7/terraform_1.3.6_linux_amd64.zip -O /tmp/terraform.zip

echo "* Unarchive the files ..."
unzip /tmp/terraform.zip -d /tmp

echo "* Move the binary in a folder that is part of the PATH variable ..."
mv /tmp/terraform /usr/local/bin

echo "* Create terraform working directory ..."
mkdir /home/vagrant/terraform-workdir

echo "* Copy the configuration for the DevOps tools ..."
cp -R /shared/terraform/* /home/vagrant/terraform-workdir/