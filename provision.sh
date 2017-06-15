#!/bin/bash

yum install net-tools -y
systemctl disable firewalld
systemctl stop firewalld
setenforce 0
sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux && cat /etc/sysconfig/selinux

echo 10.0.15.100 mgt01.cloudera mgt01 > /etc/hosts
echo 10.0.15.101 dn01.cloudera dn01 >> /etc/hosts
echo 10.0.15.102 dn02.cloudera dn02 >> /etc/hosts
echo 10.0.15.103 dn03.cloudera dn03 >> /etc/hosts
echo 10.0.15.104 dn04.cloudera dn04 >> /etc/hosts

echo  DNS1=8.8.8.8 >> /etc/sysconfig/network-scripts/ifcfg-eth1
echo  DNS2=8.8.4.4 >> /etc/sysconfig/network-scripts/ifcfg-eth1
