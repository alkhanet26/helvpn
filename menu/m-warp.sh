#!/bin/bash
# Color Validation
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
cyan='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
LIGHT='\033[0;37m'

#STATUS WARP
function stats(){
	warp status
	read -n 1 -s -r -p "Press any key to back on menu"
	menu
}

#WG_IPV4
function ip4(){
	warp wg4
	sleep 1
	sed -i "/exit 0/d" /etc/rc.local
	sleep 1
	echo -e "sleep 5 && warp wg4" >> /etc/rc.local
	echo -e "exit 0" >> /etc/rc.local
	echo -e " [\e[32m•ON\e[0m] Wireguard IPV4 Succesfully Installed"
	read -n 1 -s -r -p "Press any key to back on menu"
	menu
}

#WG_IPV6
function ip6(){
	warp wg6
	sleep 1
	sed -i "/exit 0/d" /etc/rc.local
	sleep 1
	echo -e "sleep 5 && warp wg6" >> /etc/rc.local
	echo -e "exit 0" >> /etc/rc.local
	clear
	echo -e " [\e[32m•ON\e[0m] Wireguard IPV6 Succesfully Installed"
	read -n 1 -s -r -p "Press any key to back on menu"
	menu

}

#WG_DUAL
function dual(){
	warp wg6
	sleep 1
	sed -i "/exit 0/d" /etc/rc.local
	sleep 1
	echo -e "sleep 5 && warp wgd" >> /etc/rc.local
	echo -e "exit 0" >> /etc/rc.local
	echo -e " [\e[32m•ON\e[0m] Wireguard IPV4 & IPV6 Succesfully Installed"
	read -n 1 -s -r -p "Press any key to back on menu"
	menu
	
}

#WG_X
function x(){
	warp wgx
	sleep 1
	sed -i "/exit 0/d" /etc/rc.local
	sleep 1
	echo -e "sleep 5 && warp wgx" >> /etc/rc.local
	echo -e "exit 0" >> /etc/rc.local
	echo -e " [\e[32m•ON\e[0m] Wireguard X Succesfully Installed"
	read -n 1 -s -r -p "Press any key to back on menu"
	menu
	
}

#DISABLE_WG
function dis(){
	warp dwg
	sleep 1
	sed -i "/sleep 5 && warp wg4/d" /etc/rc.local > /dev/null
	sed -i "/sleep 5 && warp wg6/d" /etc/rc.local > /dev/null
	sed -i "/sleep 5 && warp wgd/d" /etc/rc.local > /dev/null
	sed -i "/sleep 5 && warp wgx/d" /etc/rc.local > /dev/null
	sleep 1
	echo -e " [\e[31m•OFF\e[0m] Wireguard Succesfully UnInstalled"
	read -n 1 -s -r -p "Press any key to back on menu"
	menu
	
}

clear 
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[0;100;33m          • Cloudflare WARP Menu •          \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e ""
echo -e " [\e[36m•1\e[0m] Status Cloudflare WARP"
echo -e " [\e[36m•2\e[0m] WARP Wireguard Ipv4"
echo -e " [\e[36m•3\e[0m] WARP Wireguard Ipv6"
echo -e " [\e[36m•4\e[0m] WARP Wireguard Ipv4 & Ipv6"
echo -e " [\e[36m•5\e[0m] WARP Wireguard X"
echo -e " [\e[36m•6\e[0m] Disable WARP Wireguard"
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
1) clear ; stats ; exit ;;
2) clear ; ip4 ; exit ;;
3) clear ; ip6 ; exit ;;
4) clear ; dual ; exit ;;
5) clear ; x ; exit ;;
6) clear ; dis ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo -e "" ; echo "Anda salah tekan" ; sleep 1 ; m-warp ;;
esac
