#!/bin/bash

#keystores=$(ls ./ | grep "keystore")
#
#for keystore in $keystores;do
#    keytool -importkeystore -srckeystore $keystore -destkeystore $keystore.p12 -srcstoretype jks -deststoretype pkcs12 -srcstorepass sigurnost -deststorepass sigurnost
#
#done

stores=$(ls ./ | grep "p12")

mkdir -p folder

for store in $stores;do
    openssl pkcs12 -in $store -nocerts -nodes -passin pass:sigurnost -out "folder/$store.key"
    result2=$(openssl rsautl -decrypt -inkey "folder/$store.key" -in "envelopa.txt")
    echo $result2 >> resenja.txt 
done
