# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false

  # config.vm.provider "virtualbox" do |v|
  #   v.gui = false
  #   v.memory = 2048
  #   v.cpus = 2
  # end
  
  # Ansible Host - CentOS Stream 9
  config.vm.define "ans" do |ans|
    ans.vm.box = "merev/centos-stream"
    ans.vm.hostname = "ansible"
    ans.vm.network "private_network", ip: "192.168.99.100"
    ans.vm.synced_folder "shared/", "/shared"
    ans.vm.provision "shell", path: "initial-config/add_hosts.sh"
    ans.vm.provision "shell", path: "initial-config/ansible/redhat_ansible_setup.sh"
    ans.vm.provision "shell", path: "initial-config/monitoring/node_exp_setup.sh"
    ans.vm.provider "virtualbox" do |v|
      v.gui = false
      v.memory = 2048
      v.cpus = 2
    end
  end

  # Jenkins Host - Debian 11
  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.box = "merev/debian-11"
    jenkins.vm.hostname = "jenkins"
    jenkins.vm.network "private_network", ip: "192.168.99.101"
    jenkins.vm.synced_folder "shared/", "/shared"
    jenkins.vm.provision "shell", path: "initial-config/add_hosts.sh"
    jenkins.vm.provision "shell", path: "initial-config/ansible/ansible_debian_client.sh"
    jenkins.vm.provision "shell", path: "initial-config/monitoring/node_exp_setup.sh"
    jenkins.vm.provision "shell", path: "initial-config/jenkins/jenkins_setup.sh"
    jenkins.vm.provider "virtualbox" do |v|
      v.gui = false
      v.memory = 1024
      v.cpus = 1
    end
  end

   # Docker Host - Debian 11
  config.vm.define "docker" do |docker|
    docker.vm.box = "merev/debian-11"
    docker.vm.hostname = "docker"
    docker.vm.network "private_network", ip: "192.168.99.102"
    docker.vm.synced_folder "shared/", "/shared"
    docker.vm.provision "shell", path: "initial-config/add_hosts.sh"
    docker.vm.provision "shell", path: "initial-config/ansible/ansible_debian_client.sh"
    docker.vm.provision "shell", path: "initial-config/monitoring/node_exp_setup.sh"
    docker.vm.provision "shell", path: "initial-config/monitoring/docker_setup.sh"
    docker.vm.provider "virtualbox" do |v|
      v.gui = false
      v.memory = 1024
      v.cpus = 1
    end
  end

  # # Apache Kafka Machine (docker host) - Debian 11
  # config.vm.define "kafka" do |kafka|
  #   kafka.vm.box = "merev/debian-11"
  #   kafka.vm.hostname = "kafka"
  #   kafka.vm.network "private_network", ip: "192.168.99.101"
  #   kafka.vm.synced_folder "shared/", "/shared"
  #   kafka.vm.provision "shell", path: "initial-config/add_hosts.sh"
  #   kafka.vm.provision "shell", path: "initial-config/ansible/ansible_debian_client.sh"
  #   kafka.vm.provision "shell", path: "initial-config/monitoring/node_exp_setup.sh"
  #   kafka.vm.provision "shell", path: "initial-config/monitoring/docker_setup.sh"
  #   kafka.vm.provision "shell", path: "initial-config/kafka/kafka_setup.sh"
  # end


  # # Monitoring Machine (docker host) - Debian 11
  # config.vm.define "monitoring" do |monitoring|
  #   monitoring.vm.box = "merev/debian-11"
  #   monitoring.vm.hostname = "monitoring"
  #   monitoring.vm.network "private_network", ip: "192.168.99.102"
  #   monitoring.vm.synced_folder "shared/", "/shared"
  #   monitoring.vm.provision "shell", path: "initial-config/add_hosts.sh"
  #   monitoring.vm.provision "shell", path: "initial-config/ansible/ansible_debian_client.sh"
  #   monitoring.vm.provision "shell", path: "initial-config/monitoring/docker_setup.sh"
  #   monitoring.vm.provision "shell", path: "initial-config/monitoring/prometheus_setup.sh"
  # end

end
