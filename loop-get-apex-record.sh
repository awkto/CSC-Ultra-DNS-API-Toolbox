#!/bin/bash

domainlist=$1

for domain in $(cat $domainlist);do \
	echo "APEXALIAS record " \
	$(
		./get-apex-record.sh $domain \
		| egrep "errorCode|totalCount" \
		| sed 's/"errorCode": 70002,/does not exist/' \
		| sed 's/"totalCount": 1,/DOES EXIST/' \
	) \
	" on domain : "$domain;
done




#	./get-apex-record.sh $domain | jq .[0].rrSets[0].rrtype ;
#./get-apex-record.sh gis-manulife-dev.com | jq .[0].resultInfo.returnedCount
#./get-apex-record.sh manulifeplaceottawa.com | egrep "errorCode|totalCount"
