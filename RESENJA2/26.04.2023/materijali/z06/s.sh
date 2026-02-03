#!/bin/bash

keystores=$(ls ./ | grep "jks")

for keystore in $keystores;do
    result=$(keytool -list -v -keystore $keystore -storepass sigurnost)
    if ! echo $result | grep "serverAuth" || ! echo "$result" | grep "clientAuth"; then
        continue
    else
        echo "$keystore" >> moj_keystore.txt
    fi
done

#keystore13.jks
