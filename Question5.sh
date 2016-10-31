#Question5.sh
#change to filewallSetup.sh
#!/bin/bash
#This program adds firewall rules to do various things

#Delete any previous rules in the INPUT, FORWARD and OUTPUT tables
Sudo iptables -F

#Enable ssh only from computers in the range 130.15.00 to 130.15.255.2                              
sudo iptables -A INPUT -p TCP -sport 22 -m -prange -src-range 130.15.0.0-130.15.255.255 

#Enable ssh from computers in any private network
sudo iptables -A INPUT -p TCP --sport 22 -m -prange --src-range 192.168.0.0-192.168.255.255 -j ACCEPT
sudo iptables -A INPUT -p TCP --sport 22 -m iprange --src-range 172.16.0.0-172.31.255.255 -j ACCEPT
sudo iptables -A INPUT -p TCP --sport 22 -m iprange --src-range 10.0.0.0-10.255.255.255 -j ACCEPT

#Enable http and https from any IP #should work
sudo iptables -A INPUT -p TCP -m TCP --dport 80 -j ACCEPT
sudo iptables -A INPUT -p TCP -m TCP --dport 443 -j ACCEPT

#Drop any other incoming tcp traffic #from command sheet
sudo iptables -A INPUT -j DROP

#Block connecting from your computer to any IP outside the range 130.15.0.0 to 130.15.255.255[netmask/16]
sudo iptables -A INPUT -sport 22 
#Only allow IP 130.15.100.100 to connect to your mysql running on port 3306

#Drop outgoing ssh traffic to all other computers #compare with notebook 
sudo iptables -A INPUT -p TCP -sport 22 -j DROP 

#Can you still ssh the VM from your host machine? Why? If you cant, how to fix it?
No. You must use port forwarding to allow the virtual machine to act like a normal guest on the home network. 
