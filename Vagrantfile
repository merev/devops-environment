# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false

  config.vm.provider "virtualbox" do |v|
    v.gui = false
    v.memory = 2048
    v.cpus = 2
  end
  
  # Ansible Host - CentOS Stream 9
  config.vm.define "ans" do |ans|
    ans.vm.box = "merev/centos-stream"
    ans.vm.hostname = "ansible"
    ans.vm.network "private_network", ip: "192.168.99.100"
    ans.vm.synced_folder "shared/", "/shared"
    ans.vm.provision "shell", path: "initial-config/add_hosts.sh"
    ans.vm.provision "shell", path: "initial-config/ansible/redhat_ansible_setup.sh"
    ans.vm.provision "shell", path: "initial-config/monitoring/node_exp_setup.sh"
    ans.vm.provision "shell", path: "initial-config/terraform/terraform_setup.sh"
  end

  # Source Control Management (docker host) - Debian 11
  config.vm.define "scm" do |scm|
    scm.vm.box = "merev/debian-11"
    scm.vm.hostname = "scm"
    scm.vm.network "private_network", ip: "192.168.99.101"
    scm.vm.synced_folder "shared/", "/shared"
    scm.vm.provision "shell", path: "initial-config/add_hosts.sh"
    scm.vm.provision "shell", path: "initial-config/ansible/ansible_debian_client.sh"
    scm.vm.provision "shell", path: "initial-config/monitoring/node_exp_setup.sh"
    scm.vm.provision "shell", path: "initial-config/docker/docker_setup.sh"
    scm.vm.provision "shell", path: "initial-config/scm/gitea_setup.sh"
  end

  # Jenkins Host - Debian 11
  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.box = "merev/debian-11"
    jenkins.vm.hostname = "jenkins"
    jenkins.vm.network "private_network", ip: "192.168.99.102"
    jenkins.vm.synced_folder "shared/", "/shared"
    jenkins.vm.provision "shell", path: "initial-config/add_hosts.sh"
    jenkins.vm.provision "shell", path: "initial-config/ansible/ansible_debian_client.sh"
    jenkins.vm.provision "shell", path: "initial-config/monitoring/node_exp_setup.sh"
    jenkins.vm.provision "shell", path: "initial-config/jenkins/jenkins_setup.sh"
  end

  # Apache Kafka Machine (docker host) - Debian 11
  config.vm.define "kafka" do |kafka|
    kafka.vm.box = "merev/debian-11"
    kafka.vm.hostname = "kafka"
    kafka.vm.network "private_network", ip: "192.168.99.103"
    kafka.vm.synced_folder "shared/", "/shared"
    kafka.vm.provision "shell", path: "initial-config/add_hosts.sh"
    kafka.vm.provision "shell", path: "initial-config/ansible/ansible_debian_client.sh"
    kafka.vm.provision "shell", path: "initial-config/monitoring/node_exp_setup.sh"
    kafka.vm.provision "shell", path: "initial-config/docker/docker_setup.sh"
  end


  # Monitoring Machine (docker host) - Debian 11
  config.vm.define "monitoring" do |monitoring|
    monitoring.vm.box = "merev/debian-11"
    monitoring.vm.hostname = "monitoring"
    monitoring.vm.network "private_network", ip: "192.168.99.104"
    monitoring.vm.synced_folder "shared/", "/shared"
    monitoring.vm.provision "shell", path: "initial-config/add_hosts.sh"
    monitoring.vm.provision "shell", path: "initial-config/ansible/ansible_debian_client.sh"
    monitoring.vm.provision "shell", path: "initial-config/monitoring/node_exp_setup.sh"
    monitoring.vm.provision "shell", path: "initial-config/docker/docker_setup.sh"
  end

  # Applications Machine (docker host) - Debian 11
  config.vm.define "apps" do |apps|
    apps.vm.box = "merev/debian-11"
    apps.vm.hostname = "apps"
    apps.vm.network "private_network", ip: "192.168.99.105"
    apps.vm.synced_folder "shared/", "/shared"
    apps.vm.provision "shell", path: "initial-config/add_hosts.sh"
    apps.vm.provision "shell", path: "initial-config/ansible/ansible_debian_client.sh"
    apps.vm.provision "shell", path: "initial-config/monitoring/node_exp_setup.sh"
    apps.vm.provision "shell", path: "initial-config/docker/docker_setup.sh"
    apps.vm.provider "virtualbox" do |v|
      v.gui = false
      v.memory = 1024
      v.cpus = 1
    end
  end

  # Applications Machine (web server) - Debian 11
  config.vm.define "web" do |web|
    web.vm.box = "merev/debian-11"
    web.vm.hostname = "web"
    web.vm.network "private_network", ip: "192.168.99.106"
    web.vm.synced_folder "shared/", "/shared"
    web.vm.provision "shell", path: "initial-config/add_hosts.sh"
    web.vm.provision "shell", path: "initial-config/ansible/ansible_debian_client.sh"
    web.vm.provision "shell", path: "initial-config/monitoring/node_exp_setup.sh"
  end

  # Applications Machine (database) - Debian 11
  config.vm.define "db" do |db|
    db.vm.box = "merev/debian-11"
    db.vm.hostname = "db"
    db.vm.network "private_network", ip: "192.168.99.107"
    db.vm.synced_folder "shared/", "/shared"
    db.vm.provision "shell", path: "initial-config/add_hosts.sh"
    db.vm.provision "shell", path: "initial-config/ansible/ansible_debian_client.sh"
    db.vm.provision "shell", path: "initial-config/monitoring/node_exp_setup.sh"
  end

end
