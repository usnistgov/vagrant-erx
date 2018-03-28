# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    
    config.vm.define "webapp" do |webapp|
        webapp.vm.box = "ubuntu64-nist"
        webapp.vm.provision :shell, :path => "vagrant-config/bootstrap-webapp.sh"
        webapp.vm.network :private_network, ip: "192.168.0.101"
        webapp.vm.network :forwarded_port, guest: 8080, host: 8081
        webapp.vm.network :forwarded_port, guest: 8443, host: 8443
        webapp.vm.network :forwarded_port, guest: 8000, host: 8000
        webapp.vm.network :forwarded_port, guest: 3306, host: 3307
        webapp.vm.network :forwarded_port, guest: 9000, host: 9000
	webapp.vm.provider :virtualbox do |vb|
    	vb.customize ["modifyvm", :id, "--memory", 2048]
    end
    end

    config.vm.define "validation" do |validation|
        validation.vm.box = "ubuntu64-nist"
        validation.vm.provision :shell, :path => "vagrant-config/bootstrap-validation.sh"
        validation.vm.network :private_network, ip: "192.168.0.102"
	validation.vm.network :forwarded_port, guest: 22, host:2224
    end

    config.vm.define "xmlutil" do |xmlutil|
        xmlutil.vm.box = "ubuntu64-nist"
        xmlutil.vm.provision :shell, :path => "vagrant-config/bootstrap-xml-util.sh"
        xmlutil.vm.network :private_network, ip: "192.168.0.103"
    end
end
