#!/bin/sh
sudo service tomcat7 stop
sudo rm /var/lib/tomcat7/logs/catalina.out
#value=`cat /vagrant/vagrant-ressources/logs/pid-h2db.txt`
#kill -9 $value
#bash /vagrant/vagrant-ressources/startH2.sh
#sudo rm /vagrant/vagrant-ressources/db/erxtool.mv.db
#sudo rm /root/erxtool.mv.db
bash /vagrant/vagrant-ressources/webapp-build.sh -onlyDeploy
sudo service tomcat7 debug
sudo tail -f /var/lib/tomcat7/logs/catalina.out