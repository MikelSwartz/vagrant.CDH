# vagrant.CDH

# Setup NAT Network in VirtualBox
VBoxManage natnetwork add --netname CDHNatNetwork --network 10.0.15.0/24 --enable --dhcp on
