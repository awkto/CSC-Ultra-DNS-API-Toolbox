#!/bin/bash

#INCOMPLETE

for domain in $(cat $1);do \
	echo "Adding records to domain : "$domain; \
	./add-cloudflare-secondary-ns-records.sh $domain $value $ttl ;\
	done

