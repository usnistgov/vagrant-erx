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
	
Then, you should be able to generate and connect to the VMs :

	$ vagrant up
	$ vagrant ssh [machine_name]

There is two vm, **webapp** and **validation**. The first one contains the webapp and the second one the validation engine.

### Build the webapp

*Note : to avoid misunderstanding, commands that begin by host have to be executed on your host machine, and those that begin by host have to by executed on the virtual machine through ssh*

To build the webapp execute :

	host $ vagrant up
	host $ vagrant ssh webapp
	guest $ cd /vagrant/vagrant-resources
	guest $ bash build_webapp.sh
	
This script is gonna build the frontend, compile the webapp and deploy it on the tomcat server listening on port 8080. Open a browser and go to [http://192.168.0.101:8080/hit-base-tool](http://192.168.0.101:8080/hit-base-tool). If the server doesn't seem to respond from your browser, execute those commands from the guest virtual machine :

	guest $ sudo iptables -A INPUT -p tcp --dport 8080 -j ACCEPT
	guest $ sudo service tomcat7 restart
	

### Build the validation engine

Work in progress...

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
	
