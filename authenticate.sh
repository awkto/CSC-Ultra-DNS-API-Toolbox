#!/bin/bash

#Execute this script to Authenticate with CSC Ultra DNS
#Requires password in local file .password in the same directory as script

export CUSER=dnsauto
export CPASS=$(cat .password)




#Authenticates using password from .password file
curl -s --location --request POST 'https://api.ultradns.com/authorization/token' \
	--header 'Content-Type: application/x-www-form-urlencoded' \
	--data-urlencode 'grant_type=password' \
	--data-urlencode 'username='$CUSER \
	--data-urlencode 'password='$CPASS  \
        | tee .token-raw | jq -s





#Filters out Token variables in different formats
#and save them into local files for use by other scripts
cat .token-raw | jq .                        > .token-json
cat .token-raw | jq .accessToken  |tr -d '"' > .token-access
cat .token-raw | jq .refreshToken |tr -d '"' > .token-refresh



