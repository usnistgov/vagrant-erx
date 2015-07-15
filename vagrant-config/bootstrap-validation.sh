cd /tmp
sudo apt-get update -y
sudo apt-get install -y git
sudo apt-get install -y make
sudo apt-get install -y g++
sudo apt-get install -y maven

sudo apt-get install -y openjdk-7-jdk

mkdir /vagrant/project
cd /vagrant/project
sudo rm -r validation
mkdir validation
git clone https://github.com/hl7-tools/v2-validation-legacy.git validation

sudo apt-get install -y curl
sudo apt-get remove scala-library scala
sudo wget www.scala-lang.org/files/archive/scala-2.11.7.deb
sudo dpkg -i scala-2.11.7.deb
sudo apt-get update
sudo apt-get install -y scala
wget http://scalasbt.artifactoryonline.com/scalasbt/sbt-native-packages/org/scala-sbt/sbt/0.13.1/sbt.deb
sudo dpkg -i sbt.deb
sudo apt-get update
sudo apt-get install -y sbt

echo "export JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64" >> /home/vagrant/.bashrc
echo "export PATH=\$PATH:\$JAVA_HOME/bin" >> /home/vagrant/.bashrc
echo "export MAVEN_OPTS=\"-Dmaven.repo.local=/vagrant/.m2\"" >> /home/vagrant/.bashrc