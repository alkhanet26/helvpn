#!/bin/bash
# updated by alkhanet26
domain=$(cat /etc/xray/domain)

IP=$(wget -qO- http://ipecho.net/plain | xargs echo);
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
		read -rp "Usernew: " -e user
		CLIENT_EXISTS=$(grep -w $user /var/lib/premium-script/data-user-sstp | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
			echo ""
			echo "Akun sudah ada, silahkan masukkan nama user lain."
			exit 1
   		else
     			clear
		fi
	done
read -p "Password: " pass
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
cat > /home/sstp/sstp_account <<-EOF
$user * $pass *
EOF
echo -e "### $user $exp">>"/var/lib/premium-script/data-user-sstp"
clear
echo -e "=============== SSTP VPN =================" | tee -a /etc/log-create-user.log
echo -e "Server IP     : $IP" | tee -a /etc/log-create-user.log
echo -e "Domain	       : $domain" | tee -a /etc/log-create-user.log
echo -e "Username      : $user" | tee -a /etc/log-create-user.log
echo -e "Password      : $pass" | tee -a /etc/log-create-user.log
echo -e "Port          : 5555" | tee -a /etc/log-create-user.log
echo -e "Cert          : http://$IP:81/server.crt" | tee -a /etc/log-create-user.log
echo -e "Expired On    : $exp" | tee -a /etc/log-create-user.log
echo -e "================================" | tee -a /etc/log-create-user.log
echo -e "Mod By AlkNET" | tee -a /etc/log-create-user.log
echo -e "=================================" | tee -a /etc/log-create-user.log

read -n 1 -s -r -p "Press any key to back on menu"

menu
