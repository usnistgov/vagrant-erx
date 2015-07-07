cd /vagrant/project/webapp/hit-base-tool/hit-base-web/client
npm install
bower install
grunt build

cd /vagrant/project/webapp/hit-core
git pull
mvn clean install -DskipTests
cd /vagrant/project/webapp/hit-core-hl7v2
git pull
mvn clean install -DskipTests
cd /vagrant/project/webapp/hit-resource-bundle
git pull
mvn clean install -DskipTests
cd /vagrant/project/webapp/hit-base-tool
git pull
mvn clean install -DskipTests

sudo rm /var/lib/tomcat7/webapps/hit-base-tool.war
sudo rm -r /var/lib/tomcat7/webapps/hit-base-tool
sudo cp /vagrant/project/webapp/hit-base-tool/hit-base-web/target/hit-base-tool.war /var/lib/tomcat7/webapps/
cd /var/lib/tomcat7/webapps/
sudo chmod +r hit-base-tool.war
sudo service tomcat7 restart

#cd ~/h2/bin
#./h2.sh