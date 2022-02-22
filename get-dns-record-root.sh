#!/bin/bash

#Execute this script to GET a DNS record
#The script requires 3 arguments. Zone name / Record name / Type ...  in that order.

CTOKEN=$(cat .token-access)
RECORD=$1
DOMAIN=$1
TYPE=$2


#Generated From Postman
curl -s --location --request \
	GET "https://api.ultradns.com/zones/$DOMAIN/rrsets/$TYPE/$RECORD" \
	--header 'Authorization: Bearer '$CTOKEN \
	--header 'Content-Type: application/json' \
	--data-raw '{
	    "rrtype": "A (1)",
	    ]
}' | jq -r

