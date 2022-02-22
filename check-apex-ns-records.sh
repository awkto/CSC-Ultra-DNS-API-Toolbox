#!/bin/bash
./get-dns-record-root.sh $1 NS | jq .rrSets[0].rdata[]
