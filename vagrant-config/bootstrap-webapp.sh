cd /tmp
sudo apt-get update -y
sudo apt-get install -y git
sudo apt-get install -y make
sudo apt-get install -y g++
sudo apt-get install -y nodejs npm --force-yes
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo apt-get install -y maven
#sudo apt-get install -y python-software-properties
#sudo add-apt-repository ppa:webupd8team/java
#sudo apt-get update -y
#echo debconf shared/accepted-oracle-license-v1-1 select true | \ 
#    sudo debconf-set-selections
#echo debconf shared/accepted-oracle-license-v1-1 seen true | \
#    sudo debconf-set-selections
#sudo apt-get install -y oracle-java7-installer
sudo apt-get install -y openjdk-7-jdk
sudo apt-get install -y tomcat7

sudo chgrp -R tomcat7 /etc/tomcat7
sudo chmod -R g+w /etc/tomcat7 
sudo chgrp -R tomcat7 /var/lib/tomcat7/
sudo chmod -R g+w /var/lib/tomcat7/
#cd ~/
#wget http://www.h2database.com/h2-2015-04-10.zip
#unzip h2-2015-04-10.zip
#sudo rm h2-2015-04-10.zip
#cd h2/bin
#chmod +x h2.sh

mkdir /vagrant/project
cd /vagrant/project
sudo rm -r webapp
mkdir webapp
git clone https://github.com/haffo/hit-core.git webapp/hit-core
git clone https://github.com/haffo/hit-core-hl7v2.git webapp/hit-core-hl7v2
git clone https://github.com/haffo/hit-base-tool.git webapp/hit-base-tool

echo "JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64/bin" >> /home/vagrant/.bashrc
echo "\$PATH=\$PATH:\$JAVA_HOME" >> /home/vagrant/.bashrc