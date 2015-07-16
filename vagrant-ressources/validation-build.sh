sudo rm -r /vagrant/project/validation
git clone https://github.com/hl7-tools/v2-validation-legacy.git /vagrant/project/validation
cd /vagrant/project/validation
sbt clean install