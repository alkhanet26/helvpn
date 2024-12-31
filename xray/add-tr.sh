#!/bin/bash

clear
source /var/lib/SIJA/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
tr="$(cat ~/log-install.txt | grep -w "Trojan WS " | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;41;36m           TROJAN ACCOUNT          \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

		read -rp "User: " -e user
		user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
clear
		echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
		echo -e "\E[0;41;36m           TROJAN ACCOUNT          \E[0m"
		echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			echo ""
			echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
			read -n 1 -s -r -p "Press any key to back on menu"
			m-trojan
		fi
	done

uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojanws$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

systemctl restart xray
trojanlink1="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=${domain}#${user}"
trojanlink="trojan://${uuid}@${domain}:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xray/akunlog/trojan/$user
echo -e "\E[0;41;36m           TROJAN ACCOUNT           \E[0m" | tee -a /etc/xray/akunlog/trojan/$user
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xray/akunlog/trojan/$user
echo -e "Remarks        : ${user}" | tee -a /etc/xray/akunlog/trojan/$user
echo -e "Host/IP        : ${domain}" | tee -a /etc/xray/akunlog/trojan/$user
echo -e "Wildcard 	: (bug).${domain}" | tee -a /etc/xray/akunlog/trojan/$user
echo -e "port           : 443" | tee -a /etc/xray/akunlog/trojan/$user
echo -e "Key            : ${uuid}" | tee -a /etc/xray/akunlog/trojan/$user
echo -e "Path           : /trojan-ws" | tee -a /etc/xray/akunlog/trojan/$user
echo -e "ServiceName    : trojan-grpc" | tee -a /etc/xray/akunlog/trojan/$user
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xray/akunlog/trojan/$user
echo -e "Link WS        : ${trojanlink}" | tee -a /etc/xray/akunlog/trojan/$user
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xray/akunlog/trojan/$user
echo -e "Link GRPC      : ${trojanlink1}" | tee -a /etc/xray/akunlog/trojan/$user
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xray/akunlog/trojan/$user
echo -e "Expired On     : $exp" | tee -a /etc/xray/akunlog/trojan/$user
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xray/akunlog/trojan/$user
echo -e "~ AutoScript by AlkhaNET ~" | tee -a /etc/xray/akunlog/trojan/$user
echo "" | tee -a /etc/xray/akunlog/trojan/$user
read -n 1 -s -r -p "Press any key to back on menu"
menu

