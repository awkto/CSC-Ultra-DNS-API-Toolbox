#!/bin/bash

#INCOMPLETE

#Execute this script to add a DNS record (while specifying the TTL)
#The script requires 4 arguments. Zone name and FQDN of record, IP address, TTL, in that order.

export CTOKEN=$(cat .token-access)
export DOMAIN=$1
export VALUE=$2
export TTL=$3

#Generated From Postman
curl -s --location --request \
	POST 'https://api.ultradns.com/zones/'$DOMAIN'/rrsets/NS/'$DOMAIN \
	--header 'Authorization: Bearer '$CTOKEN \
	--header 'Content-Type: application/json' \
	--data-raw '{
	    "rrtype": "NS (1)",
	    "ttl": '$TTL',
	    "rdata": [
	        "'${VALUE}'"
	    ]
}' |jq -s

