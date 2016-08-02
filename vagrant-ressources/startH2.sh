/usr/bin/java -cp /vagrant/vagrant-ressources/h2-1.4.190.jar org.h2.tools.Server -tcpAllowOthers -webAllowOthers -baseDir / > /vagrant/vagrant-ressources/logs/logs.log &
#/usr/bin/java -cp /Users/mcl1/Documents/Projects/vagrant-erx/vagrant-ressources/h2-1.4.190.jar org.h2.tools.Server -tcpAllowOthers -baseDir /Users/mcl1/Documents/Projects/vagrant-erx/vagrant-ressources/db > /Users/mcl1/Documents/Projects/vagrant-erx/vagrant-ressources/logs/logs.log &
echo $! > /vagrant/vagrant-ressources/logs/pid-h2db.txt
sudo iptables -A INPUT -p tcp --dport 9092 -j ACCEPT