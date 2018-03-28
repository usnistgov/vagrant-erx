cd /vagrant/project/xmlvalidation/schematronValidation
mvn clean install -Dmaven.test.skip=true --quiet
cd /vagrant/project/xmlvalidation/validation-report
mvn clean install -Dmaven.test.skip=true --quiet
cd /vagrant/project/xmlvalidation/hit-xml-validation
mvn clean install -Dmaven.test.skip=true --quiet
cd /vagrant/project/webapp/unified-report/unified-report
mvn clean install -Dmaven.test.skip=true --quiet
cd /vagrant/project/webapp/hit-core-xml
mvn clean install -Dmaven.test.skip=true --quiet
cd /vagrant/project/webapp/hit-erx-tool-config
mvn clean install -Dmaven.test.skip=true --quiet
cd /vagrant/project/webapp/hit-erx-tool
mvn clean install -Dmaven.test.skip=true --quiet