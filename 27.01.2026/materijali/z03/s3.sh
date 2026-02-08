#!/bin/bash

keystores=$(ls ./ | grep ".jks")

for keystore in $keystores; do
    keytool -importkeystore -srckeystore "$keystore" -srcstoretype JKS -destkeystore "$keystore.p12" -deststoretype PKCS12 -srcstorepass sigurnost -deststorepass sigurnost
done

mkdir -p keys

keystores2=$(ls ./ | grep "p12")

for keystore in $keystores2; do
    openssl pkcs12 -in $keystore -nodes -nocerts -passin pass:sigurnost -out "keys/$keystore.key" -legacy
done

kljucevi=$(ls keys/ | grep "key")

for key in $kljucevi; do
    result=$(openssl rsautl -in "envelopa.txt" -decrypt -inkey "keys/$key")
    echo "$key , $result" >> resenje.txt
done

#keystore41.jks.p12.key , ï»¿BRZO NA SLJEDECI ZADATAK ;-)
