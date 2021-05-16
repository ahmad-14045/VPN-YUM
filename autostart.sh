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
yum install sudo -y
yum install epel-release -y

# Configure AcceptEnv On SSHD_CONFIG
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
service sshd restart

# Disableing IPV6
echo 0 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 0 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local
sed -i '$ i\echo 0 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.d/rc.local

# Installing Neofetch 
# ( Why Not Install From The Official Repository ? 
# Because there are some kernels that can't be installed / crash frequently )
wget -q -O /usr/bin/neofetch https://raw.githubusercontent.com/wildyproject/VPN-YUM/main/Tools/neofetch.sh
chmod +x /usr/bin/neofetch

# Install Helper Tools
yum install cmake wget unzip zip zlib-devel bzip2 git gcc screen make nano vim -y

# Installing VNSTAT For Bandwidth Monitoring
INTERFACE=$(ip route show to default | awk '{print $5}');
yum install sqlite-devel -y
yum install vnstat -y
vnstat -u -i $INTERFACE
systemctl enable vnstat
service vnstat restart
echo "MAILTO=root" > /etc/cron.d/vnstat
echo "*/5 * * * * root /usr/sbin/vnstat.cron" >> /etc/cron.d/vnstat
service vnstat restart
chkconfig vnstat on

# Setting Banner && OpenSSH Port
wget -q -O /etc/wildyproject/banner 
mkdir -p /etc/wildyproject/
echo "banner /etc/wildyproject/banner">> /etc/ssh/sshd_config
sed -i '/Port 22/a Port 143' /etc/ssh/sshd_config
sed -i 's/#Port 22/Port 22/g' /etc/ssh/sshd_config
service sshd restart
chkconfig sshd on

# Install Dropbear Yum
yum install dropbear -y
echo "OPTIONS=\"-b /etc/bannerssh.txt -p 109 -p 456 \"" > /etc/sysconfig/dropbear
echo "/bin/false" >> /etc/shells
service dropbear restart
chkconfig dropbear on

# Install Squid 3 For Yum
yum install squid -y
wget -q -O /etc/squid/squid.conf 
sed -i $MYIP2 /etc/squid/squid.conf;
service squid restart
chkconfig squid on

# Install Stunnel For Yum
yum install stunnel -y
cat > /etc/stunnel/stunnel.conf << END
cert = /etc/stunnel/stunnel.pem
client = no

[dropbear]
accept = 443
connect = 127.0.0.1:110

[dropbear]
accept = 990
connect = 127.0.0.1:143
END

# Installing Stunnel Certificate
cat > /etc/stunnel/stunnel.pem << END
# Certificate Generated By WildyProject
# At 16 Mei 2021 | 8:08 PM {WIB/ID}
# =========================================
-----BEGIN RSA PRIVATE KEY-----
MIIEpQIBAAKCAQEAuWpOz2qiqABucgOUYOacK1XOgwSjFecrQjD2BByFU7+NRzoL
EDUFXuqsDoc24QLggbT38mBSBRLcl8FO+FQuBekBx/LGqif1Z+3euxcWickeMqPs
NhaCZO2kMopLox2bnegSGK5X5QJA1CwzSjChJiGakYQeSzjPszcPE6Lp3nBh4I//
ssiQr9Hv/MNoDdHlEyKxUb2ETuc1DVUpqf9MoNs1Isvblm5EblHz831BV2FScV4B
b6rP7XSd3vsWfIbF2Z1V3hXiOCbgg3mc1B7ZaKAH2i8CeVBTCzWCFhlcVf0o/3nO
/kv+KRzB+AuQWAnAklTADE6z8YeJ7xRg74WfDQIDAQABAoIBAQCxBWgc62hEEbVg
sT42jbXIQfIacJDr1nschPY80qYQYS+XMzlgzd5E0rRWYo3oogCKlaasB34HTgzB
7lNhD62pAt8qcQVvaxsHkLk30kE4Z4WnP43DzhXMGn7LqfGw2BG83tZ4LevIvy/5
4gFN8cPJTgfuqj7p/mF+bzC7xKyYKvzHM70zTbHjNJ+6pHyWK6k8Dx4KFIKTcGR0
WkLommFrS2EzEhYcxcl/wnxJm9uGKHXx83+g/osjEdahyYTidcbiI+h3b7249DCq
dn9pP2jkSl2THUSm70bQVJh/gDAIVmySbKdPWycl0dVQ2B69YQfkwUA2qj3FEEVw
Ds+DDsMZAoGBAPT2r0q2q8e3rtI6oCHvBM5tDwXh93WuiGO3LFqI8bG/FbXIDAIN
hcMeXDNmt+ukadvuTcgzXzvZwgsbNmXR/NMZTx1H+B6bn6sXrbWyzJmeRLzHsCDc
ENNcFfL0ypCAazpeNBkZ9qB/3b9t9kw+hCQPd3s70P3gzRQtTNdumBzPAoGBAMHE
0MoqeQRfe/pe3vVk2nYvOldixNXQL9lDPvaK088+xjlGXFd0+anV6b1TUY0a4Wr/
PXwL3lZIIRE9eqxxpBIPHo/NPkDfFnNlK/x41260MT4BorLS75grMZ+X9MMstyLC
ZDNqpQYRbQzSi1zF4tdlT7nxoTLIZFVmkpJGspVjAoGAPj3f1FAN3bUiSnBy96xP
wFOdmZUM1239YbjNIEPjhZJT5dhqlKry7dzs+HKFEO65pxQp11CWRhLSZxgG/mAY
qVqo63u5460PKN3fWWeQ7Qd117G1YuQHsmyXdyATyBuZIz+EZUxfifBzW4yJJF5O
HQuBBGLye09/TD0mZSbIp6kCgYEArBc9i9+O3UhkVqe9gtoQgBhPy16IDJE6fc4Q
dGw104EgEawgxPe56JF4Z1JBQn3WJ+4KUEpGLAEhhStB8Td4jSVqcjLJkFnRmakI
GNHGG6bjePuA4Ssf6diq2N/fXRwwhil5ToTvjWUaoeG4Liv93Gk5Fp64GN8K5SIV
GN67KpsCgYEAkibil7mwyZAQxcZikY0Kl+KGt0yP4iHMYRlZQ8RdF8V4n6l9kpE4
8ZC6fuNdk4kMfNcbnQY1oIhjepY1xlxt35YR6TET8ZYJ4lq0NuboTcldtcukwHZ6
bGDj3AWyTdpO60f/eT1esZrSvTBB9ccj/YpWf2zInDtvCP0xco7G7qw=
-----END RSA PRIVATE KEY-----
-----BEGIN CERTIFICATE-----
MIIENTCCAx2gAwIBAgIUbhcwybuS0runWXC+MCNsZV0Z4iYwDQYJKoZIhvcNAQEL
BQAwgakxCzAJBgNVBAYTAklEMQ0wCwYDVQQIDARNYXJzMRQwEgYDVQQHDAtQbGFu
ZXQtTWFyczEZMBcGA1UECgwQV2lsZHlQcm9qZWN0Lm5ldDEZMBcGA1UECwwQV2ls
ZHlQcm9qZWN0Lm5ldDEZMBcGA1UEAwwQV2lsZHlQcm9qZWN0Lm5ldDEkMCIGCSqG
SIb3DQEJARYVYWRtaW5AaWxkeVByb2plY3QubmV0MB4XDTIxMDUxNjEzMDcyM1oX
DTI0MDUxNTEzMDcyM1owgakxCzAJBgNVBAYTAklEMQ0wCwYDVQQIDARNYXJzMRQw
EgYDVQQHDAtQbGFuZXQtTWFyczEZMBcGA1UECgwQV2lsZHlQcm9qZWN0Lm5ldDEZ
MBcGA1UECwwQV2lsZHlQcm9qZWN0Lm5ldDEZMBcGA1UEAwwQV2lsZHlQcm9qZWN0
Lm5ldDEkMCIGCSqGSIb3DQEJARYVYWRtaW5AaWxkeVByb2plY3QubmV0MIIBIjAN
BgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuWpOz2qiqABucgOUYOacK1XOgwSj
FecrQjD2BByFU7+NRzoLEDUFXuqsDoc24QLggbT38mBSBRLcl8FO+FQuBekBx/LG
qif1Z+3euxcWickeMqPsNhaCZO2kMopLox2bnegSGK5X5QJA1CwzSjChJiGakYQe
SzjPszcPE6Lp3nBh4I//ssiQr9Hv/MNoDdHlEyKxUb2ETuc1DVUpqf9MoNs1Isvb
lm5EblHz831BV2FScV4Bb6rP7XSd3vsWfIbF2Z1V3hXiOCbgg3mc1B7ZaKAH2i8C
eVBTCzWCFhlcVf0o/3nO/kv+KRzB+AuQWAnAklTADE6z8YeJ7xRg74WfDQIDAQAB
o1MwUTAdBgNVHQ4EFgQUIWyTIIB59TA/+mhcnMBlVbpYXIowHwYDVR0jBBgwFoAU
IWyTIIB59TA/+mhcnMBlVbpYXIowDwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0B
AQsFAAOCAQEAK/6jJGH80IJ3AVJy7uzZH+TNrTlsgJ+AmFcimh8VHEkg18Qs5mLf
aa3a4eHIJe4xS9q68IECfPIoo/mDd66+hyAVc7vRNvn3rouq3uYV4Dfca7WDaS2M
vAzSwRQXVWg5E9LSYmSpIPjTVKLVtG20HXPH3ga5WXbZ3203f1XfdGz65RtQtGdA
S/aop2Our+K319Zxvf4/ssd2smcwDKnDrhPDgL2CCjeqt2IUIPHM0QPPSklfK+AJ
RDXpdFMMe370hrzqaZaAVwwWT0wVi/tdasPNzsFvL+igmtMSYvtHAU1QoLwBwzD2
mVHYeF9JUANs1a9K+29W3eJzPDdBAeJzwg==
-----END CERTIFICATE-----
END

# Starting Stunnel Service
wget -O /etc/rc.d/init.d/stunnel
chmod +x /etc/rc.d/init.d/stunnel
service stunnel start
chkconfig stunnel on

# Install fail2ban For Yum
yum install fail2ban -y
service fail2ban restart
chkconfig fail2ban on

