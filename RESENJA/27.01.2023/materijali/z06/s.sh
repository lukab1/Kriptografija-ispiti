#!/bin/bash

datoteke=$(ls ./ | grep ".jks")

for datoteka in $datoteke; do
    result=$(keytool -list -v -keystore "$datoteka" -storepass sigurnost)
    if ! echo "$result" | grep "serverAuth"; then
        continue
    else
        echo "$datoteka"
        break
    fi
done

#keystore22.jks
