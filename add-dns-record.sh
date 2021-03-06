#!/bin/bash

#Execute this script to add a DNS record
#The script requires 4 arguments. Zone name and FQDN of record, IP address, in that order.

#Example : ./add-domain-record.sh $DOMAIN $RECORD $VALUE $ TYPE
#$1 = DOMAIN NAME
#$2 = RECORD NAME
#$3 = RECORD VALUE
#$4 = TYPE


export CTOKEN=$(cat .token-access)
export DOMAIN=$1
export RECORD=$2.$1
export VALUE=$3
export TYPE=$4


#Generated From Postman
curl -s --location --request \
	POST 'https://api.ultradns.com/zones/'$DOMAIN'/rrsets/'$TYPE'/'$RECORD \
	--header 'Authorization: Bearer '$CTOKEN \
	--header 'Content-Type: application/json' \
	--data-raw '{
	    "rrtype": "'$TYPE'",
	    "rdata": [
	        "'${VALUE}'"
	    ]
}' | jq -s

