#!/bin 


for i in $(cat webfwd-records-list.txt);do \
	./add-dns-record-type-webfwd.sh; \
	more stuff... ;\
done


