# How to setup the jenkins host?
## Adjust the user 'jenkins'

1.) Modify the user 'jenkins' on the jenkins host by applying the following ansible playbook - ***jenkins/change-jenkins-password.yml***

Example command:

    sudo ansible-playbook jenkins/change-jenkins-password.yml --extra-vars password=<your password>

2.) Generate RSA public and private keys by applying the following ansible playbook - ***jenkins/ssh-key-gen.yml***

Example command:

    sudo ansible-playbook jenkins/ssh-key-gen.yml

3.) Add SSH username with private key credential from the UI (use the key that was exported in `/shraed/jenkins/ssh-keys/id_rsa`).

Refference - https://www.jenkins.io/doc/book/using/using-credentials/

## Create user 'jenkins' on the remote host

Modify the user 'jenkins' on the remote host by applying the following ansible playbook ***- jenkins/create-jenkins-user.yml***

Example command:

    sudo ansible-playbook jenkins/create-jenkins-user.yml --extra-vars password=<your password>
    
## Add the remote host as a slave node

Apply the following ansible playbook - ***jenkins/add-slave-node.yml*** (you should pass the playbook the node *hostname*, *credential ID*, and *label*)

Command:

    sudo ansible-playbook jenkins/create-jenkins-user.yml --extra-vars nodename=<node hostname> --extra-vars credid=<credential ID> --extra-vars label=<node label>

Example:

    sudo ansible-playbook jenkins/create-jenkins-user.yml --extra-vars nodename=docker --extra-vars credid=jenkins --extra-vars label=docker
