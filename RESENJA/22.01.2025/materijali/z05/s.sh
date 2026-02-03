#!/bin/bash

storovi=$(ls ./ | grep "p12")

for store in $storovi; do
    result=$(keytool -list -v -keystore "$store" -storepass sigurnost)
    if ! echo "$result" | grep "ExtendedKeyUsage";then
        continue
    fi

    if ! echo "$result" | grep "serverAuth" || ! echo "$result" | grep "clientAuth"; then
        continue
    else
        echo "$store" > resenje.txt
    fi 
done

#store27.p12
