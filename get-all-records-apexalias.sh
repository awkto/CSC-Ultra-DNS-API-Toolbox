#!/bin/bash

#this script lists ALL webforwards for a domain
# simply pass the domain name as an argument


CTOKEN=$(cat .token-access)
DOMAIN=$1


#Generated From Postman
curl -s --location --request \
	GET "https://api.ultradns.com/zones/$DOMAIN/rrsets/apexalias" \
	--header 'Authorization: Bearer '$CTOKEN \
	--header 'Content-Type: application/json' \
 	| jq . -r

