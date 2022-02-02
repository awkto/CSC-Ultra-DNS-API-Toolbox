#!/bin/bash

#Execute this script to DELETE a DNS record
#The script requires 2 arguments. Zone name and Record name, in that order.

export CTOKEN=$(cat .token-access)
export RECORD=$2.$1
export DOMAIN=$1



#Generated From Postman
curl -s --location --request \
	DELETE 'https://api.ultradns.com/zones/'$DOMAIN'/rrsets/A/'$RECORD \
	--header 'Authorization: Bearer '$CTOKEN \
	--header 'Content-Type: application/json' \
	--data-raw '{
	    "rrtype": "A (1)",
	    ]
}'
