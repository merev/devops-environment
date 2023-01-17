#!/bin/bash

echo "* Add any prerequisites ..."
apt-get install -y python3 python3-pip

echo "* Save the ansible public key locally ..."
cat /shared/master/ansible-public-key.conf >> /home/vagrant/.ssh/authorized_keys