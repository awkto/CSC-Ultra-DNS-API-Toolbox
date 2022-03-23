#!/bin/bash
export domainlist=$1

echo "Target MD5 is : 0617414fee3e217474d496dc7ac9104a"

for domain in $(cat $domainlist);do \
	echo "MD5 is "$(./get-dns-record-root.sh $domain NS \
				| jq -r .rrSets[0].rdata[] \
				| sort \
				| md5sum \
				)\
	" for zone : "$domain
done
