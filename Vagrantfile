# -*- mode: ruby -*-
# vi: set ft=ruby :
#Run this bash command below to setup the private network on VBox
# VBoxManage natnetwork add --netname CDHNatNetwork --network 10.0.15.0/24 --enable --dhcp on

Vagrant.configure("2") do |config|
  config.vm.define  "dn01" do |dn01|
    config.vm.provider "virtualbox" do |vb|
      vb.name = "dn01"
      vb.memory = "1024"
    end
    dn01.vm.box = "centos/7"
    dn01.vm.hostname = "dn01.cloudera"
    dn01.vm.network "private_network", ip: "10.0.15.101"
    dn01.vm.synced_folder ".", "/vagrant"
    dn01.vm.provision "shell", path: "provision.sh"
  end

  config.vm.define  "dn02" do |dn02|
    config.vm.provider "virtualbox" do |vb|
      vb.name = "dn02"
      vb.memory = "1024"
    end
    dn02.vm.box = "centos/7"
    dn02.vm.hostname = "dn02.cloudera"
    dn02.vm.network "private_network", ip: "10.0.15.102"
    dn02.vm.synced_folder ".", "/vagrant"
    dn02.vm.provision "shell", path: "provision.sh"
  end

  config.vm.define  "dn03" do |dn03|
    config.vm.provider "virtualbox" do |vb|
      vb.name = "dn03"
      vb.memory = "1024"
    end
    dn03.vm.box = "centos/7"
    dn03.vm.hostname = "dn03.cloudera"
    dn03.vm.network "private_network", ip: "10.0.15.103"
    dn03.vm.synced_folder ".", "/vagrant"
    dn03.vm.provision "shell", path: "provision.sh"
  end

  config.vm.define  "dn04" do |dn04|
    config.vm.provider "virtualbox" do |vb|
      vb.name = "dn04"
      vb.memory = "1024"
    end
    dn04.vm.box = "centos/7"
    dn04.vm.hostname = "dn04.cloudera"
    dn04.vm.network "private_network", ip: "10.0.15.104"
    dn04.vm.synced_folder ".", "/vagrant"
    dn04.vm.provision "shell", path: "provision.sh"
  end

  config.vm.define  "mgt01" do |mgt01|
    config.vm.provider "virtualbox" do |vb|
      vb.name = "mgt01"
      vb.memory = "8192"
      vb.cpus = 3
    end
    mgt01.vm.synced_folder ".", "/vagrant", type: "nfs"
    mgt01.vm.box = "centos/7"
    mgt01.vm.hostname = "mgt01.cloudera"
    mgt01.vm.network "private_network", ip: "10.0.15.100"
    mgt01.vm.synced_folder ".", "/vagrant"
    mgt01.vm.provision "shell", path: "provision.sh"
    mgt01.vm.network "forwarded_port", guest: 7180, host: 7180
    mgt01.vm.network "forwarded_port", guest: 8888, host: 7188
    mgt01.vm.network "forwarded_port", guest: 8889, host: 7189
  end
end
