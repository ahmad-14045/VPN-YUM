#!/bin/bash
IP=$( curl -s ifconfig.co )
clear
read -p "Username ( SSH Username ) : " Login
read -p "Password ( SSH Password ) : " Pass
read -p "Expired  ( Number Only )  : " masaaktif

# Adding User
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null

today=$( date -d "0 days" +"%Y-%m-%d" )
expired=$( date -d "$masaaktif days" +"%Y-%m-%d" )

clear
echo -e "Premium SSH Account : "
echo -e "=========================="
echo -e " IP/Host  : $IP"
echo -e " Username : $Login"
echo -e " Password : $Pass"
echo -e "=========================="
echo -e " OpenSSH  : 22,143"
echo -e " Dropbear : 110,123"
echo -e " Stunnel  : 443,990"
echo -e " Squid    : 80,8080,3128"
echo -e " BadVPN   : 7100-7300"
echo -e "=========================="
echo -e " Created  : $today"
echo -e " Expired  : $expired"
echo -e "=========================="
echo -e "Script By WildyProject"
