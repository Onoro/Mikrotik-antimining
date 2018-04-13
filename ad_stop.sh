#!/bin/bash
# output folder is /var/www/mikrotik/ you have to change it to your destination
src=('https://raw.githubusercontent.com/greatis/Anti-WebMiner/master/hosts' 'https://raw.githubusercontent.com/hoshsadiq/adblock-nocoin-list/master/hosts.txt'); i=0; for file in ${src[*]}; do i=$((i+1)); wget --no-check-certificate -O "./hosts_list.$i" "$file"; done;
in="./hosts_list.*" && out="/var/www/mikrotik/antimining_dns.rsc" && host='127.0.0.1'; echo "/ip dns static" > $out && grep '0.0.0.0 ' $in | grep -v '^#' | cut -d' ' -f 2 | sort -u | grep . | sed "s/^/add address=$host name=/" | sed "s/$/ comment=\"antimining\"/" >> $out && rm -f $in; wc -l $out;

#out="./adblock_dns.rsc"
