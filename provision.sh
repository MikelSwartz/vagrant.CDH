#!/bin/bash

yum install net-tools wget -y
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


sed -i 's/^PasswordAuthentication.*/PasswordAuthentication yes/g' /etc/ssh/sshd_config
/bin/systemctl restart  sshd.service
chmod +w /etc/sudoers
sed -i 's/^\%wheel.*/##%wheel ALL=(ALL)       ALL/g' /etc/sudoers
sed -i 's/^# \%wheel.*/%wheel  ALL=(ALL)       NOPASSWD: ALL/g' /etc/sudoers
chmod -w /etc/sudoers
cd /vagrant/

adduser cloudera -g wheel
echo -e "$(cat PASSWORD)" |passwd cloudera
echo -e "$(cat PASSWORD)" |passwd 

systemctl disable firewalld
#reboot
