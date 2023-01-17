#!/bin/bash

echo "* Add any prerequisites ..."
apt-get update -y && apt-get install -y ca-certificates curl gnupg lsb-release git fontconfig

echo "* Add Docker repository and key ..."
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "* Install Docker ..."
apt-get update -y && apt-get install -y docker-ce docker-ce-cli containerd.io

echo "* Add vagrant user to docker group ..."
usermod -aG docker vagrant

echo "* Make the docker engine to listen on all interfaces ..."
sed -i 's@-H fd://@-H fd:// -H tcp://0.0.0.0@g' /lib/systemd/system/docker.service

echo "* Restart Docker ..."
systemctl daemon-reload
systemctl restart docker

echo "* Install docker-compose App..."
curl -L "https://github.com/docker/compose/releases/download/2.14.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo "* Check docker-compose version..."
docker-compose version