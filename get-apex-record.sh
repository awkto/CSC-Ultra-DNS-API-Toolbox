#!/bin/bash

#Execute this script to GET a DNS record
#The script requires 3 arguments. Zone name / Record name / Type ...  in that order.

CTOKEN=$(cat .token-access)
#RECORD=$2.$1
DOMAIN=$1
#TYPE=$3


#Generated From Postman
curl -s --location --request \
	GET "https://api.ultradns.com/zones/$DOMAIN/rrsets/APEXALIAS/$DOMAIN" \
	--header 'Authorization: Bearer '$CTOKEN \
	--header 'Content-Type: application/json' \
	--data-raw '{
	    "rrtype": "APEXALIAS (65282)",
	    ]
}' | jq -r

