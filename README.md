# vagrant.CDH

# Setup NAT Network in VirtualBox
VBoxManage natnetwork add --netname CDHNatNetwork --network 10.0.15.0/24 --enable --dhcp on

# PASSWORD file
Create a text file name 'PASSWORD' with the password you want to use for this project.   
It needs to be written two times with no other characters. 
EXAMPLE:

*password*
*password*

