#!/bin/bash

#This script will go through a list of domains and add Cloudflare NS records at the apex

# ns0005.secondary.cloudflare.com.
# ns0182.secondary.cloudflare.com.

domainlistfile=$1

for domain in $(cat $domainlistfile);do \
	./add-dns-record-type-nsroot.sh $domain ns0005.secondary.cloudflare.com. ;\
	./add-dns-record-type-nsroot.sh $domain ns0182.secondary.cloudflare.com. ;\
	done
