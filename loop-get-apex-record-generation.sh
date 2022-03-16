#!/bin/bash

domainlist=$1

#this generates a list of domains, with the corresponding apexalias target from csc
# in a comma separated file of 2 columns

for domain in $(cat $domainlist);do \
	echo $domain","$(./get-apex-record.sh $domain | jq -r .[].rrSets[].rdata[0]);
done

#the output of this file is meant to be saved as a file (domains.groupX.apextargets)
# and later fed into the Cloudflare script to create the equivalent apex CNAMEs over secondary DNS

