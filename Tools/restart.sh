#!/bin/bash

# Clear
clear

# Restarting
service fail2ban restart
service vnstat restart
service sshd restart
service dropbear restart
service stunnel restart
service squid restart
service wildyproject restart

# Output
echo ""
echo "Successfull Restarting Service !"
