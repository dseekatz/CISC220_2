#Question5.sh
#change to filewallSetup.sh
#!/bin/bash
#This program adds firewall rules to do various things

#Delete any previous rules in the INPUT, FORWARD and OUTPUT tables
sudo iptables -F

#Enable ssh only from computers in the range 130.15.00 to 130.15.255.2                              
sudo iptables -A INPUT -p TCP --sport 22 -s 130.15.0.0/16 -j ACCEPT 

#Enable ssh from computers in any private network
sudo iptables -A INPUT -p TCP --sport 22 -s 192.168.0.0/16 -j ACCEPT
sudo iptables -A INPUT -p TCP --sport 22 -s 172.0.0.0/8 -j ACCEPT
sudo iptables -A INPUT -p TCP --sport 22 -s 10.0.0.0/8 -j ACCEPT

#Enable http and https from any IP
sudo iptables -A INPUT -p TCP --dport 80 -j ACCEPT
sudo iptables -A INPUT -p TCP --dport 443 -j ACCEPT

#Drop any other incoming tcp traffic
sudo iptables -A INPUT -p TCP -j DROP

#Block connecting from your computer to any IP outside the range 130.15.0.0 to 130.15.255.255[netmask/16]
sudo iptables -A OUTPUT -p TCP --dport 22 -d 130.15.0.0/16 -j ACCEPT

#Only allow IP 130.15.100.100 to connect to your mysql running on port 3306
sudo iptables -A INPUT -p TCP --dport 3306 -s 130.15.100.100 -j ACCEPT

#Drop outgoing ssh traffic to all other computers 
sudo iptables -A INPUT -p TCP --dport 22 -j DROP 

#Can you still ssh the VM from your host machine? Why? If you cant, how to fix it?
echo "No. You must use port forwarding to allow the virtual machine to act like a normal guest on the home network."
