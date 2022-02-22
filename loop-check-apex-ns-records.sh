#!/bin/bash
export domainlist=$1

for domain in $(cat $domainlist); do \
	echo "Checking Domain : "$domain; \
	./get-dns-record-root.sh $domain NS \
	| jq .rrSets[0].rdata[] | sort | jq . ; \
done
