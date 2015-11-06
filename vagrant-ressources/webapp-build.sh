function buildFrontEnd {
    cd /vagrant/project/webapp/hit-erx-tool/hit-base-web/client
    npm install
    bower install
    grunt build
}

function buildJars {

    cd /vagrant/project/webapp/erx-resource-bundle
    #git pull
    mvn clean install -DskipTests
    cd /vagrant/project/webapp/unified-report/unified-report
    #git pull
    mvn clean install -DskipTests
    cd /vagrant/project/webapp/hit-core
    #git pull
    mvn clean install -DskipTests
    cd /vagrant/project/webapp/hit-core-edi
    #git pull
    mvn clean install -DskipTests
    cd /vagrant/project/webapp/hit-core-xml
    #git pull
    mvn clean install -DskipTests
    cd /vagrant/project/webapp/hit-erx-tool-config
    #git pull
    mvn clean install -DskipTests
    cd /vagrant/project/webapp/hit-erx-tool
    #git pull
    mvn clean install -DskipTests
}

function deployWar {
    sudo service tomcat7 stop
    sudo rm /var/lib/tomcat7/webapps/hit-base-tool.war
    sudo rm -r /var/lib/tomcat7/webapps/hit-base-tool
    sudo cp /vagrant/project/webapp/hit-erx-tool/hit-base-web/target/hit-base-tool.war /var/lib/tomcat7/webapps/
    sudo chmod 755 /var/lib/tomcat7/webapps/hit-base-tool.war
    sudo chown vagrant:vagrant /var/lib/tomcat7/webapps/hit-base-tool.war
    sudo iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
    sudo iptables -A INPUT -p tcp --dport 8000 -j ACCEPT
}

if [ $# == 1 ]; then
    case "$1" in
        '-onlyFrontend')
            buildFrontEnd
            ;;
        '-onlyJars')
            buildJars
            ;;
        '-onlyDeploy')
            deployWar
            ;;
        '-noFrontend')
            buildJars
            deployWar
            ;;
        '-help')
            echo 'Help - Webapp build options (use bash webapp-build -[option]) :'
            echo 'Option -onlyFrontend to build only the AngularJS part of the webapp'
            echo 'Option -onlyJars to build only the jars and the war'
            echo 'Option -onlyDeploy to only deploy the war'
            echo 'Option -noFrontend to build the jars and the war, and then deploy the war'
            echo 'Option -help to display the help'
            ;;
        *)
            echo 'Invalid parameter. use the option -help to display the help (bash webapp-build -help)'
            ;;
    esac
else
    #build everything
    buildFrontEnd
    buildJars
    deployWar
fi