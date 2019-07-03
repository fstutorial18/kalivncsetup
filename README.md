# kali Linux Raspberry VNC Server Setup
## Summary
This script will auto setup vncserver, VNC server will auto start on boot in Kali Linux Raspberry Pi 3B/B+ and Raspberry Pi Zero W for VNC session
## Features 
Auto configured VNC server for remote session for RPI Kali Linux, auto start VNC server on boot you can easily change resolution, depth, VNC server password using this script 
## How to setup?
First of all tightvncserver must be installed, it already preinstall in Kali Linux ARM.
#### <code>apt-get install tightvncserver</code>
And Then.
#### <code>git clone https://github.com/febripranata/kalivncsetup.git</code>
#### <code>cd kalivncsetup</code>
give executable permission.
#### <code> chmod +x setup.sh </code>
Run it and follow instructions.
#### <code>./setup.sh</code>
