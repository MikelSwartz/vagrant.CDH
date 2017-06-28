#!/bin/bash

#Cloudera Version
VER=5.8.5.3

yum install net-tools -y
systemctl disable firewalld
systemctl stop firewalld

sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux
sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config

echo 127.0.0.1   localhost.localhost localhost > /etc/hosts
echo 10.0.15.100 mgt01.cloudera      mgt01 >> /etc/hosts
echo 10.0.15.101 dn01.cloudera       dn01 >> /etc/hosts
echo 10.0.15.102 dn02.cloudera       dn02 >> /etc/hosts
echo 10.0.15.103 dn03.cloudera       dn03 >> /etc/hosts
echo 10.0.15.104 dn04.cloudera       dn04 >> /etc/hosts

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

if [ $(hostname) == "mgt01.cloudera" ] ; then
  yum install wget vim -y 
  if [ -s cloudera-manager-installer.bin ] ; then
    echo cloudera-manager-installer.bin already downloaded.
  else
    wget -O https://archive.cloudera.com/cm5/installer/$VER/cloudera-manager-installer.bin
    chmod u+x cloudera-manager-installer.bin
  fi
fi

systemctl disable firewalld
echo 10 > /proc/sys/vm/swappiness
sysctl vm.swappiness=10
sed -i '/^vm.swappiness.*/d' /etc/sysctl.conf
echo "vm.swappiness = 10" >> /etc/sysctl.conf
echo never > /sys/kernel/mm/transparent_hugepage/defrag
echo never > /sys/kernel/mm/transparent_hugepage/enabled

reboot
