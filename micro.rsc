/system script
add name=download_antimining policy=read,write,policy,test source="/tool fetch url="http://192.168.1.4/mikrotik/antimining_dns.rsc" mode=http;
:log info "Downloaded antimining_dns.rsc from 192.168.1.4";"
    
/ip dns static remove [find where comment="antimining"]
/import file-name=antimining_dns.rsc;
/file remove antimining_dns.rsc;
:log info "Removed old antimining records and imported new list";
    
/system schedule
add comment="Download Antimining list" interval=7d name=Download_Antimining_List on-event=download_antimining policy=read,write,policy,test start-date=\
    jan/01/1970 start-time=07:45:07
add comment="Apply Antimining List" interval=7d name=Replace_Antimining_List on-event=replace_antimining policy=read,write,policy,test start-date=jan/01/1970 \
    start-time=07:50:07

