# How to start our apps on the VMs running in the Application Namespace?

The applications can be started through the ansible playbooks in the following directories:
 - ***/home/vagrant/ansible/playbooks/apps-cont***
 - ***/home/vagrant/ansible/playbooks/apps-vm***

Execute some of the following commands if you want ot start any app (should be executed from the ansible working directory):

Run BGApp in docker containers:
    ansible-palybook playbooks/apps-cont/bgapp-docker.yml

Run NGINX container:   
    ansible-palybook playbooks/apps-cont/nginx-container.yml

Run BGApp as a monolithic application:    
    ansible-palybook playbooks/apps-vm/bgapp-vm.yml

Run a monolithic app with virtual hosts:   
    ansible-palybook playbooks/apps-vm/app2.yml