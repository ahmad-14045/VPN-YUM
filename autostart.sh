#!/bin/bash
# Auto Setup SSH VPN Tunneling
# Supported For Centos 7 , 8 & Fedora 31 , 32 , 33
# Auther  : Wildy Project ( Wildy Sheverando )
# License : ©
# ======================================================

# Root Validating
if [ "${EUID}" -ne 0 ]; then
		echo -e "${RED}Eror !${NC} Please Run This Script As Root User !!"
		exit 0
fi

# Checking Operating System Information
OS_MU_LAPET=$( cat /etc/os-release | grep ID | cut -d " " -f 2-3 | head -n1 | sed 's/ID=//g' )
if [[ $OS_MU_LAPET == "centos" ]]; then
  echo "$OS_MU_LAPET Detected !"
elif [[ $OS_MU_LAPET == "fedora" ]]; then
  echo "$OS_MU_LAPET Detected !"
elif [[ $OS_MU_LAPET == "debian" ]]; then
  echo "$OS_MU_LAPET Detected , But This Script Not Supported For Debian !"
  exit 1
elif [[ $OS_MU_LAPET == "ubuntu" ]]; then
  echo "$OS_MU_LAPET Detected , But This Script Not Supported For Ubuntu !"
  exit 1
else
  echo "$OS_MU_LAPET Detected , But This Script Not Supported For $OS_MU_LAPET"
  exit 1
fi

# Installation && Updating Repository
yum update -y
yum upgrade -y
yum install curl -y
yum install wget -y

