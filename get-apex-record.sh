#!/bin/bash

#This script gets the apex alias record 

CTOKEN=$(cat .token-access)
DOMAIN=$1


#Generated From Postman
curl -s GET "https://api.ultradns.com/zones/$DOMAIN/rrsets/APEXALIAS/$DOMAIN" \
	--header 'Authorization: Bearer '$CTOKEN \
	--header 'Content-Type: application/json' \
	| jq -s .
