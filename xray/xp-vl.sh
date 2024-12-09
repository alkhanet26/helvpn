#!/bin/bash
data=( `cat /etc/xray/config.json | grep '^#&' | cut -d ' ' -f 2`);
now=`date +"%Y-%m-%d"`
for user in "${data[@]}"
do
exp=$(grep -w "^#& $user" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq )
#d1=$(date -d "$exp" +%s)
#d2=$(date -d "$now" +%s)
#exp2=$(( (d1 - d2) / 86400 ))
if [[ "$exp" = "$now" ]]; then
sed -i "/^#& $user $exp/,/^},{/d" /etc/xray/config.json
fi
done
systemctl restart xray

