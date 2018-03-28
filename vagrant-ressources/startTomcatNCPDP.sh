#!/bin/sh
sudo service tomcat7 stop
sudo rm /var/lib/tomcat7/logs/catalina.out
#value=`cat /vagrant/vagrant-ressources/logs/pid-h2db.txt`
#kill -9 $value
#bash /vagrant/vagrant-ressources/startH2.sh
sudo service tomcat7 stop
sudo rm /var/lib/tomcat7/webapps/hit-base-tool.war
sudo rm -R /var/lib/tomcat7/webapps/hit-base-tool
sudo cp /vagrant/project/webapp/hit-base-tool-ncpdp/hit-base-web/target/hit-base-tool.war /var/lib/tomcat7/webapps/
sudo chmod 755 /var/lib/tomcat7/webapps/hit-base-tool.war
sudo chown vagrant:vagrant /var/lib/tomcat7/webapps/hit-base-tool.war
sudo service tomcat7 debug
sudo iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 8000 -j ACCEPT
sudo tail -f /var/lib/tomcat7/logs/catalina.out
