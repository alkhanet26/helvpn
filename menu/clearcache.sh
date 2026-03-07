#!/bin/bash
#MYIP=$(wget -qO- ipinfo.io/ip);
#echo "Checking VPS"
#CEKEXPIRED () {
#    today=$(date -d +1day +%Y-%m-%d)
#    Exp1=$(curl -sS https://raw.githubusercontent.com/alkhanet26/bacot/main/mangga | grep $MYIP | awk '{print $3}')
#   if [[ $today < $Exp1 ]]; then
#    echo -e "\e[32mSTATUS SCRIPT AKTIF...\e[0m"
#    else
#    echo -e "\e[31mSCRIPT ANDA EXPIRED!\e[0m";
#    echo -e "\e[31mSilahkan Hubungi ALK-NET untuk Extend IP.. #\e[0m"
#    exit 0
#fi
#}
#IZIN=$(curl -sS https://raw.githubusercontent.com/alkhanet26/bacot/main/mangga | awk '{print $4}' | grep $MYIP)
#if [ $MYIP = $IZIN ]; then
#echo -e "\e[32mPermission Accepted...\e[0m"
#CEKEXPIRED
#else
#echo -e "\e[31mPermission Denied!\e[0m";
#echo -e "\e[31mDaftarkan IP VPS anda,, Hub Admin : ALKNET wa : 08815260626... Salam Ngopi,, #\e[0m"
#exit 0
#fi
clear
echo ""
echo ""
echo -e "[ \033[32mInfo\033[0m ] Clear RAM Cache"
echo 1 > /proc/sys/vm/drop_caches
sleep 3
echo -e "[ \033[32mok\033[0m ] Cache cleared"
sleep 1
echo -e "[ \033[32mInfo\033[0m ] Clear LOG FILE"
#rm -r /var/log/xray/*.log 
sleep 3
#chmod +x /var/log/xray
#touch /var/log/xray/access.log
#touch /var/log/xray/error.log
#touch /var/log/xray/access2.log
#touch /var/log/xray/error2.log
#sleep 1
systemctl restart xray
sleep 3
echo -e "[ \033[32mok\033[0m ] LOG cleared"
echo ""
echo "Back to menu in 2 sec "
sleep 2
menu
