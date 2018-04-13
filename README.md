# Mikrotik-antimining
Antimining scripts for Mikrotik

This instruction created for ROS to block mining in users' browsers. It helps to save resources of PC or other gadgets and don't 
strain your nerves.

I found couple instructions but they are for local usage, for such software as Ublock, Adblock or system's host file. I decided to 
implement them for all my networks and created scripts and instructions for Mikrotik implementation.

The main idea is to get lists from other repositories: 

https://raw.githubusercontent.com/hoshsadiq/adblock-nocoin-list/master/hosts.txt

https://raw.githubusercontent.com/greatis/Anti-WebMiner/master/hosts

and convert them to ROS scripts.
You need:
- Linux machine with WEB server
- Mikrotik router (it could be ROS on your VM)

At first you have to put ad_stop.sh somewhere to your server and to give +x permissions.
The second step is to create directory, which will be reacheble via http. (Webserver configuration is needed) It could be server in your local network or even your working PC.
The third step is to add script to sheduller and to check it's opportunity to work. Just enter to your brovser http://yourserverip/ and you will see antimining_dns.rsc file.
The last step is to configure Mikrotik and to add script for downloading and applying antimining_dns.rsc. In addition you have to configure sheduller.


