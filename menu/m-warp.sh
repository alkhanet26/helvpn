#!/bin/bash
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
1) clear ; warp status ; exit ;;
2) clear ; warp wg4 ; exit ;;
3) clear ; warp wg6 ; exit ;;
4) clear ; warp wgd ; exit ;;
5) clear ; warp wgx ; exit ;;
6) clear ; warp dwg ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo -e "" ; echo "Anda salah tekan" ; sleep 1 ; m-warp ;;
esac
