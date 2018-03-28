function buildJars {
    cd /vagrant/project/xmlvalidation/schematronValidation
    mvn clean install -Dmaven.test.skip=true --quiet
    cd /vagrant/project/xmlvalidation/validation-report
    mvn clean install -Dmaven.test.skip=true --quiet
    cd /vagrant/project/xmlvalidation/hit-xml-validation
    mvn clean install -Dmaven.test.skip=true --quiet
    cd /vagrant/project/webapp/unified-report/unified-report
    #git pull
    mvn clean install -Dmaven.test.skip=true --quiet
    cd /vagrant/project/webapp/hit-core 
    #git pull
    mvn clean install -Dmaven.test.skip=true --quiet
    cd /vagrant/project/webapp/hit-core-edi
    #git pull
    mvn clean install -Dmaven.test.skip=true --quiet
    cd /vagrant/project/webapp/hit-core-xml
    #git pull
    mvn clean install -Dmaven.test.skip=true --quiet
    cd /vagrant/project/webapp/message-utils
    #git pull
    mvn clean install -Dmaven.test.skip=true --quiet
    cd /vagrant/project/webapp/erx-resource-bundle
    #git pull
    #mvn clean install -Dmaven.test.skip=true --quiet
    cd /vagrant/project/webapp/ncpdp-erx-resource-bundle
    #git pull
    mvn clean install -Dmaven.test.skip=true --quiet
    cd /vagrant/project/webapp/VitalRecordsCDA
    #git pull
    #mvn clean install -Dmaven.test.skip=true --quiet
    cd /vagrant/project/webapp/hit-erx-tool-config
    #git pull
    mvn clean install -Dmaven.test.skip=true --quiet
    cd /vagrant/project/webapp/hit-erx-tool
    #git pull
    mvn clean install -Dmaven.test.skip=true --quiet
}

function buildWebapp {
    cd /vagrant/project/webapp/hit-erx-tool
    #git pull
    mvn clean install -Dmaven.test.skip=true --quiet
}

function deployWar {
    sudo service tomcat7 stop
    sudo rm /var/lib/tomcat7/webapps/hit-base-tool.war
    sudo rm -R /var/lib/tomcat7/webapps/hit-base-tool
    sudo cp /vagrant/project/webapp/hit-erx-tool/hit-base-web/target/hit-base-tool.war /var/lib/tomcat7/webapps/
    sudo chmod 755 /var/lib/tomcat7/webapps/hit-base-tool.war
    sudo chown vagrant:vagrant /var/lib/tomcat7/webapps/hit-base-tool.war
    sudo iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
    sudo iptables -A INPUT -p tcp --dport 8000 -j ACCEPT
}

if [ $# == 1 ]; then
    case "$1" in
        '-onlyJars')
            buildJars
            ;;
        '-onlyDeploy')
            deployWar
            ;;
        '-onlyWebapp')
            buildWebapp
            deployWar
            ;;
        '-help')
            echo 'Help - Webapp build options (use bash webapp-build -[option]) :'
            echo 'Option -onlyJars to build only the jars and the war'
            echo 'Option -onlyDeploy to only deploy the war'
            echo 'Option -onlyWebapp to build the webapp'
            echo 'Option -help to display the help'
            ;;
        *)
            echo 'Invalid parameter. use the option -help to display the help (bash webapp-build -help)'
            ;;
    esac
else
    #build everything
    buildJars
    deployWar
fi
