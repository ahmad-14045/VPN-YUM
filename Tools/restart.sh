#!/bin/bash

clear

# Restarting
service fail2ban restart
service vnstat restart
service sshd restart
service dropbear restart
service stunnel restart
service squid restart
service wildyproject restart

echo "Successfull Restarting Service !"
