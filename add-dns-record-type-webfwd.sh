#!/bin/bash

#Execute this script to add a DNS record
#The script requires 3 arguments. Zone name, Webfwd Source, Webfwd Target

export CTOKEN=$(cat .token-access)
export DOMAIN=$1
export SOURCE=$2
export TARGET=$3

#Generated From Postman
curl -s --location --request \
	POST 'https://api.ultradns.com/zones/'$DOMAIN'/webforwards/' \
	--header 'Authorization: Bearer '$CTOKEN \
	--header 'Content-Type: application/json' \
	--data-raw \
	'{
	    "requestTo": "'$SOURCE'",
	    "defaultRedirectTo": "'$TARGET'",
	    "defaultForwardType": "HTTP_301_REDIRECT"
	}' \
	| jq -s

