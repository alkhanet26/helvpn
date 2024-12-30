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
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;100;33m          • SYSTEM MENU •          \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e " [\e[36m•1\e[0m] Panel Domain"
echo -e " [\e[36m•2\e[0m] Change Port All Account"
echo -e " [\e[36m•3\e[0m] Webmin Menu"
echo -e " [\e[36m•4\e[0m] Speedtest VPS"
echo -e " [\e[36m•5\e[0m] About Script"
echo -e " [\e[36m•6\e[0m] Set Auto Reboot"
echo -e " [\e[36m•7\e[0m] Restart All Service"
echo -e " [\e[36m•8\e[0m] Change Banner"
echo -e " [\e[36m•9\e[0m] Cek Bandwith"
echo -e " [\e[36m•10\e[0m] GoTOP"
echo -e " [\e[36m•11\e[0m] WARP Cloudflare"
echo -e ""
echo -e " [\e[31m•0\e[0m] \e[31mBACK TO MENU\033[0m"
echo -e   ""
echo -e   "Press x or [ Ctrl+C ] • To-Exit"
echo -e   ""
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
read -p " Select menu : " opt
echo -e ""
case $opt in
1) clear ; m-domain ; exit ;;
2) clear ; port-change ; exit ;;
3) clear ; m-webmin ; exit ;;
4) clear ; speedtest ; exit ;;
5) clear ; about ; exit ;;
6) clear ; auto-reboot ; exit ;;
7) clear ; restart ; exit ;;
8) clear ; nano /etc/issue.net ; exit ;; #ssh-vpn banner.conf
9) clear ; bw ; exit ;;
10) clear ; gotop ; exit ;;
11) clear ; m-warp ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo -e "" ; echo "Anda salah tekan" ; sleep 1 ; m-system ;;
esac
