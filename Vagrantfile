# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
    
    config.vm.define "webapp" do |webapp|
        webapp.vm.box = "ubuntu64-nist"
        webapp.vm.provision :shell, :path => "vagrant-config/bootstrap-webapp.sh"
        webapp.vm.network :private_network, ip: "192.168.1.200"
        webapp.vm.network "forwarded_port", guest: 8080, host: 8080
    end

    config.vm.define "validation" do |validation|
        validation.vm.box = "ubuntu64-nist"
        validation.vm.provision :shell, :path => "vagrant-config/bootstrap-validation.sh"
        validation.vm.network :private_network, ip: "192.168.1.201"
    end
end
