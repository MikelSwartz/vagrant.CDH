#!/bin/bash

yum install net-tools wget vim -y
systemctl disable firewalld
systemctl stop firewalld
sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux
sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config

echo 10.0.15.100 mgt01.cloudera mgt01 > /etc/hosts
echo 10.0.15.101 dn01.cloudera dn01 >> /etc/hosts
echo 10.0.15.102 dn02.cloudera dn02 >> /etc/hosts
echo 10.0.15.103 dn03.cloudera dn03 >> /etc/hosts
echo 10.0.15.104 dn04.cloudera dn04 >> /etc/hosts

echo  DNS1=8.8.8.8 >> /etc/sysconfig/network-scripts/ifcfg-eth1
echo  DNS2=8.8.4.4 >> /etc/sysconfig/network-scripts/ifcfg-eth1

cd /vagrant/

wget https://archive.cloudera.com/cm5/installer/5.8.5.3/cloudera-manager-installer.bin
chmod u+x cloudera-manager-installer.bin
#./cloudera-manager-installer.bin
reboot
