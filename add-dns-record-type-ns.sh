#!/bin/bash

#This script creates NS records, but only works for subdomains. For example delegating a subdomain to a different DNS server.
#You can run the script multiple times to add multiple NS records. Even if it is for the same subdomain

export CTOKEN=$(cat .token-access)
export DOMAIN=$1
export SUBDOMAIN=$2.$1
export VALUE=$3


#Generated From Postman
curl -s --location --request \
	POST 'https://api.ultradns.com/zones/'$DOMAIN'/rrsets/NS/'$SUBDOMAIN'?systemGeneratedStatus=true' \
	--header 'Authorization: Bearer '$CTOKEN \
	--header 'Content-Type: application/json' \
	--data-raw '{
	    "rrtype": "NS",
	    "rdata": [
	        "'${VALUE}'"
	    ]
}' | jq -s

