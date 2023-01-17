#!/bin/bash

echo "* Update repositories and install Java"
apt-get update -y
apt-get install -y fontconfig openjdk-11-jre groovy git curl

echo "* Add and import the repository key"
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | tee /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "* Update repositories and install Jenkins"
apt-get update -y && apt-get install -y jenkins

echo "* Stop Jenkins"
systemctl stop jenkins

echo "* Turn off setup wizard"
sed -i 's/# arguments to pass to java/JAVA_OPTS="-Djenkins.install.runSetupWizard=false"/' /etc/default/jenkins

echo "* Upload Groovy scripts"
mkdir /var/lib/jenkins/init.groovy.d
cp /shared/jenkins/*.groovy /var/lib/jenkins/init.groovy.d/
chown -R jenkins:jenkins /var/lib/jenkins/init.groovy.d/

echo "* Start Jenkins" 
systemctl start jenkins

echo "* Download Jenkins Plugin Manager" 
wget https://github.com/jenkinsci/plugin-installation-manager-tool/releases/download/2.12.9/jenkins-plugin-manager-2.12.9.jar

echo "* Install Plugins" 
java -jar jenkins-plugin-manager-*.jar --war /usr/share/java/jenkins.war --plugin-file /shared/jenkins/plugins.txt -d /var/lib/jenkins/plugins --verbose

echo "* Restart Jenkins" 
systemctl restart jenkins

echo "* Download Jenkins CLI"
wget http://192.168.99.102:8080/jnlpJars/jenkins-cli.jar