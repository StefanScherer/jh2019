# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "StefanScherer/windows_10"

  config.vm.provider "vmware_desktop" do |v|
    v.gui = true
    v.memory = "2048"
  end
  config.vm.provision "shell", path: "./provision.ps1", privileged: false
end
