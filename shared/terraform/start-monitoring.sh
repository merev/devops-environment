#!/bin/bash
# Execute this script as root from the terraform workspace directory (/home/vagrant/terraform-workdir).

echo "* Run the monitoring components ..."
terraform -chdir=monitoring init
terraform -chdir=monitoring apply -auto-approve