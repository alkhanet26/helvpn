#!/bin/bash
domain=$(cat /etc/xray/domain)
source /var/lib/premium-script/ipvps.conf
clear
if [[ "$IP" = "" ]]; then
PUBLIC_IP=$(wget -qO- http://ipecho.net/plain | xargs echo);
else
PUBLIC_IP=$IP
fi
until [[ $VPN_USER =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Username: " -e VPN_USER
		CLIENT_EXISTS=$(grep -w $VPN_USER /var/lib/premium-script/data-user-l2tp | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "Akun sudah ada, silahkan masukkan password lain."
			exit 1
   		else
     			clear
		fi
	done
read -p "Password: " VPN_PASSWORD
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
clear

# Add or update VPN user
cat > /etc/ppp/chap-secrets <<-EOF
"$VPN_USER" l2tpd "$VPN_PASSWORD" *
EOF

VPN_PASSWORD_ENC=$(openssl passwd -1 "$VPN_PASSWORD")
cat > /etc/ipsec.d/passwd <<-EOF
$VPN_USER:$VPN_PASSWORD_ENC:xauth-psk
EOF

# Update file attributes
chmod 600 /etc/ppp/chap-secrets* /etc/ipsec.d/passwd*
echo -e "### $VPN_USER $exp">>"/var/lib/premium-script/data-user-l2tp"

echo -e "================================" | tee -a /etc/log-create-user.log
echo -e "L2TP/IPSEC PSK VPN" | tee -a /etc/log-create-user.log
echo -e "================================" | tee -a /etc/log-create-user.log
echo -e "" | tee -a /etc/log-create-user.log
echo -e "Server IP    : $PUBLIC_IP" | tee -a /etc/log-create-user.log
echo -e "Host         : $domain" | tee -a /etc/log-create-user.log
echo -e "IPsec PSK    : vpn" | tee -a /etc/log-create-user.log
echo -e "Username     : $VPN_USER" | tee -a /etc/log-create-user.log
echo -e "Password     : $VPN_PASSWORD" | tee -a /etc/log-create-user.log
echo -e "Expired ON   : $exp" | tee -a /etc/log-create-user.log
echo -e "" | tee -a /etc/log-create-user.log
echo -e "================================" | tee -a /etc/log-create-user.log
echo -e "Mod By AlkNET" | tee -a /etc/log-create-user.log
echo -e "=================================" | tee -a /etc/log-create-user.log

read -n 1 -s -r -p "Press any key to back on menu"

menu
