#!/bin/bash

# Start Gitea
docker-compose -f /shared/scm/docker-compose.yml up -d

# Wait until ready
while true; do 
  echo 'Trying to connect to http://192.168.99.101:3000 ...'; 
  if [ $(curl -s -o /dev/null -w "%{http_code}" http://192.168.99.101:3000) == "200" ]; then 
    echo '... connected.'; 
    break; 
  else 
    echo '... no success. Sleep for 5s and retry.'; 
    sleep 5; 
  fi 
done

# Add user
docker container exec -u 1000 gitea gitea admin user create --username merev --password merev --email merev@devops

# Clone the project
git clone https://github.com/shekeriev/bgapp /tmp/bgapp

# Modify the repository
rm /tmp/bgapp/*.yaml
rm /tmp/bgapp/Jenkinsfile
cp /vagrant/docker/docker-compose-build.yaml /tmp/bgapp/
cp /vagrant/docker/docker-compose-deploy.yaml /tmp/bgapp/
echo "Modified on $(date '+%Y-%m-%d %H:%M:%S')" >> /tmp/bgapp/README.md
cd /tmp/bgapp && git add . && git commit -m "Modified on $(date '+%Y-%m-%d %H:%M:%S')"

# Add it to Gitea (but as public repository)
cd /tmp/bgapp && git push -o repo.private=false http://vagrant:vagrant@192.168.99.101:3000/merev/bgapp

# Add a Webhook
curl -X 'POST' 'http://192.168.99.101:3000/api/v1/repos/merev/bgapp/hooks' \
  -H 'accept: application/json' \
  -H 'authorization: Basic '$(echo -n 'merev:merev' | base64) \
  -H 'Content-Type: application/json' \
  -d '{
  "active": true,
  "branch_filter": "*",
  "config": {
    "content_type": "json",
    "url": "http://192.168.99.102:8080/gitea-webhook/post",
    "http_method": "post"
  },
  "events": [
    "push"
  ],
  "type": "gitea"
}'
