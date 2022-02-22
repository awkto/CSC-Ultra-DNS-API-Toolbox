#!/bin/bash
export domainlist=$1

for domain in $(cat $domainlist);do \
	echo "MD5 is "$(./get-dns-record-root.sh $domain NS \
				| jq -r .rrSets[0].rdata[] \
				| sort \
				| md5sum \
				); \
done
