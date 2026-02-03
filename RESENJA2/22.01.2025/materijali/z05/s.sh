#!/bin/bash

stores=$(ls ./ | grep "store")

for store in $stores; do
    result=$(keytool -list -v -keystore $store -storepass sigurnost)

    if ! echo $result | grep "serverAuth" || ! echo $result | grep "clientAuth";then
        continue
    else
        echo "$store" >> resenjeA.txt
        break
    fi
done

#store27.p12
