#!/bin/bash

clear
source /var/lib/SIJA/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
tls="$(cat ~/log-install.txt | grep -w "Vless TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[44;1;39m      Add Xray/Vless Account      \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

		read -rp "User: " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
		echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
		echo -e "\E[44;1;39m      Add Xray/Vless Account      \E[0m"
		echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			echo ""
			read -n 1 -s -r -p "Press any key to back on menu"
			v2ray-menu
		fi
	done

uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vless$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
vlesslink1="vless://${uuid}@${domain}:$tls?path=/vless&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:$none?path=/vless&encryption=none&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:$tls?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=${domain}#${user}"
systemctl restart xray
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xray/akunlog/vless/$user
echo -e "\E[44;1;39m        Xray/Vless Account        \E[0m" | tee -a /etc/xray/akunlog/vless/$user
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xray/akunlog/vless/$user
echo -e "Remarks        : ${user}" | tee -a /etc/xray/akunlog/vless/$user
echo -e "Domain         : ${domain}" | tee -a /etc/xray/akunlog/vless/$user
echo -e "Wildcard       : (bug).${domain}" | tee -a /etc/xray/akunlog/vless/$user
echo -e "port TLS       : $tls" | tee -a /etc/xray/akunlog/vless/$user
echo -e "port none TLS  : $none" | tee -a /etc/xray/akunlog/vless/$user
echo -e "id             : ${uuid}" | tee -a /etc/xray/akunlog/vless/$user
echo -e "Encryption     : none" | tee -a /etc/xray/akunlog/vless/$user
echo -e "Network        : ws" | tee -a /etc/xray/akunlog/vless/$user
echo -e "Path           : /vless" | tee -a /etc/xray/akunlog/vless/$user
echo -e "Path           : vless-grpc" | tee -a /etc/xray/akunlog/vless/$user
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xray/akunlog/vless/$user
echo -e "Link TLS       : ${vlesslink1}" | tee -a /etc/xray/akunlog/vless/$user
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xray/akunlog/vless/$user
echo -e "Link none TLS  : ${vlesslink2}" | tee -a /etc/xray/akunlog/vless/$user
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xray/akunlog/vless/$user
echo -e "Link GRPC      : ${vlesslink3}" | tee -a /etc/xray/akunlog/vless/$user
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xray/akunlog/vless/$user
echo -e "Expired On     : $exp" | tee -a /etc/xray/akunlog/vless/$user
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xray/akunlog/vless/$user
echo -e "~ AutoScript by AlkhaNET ~" | tee -a /etc/xray/akunlog/vless/$user
echo "" | tee -a /etc/xray/akunlog/vless/$user
read -n 1 -s -r -p "Press any key to back on menu"

menu
