# Vagrant ERX

Vagrant infrastructure for the ERX web application

## Installation

### Requirements

Before using this project, you need to install this tools :

* [Vagrant](https://www.vagrantup.com/downloads.html)
* [Virtualbox](https://www.virtualbox.org/wiki/Downloads)
* [Git](http://git-scm.com/downloads)

You'll also need to get the ubuntu server box configured with the NIST security script from the network disk :

	smb://itlnas.nist.gov/HIT/Vagrant/ubuntu64-nist.box

Copy this file in your home folder on your hard drive, open your terminal and execute the following command line :

	$ vagrant box add ubuntu64-nist ~/ubuntu64-nist.box

You may now delete the ubuntu64-nist.box file.

### Run vagrant

First, you'll need to clone the project.

	$ git clone https://vm-070.nist.gov/git/healthcare-it/erx/vagrant-erx.git
	
Then, create the .m2 repository (maven shared repository between the VMs) and you should be able to create and connect to the VMs :

	$ mkdir .m2
    $ vagrant up
	$ vagrant ssh [machine_name]

There is two vm, **webapp** and **validation**. The first one contains the webapp and the second one the validation engine.

*Note : to avoid misunderstanding, commands that begin by host have to be executed on your host machine, and those that begin by host have to by executed on the virtual machine through ssh*

### Build the validation engine

The first time you build the validation, you have to edit the file "/vagrant/project/validation/project/Dependencies.scala" and add those lines in the "resolutionRepos" var (the local maven repository already exist, erase the line and put those ones instead) :

    "NIST nexus" at "http://vm-070.nist.gov:8081/nexus/content/groups/public",
    "Local Maven Repository" at "file:///vagrant/.m2/repository"

Then, to build the validation, execute :

	host $ vagrant up
	host $ vagrant ssh webapp
	guest $ cd /vagrant/vagrant-ressources
	guest $ bash build_validation.sh

### Build the webapp

To build the webapp execute :

	host $ vagrant up
	host $ vagrant ssh webapp
	guest $ cd /vagrant/vagrant-ressources
	guest $ bash build_webapp.sh
	
This script is gonna build the frontend, compile the webapp and deploy it on the tomcat server listening on port 8080. Open a browser and go to [http://192.168.0.101:8080/hit-base-tool](http://192.168.0.101:8080/hit-base-tool). If the server doesn't seem to respond from your browser, execute those commands from the guest virtual machine :

	guest $ sudo iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
	guest $ sudo service tomcat7 restart

### Build outside NIST

If you already cloned the repository and have all the dependencies in the .m2 repository (you do if you already built the jars or if yu got if from another VM), you can force maven to use the jars you have in local instead of checking the NIST nexus first. To do so, type this command from the VM :

	$ sudo cp /vagrant/vagrant-ressources/settings-outside-nist.xml /vagrant/.m2/settings.xml
	

### Useful vagrant commands

Here is a list of some usefull vagrant commands. This is a non-exhaustive list, you can find all the vagrant commands [on the documentation](https://docs.vagrantup.com/v2/cli/index.html).

Start the VMs :

	$ vagrant up
	# Stop a specific VM : vagrant up [machine_name]
	
Connect to a VM using SSH :

	$ vagrant ssh [machine_name]

Stop the VMs :

	$ vagrant halt
	# Stop a specific VM : vagrant halt [machine_name]
	
