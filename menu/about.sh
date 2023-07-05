#!/bin/bash
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
CEKEXPIRED () {
    today=$(date -d +1day +%Y-%m-%d)
    Exp1=$(curl -sS https://raw.githubusercontent.com/alkhanet26/bacot/main/mangga | grep $MYIP | awk '{print $3}')
    if [[ $today < $Exp1 ]]; then
    echo -e "\e[32mSTATUS SCRIPT AKTIF...\e[0m"
    else
    echo -e "\e[31mSCRIPT ANDA EXPIRED!\e[0m";
    exit 0
fi
}
IZIN=$(curl -sS https://raw.githubusercontent.com/alkhanet26/bacot/main/mangga | awk '{print $4}' | grep $MYIP)
if [ $MYIP = $IZIN ]; then
echo -e "\e[32mPermission Accepted...\e[0m"
CEKEXPIRED
else
echo -e "\e[31mPermission Denied!\e[0m";
exit 0
fi
clear
echo -e "\e[36m╒════════════════════════════════════════════╕\033[0m"
echo -e " \E[0;41;36m               ALKHANET               \E[0m"
echo -e "\e[36m╘════════════════════════════════════════════╛\033[0m"
echo ""
echo "   >>> Service & Port"
echo "   - OpenSSH				: 22"
echo "   - SSH Websocket		: 80 [OFF]"
echo "   - SSH SSL Websocket	: 443"
echo "   - Stunnel4				: 447, 777"
echo "   - Dropbear				: 109, 143"
echo "   - Badvpn				: 7100-7900"
echo "   - Nginx				: 81"
echo "   - Vmess TLS			: 443"
echo "   - Vmess None TLS		: 80"
echo "   - Vless TLS			: 443"
echo "   - Vless None TLS		: 80"
echo "   - Trojan GRPC			: 443"
echo "   - Trojan WS			: 443"
echo "   - Sodosok WS/GRPC		: 443"
echo ""
echo "   >>> Server Information & Other Features"
echo "   - Timezone			: Asia/Jakarta (GMT +7)"
echo "   - Fail2Ban			: [ON]"
echo "   - Dflate			: [ON]"
echo "   - IPtables			: [ON]"
echo "   - Auto-Reboot		: [ON]"
echo "   - IPv6				: [OFF]"
echo "   - Autoreboot On	: $aureb:00 $gg GMT +7"
echo "   - AutoKill Multi Login User"
echo "   - Auto Delete Expired Account"
echo "   - Fully automatic script"
echo "   - VPS settings"
echo "   - Admin Control"
echo "   - Change port"
echo "   - Full Orders For Various Services"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu



