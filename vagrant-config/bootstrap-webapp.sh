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

#Tomcat installation - Reference https://www.mulesoft.com/tcat/tomcat-linux#sthash.18qlAj55.dpuf

cd /tmp
#wget http://mirror.cc.columbia.edu/pub/software/apache/tomcat/tomcat-7/v7.0.63/bin/apache-tomcat-7.0.63.tar.gz
wget http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.63/bin/apache-tomcat-7.0.63.tar.gz
tar xvzf apache-tomcat-7.0.63.tar.gz
sudo mv apache-tomcat-7.0.63 /var/lib/tomcat7
sudo cp /vagrant/vagrant-ressources/tomcat7 /etc/init.d/
sudo chmod 755 /etc/init.d/tomcat7
sudo update-rc.d tomcat7 defaults
sudo iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
echo "org.apache.jasper.compiler.TldLocationsCache.level = FINE" >> /var/lib/tomcat7/conf/logging.properties

#cd ~/
#wget http://www.h2database.com/h2-2015-04-10.zip
#unzip h2-2015-04-10.zip
#sudo rm h2-2015-04-10.zip
#cd h2/bin
#chmod +x h2.sh

if [ ! -d "/vagrant/project" ]; then 
	mkdir /vagrant/project
fi
cd /vagrant/project
if [ ! -d "/vagrant/webapp" ]; then 
	sudo rm -r webapp
fi
mkdir webapp
git clone https://github.com/haffo/hit-core.git webapp/hit-core
git clone https://github.com/usnistgov/hit-core-erx webapp/hit-core-erx
git clone https://github.com/usnistgov/hit-erx-tool.git webapp/hit-erx-tool
#TODO : uncomment this line when the resource bundle will be public
#git clone https://github.com/usnistgov/erx-resource-bundle.git webapp/erx-resource-bundle

echo "export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64" >> /home/vagrant/.bashrc
echo "export PATH=\$PATH:\$JAVA_HOME/bin" >> /home/vagrant/.bashrc
echo "export CATALINA_HOME=/var/lib/tomcat7" >> /home/vagrant/.bashrc
echo "sudo iptables -A INPUT -p tcp --dport 8080 -j ACCEPT" >> /home/vagrant/.bashrc
echo "export MAVEN_OPTS=\"-Dmaven.repo.local=/vagrant/.m2\"" >> /home/vagrant/.bashrc

cp /vagrant/vagrant-ressources/settings.xml /vagrant/.m2