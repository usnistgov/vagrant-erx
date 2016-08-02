cd /vagrant/project/webapp/hit-core
#git pull
mvn clean install -DskipTests
cd /vagrant/project/webapp/hit-erx-tool-config
#git pull
mvn clean install -DskipTests
cd /vagrant/project/webapp/hit-erx-tool
#git pull
mvn clean install -DskipTests