#!/bin/bash

#This script adds NS records to the ROOT of a zone. It cannot be used for adding NS records for subzones.
#When running the script Specify 2 arguments, the domain name, and the value of the NS record
#Run the script multiple times to add multiple NS records


export CTOKEN=$(cat .token-access)
export DOMAIN=$1
export VALUE=$2


#Generated From Postman
curl -s --location --request \
	POST 'https://api.ultradns.com/zones/'$DOMAIN'/rrsets/NS/'$DOMAIN'?systemGeneratedStatus=true' \
	--header 'Authorization: Bearer '$CTOKEN \
	--header 'Content-Type: application/json' \
	--data-raw '{
	    "rrtype": "NS",
	    "rdata": [
	        "'${VALUE}'"
	    ]
}' | jq . -s

