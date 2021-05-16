#!/bin/bash
# Auto Setup SSH VPN Tunneling
# Supported For Centos 7 , 8 & Fedora 31 , 32 , 33
# Auther  : Wildy Project ( Wildy Sheverando )
# License : ©
# ======================================================

# Installation && Updating Repository
yum update -y
yum upgrade -y
yum install curl -y
yum install wget -y

