cd /vagrant/project/webapp/hit-base-tool/hit-base-web/client
npm install
bower install
grunt build
mkdir ~/.m2
cp /vagrant/vagrant-ressources/settings.xml ~/.m2

cd /vagrant/project/webapp/hit-core
mvn clean install -DskipTests
cd /vagrant/project/webapp/hit-core-hl7v2
mvn clean install -DskipTests
cd /vagrant/project/webapp/hit-base-tool
mvn clean install -DskipTests

sudo rm /var/lib/tomcat7/webapps/hit-base-tool.war
sudo rm -r /var/lib/tomcat7/webapps/hit-base-tool
sudo cp /vagrant/project/webapp/hit-base-tool/hit-base-web/target/hit-base-tool.war /var/lib/tomcat7/webapps/
cd /var/lib/tomcat7/webapps/
sudo chown tomcat7 hit-base-tool.war
sudo chmod +r hit-base-tool.war
sudo service tomcat7 restart

#cd ~/h2/bin
#./h2.sh