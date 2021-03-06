#!/bin/sh
sudo service tomcat7 stop
sudo rm /var/lib/tomcat7/logs/catalina.out
#value=`cat /vagrant/vagrant-ressources/logs/pid-h2db.txt`
#kill -9 $value
#bash /vagrant/vagrant-ressources/startH2.sh
bash /vagrant/vagrant-ressources/webapp-build.sh -onlyDeploy
sudo service tomcat7 debug
sudo iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 8000 -j ACCEPT
sudo tail -f /var/lib/tomcat7/logs/catalina.out
