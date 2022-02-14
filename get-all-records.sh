#!/bin/bash

#Execute this script to GET all DNS records of a certain type
#The script requires 2 arguments. Zone name / Type ...  in that order.

CTOKEN=$(cat .token-access)
DOMAIN=$1
TYPE=$2


#Generated From Postman
curl -s --location --request \
	GET "https://api.ultradns.com/zones/$DOMAIN/rrsets/$TYPE" \
	--header 'Authorization: Bearer '$CTOKEN \
	--header 'Content-Type: application/json' \
	--data-raw '{
	    "rrtype": "$TYPE (1)",
	    ]
}' | jq -r

