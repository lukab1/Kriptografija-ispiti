#!/bin/bash

kljucevi=$(ls ./ | grep "kljuc")

keytool -importkeystore -srckeystore keystore.jks -deskeystore keystore.p12 -srcstoretype jks -deststoretype pkcs12 -srcstorepass sigurnost -deststorepass sigurnost

mkdir -p folder

openssl pkcs12 -in keystore.p12 -nocerts -passin pass:sigurnost -out folder/mojKljuc.key -noenc

mojKljuc=$(openssl rsa -in "folder/mojKljuc.key" -noout -modulus)


for kljuc in $kljucevi; do
    val1=$(openssl rsa -in $kljuc -noout -modulus)
    if [[ "$val1" = "$mojKljuc" ]]; then
        echo "$kljuc" >> resenje.txt
        break;
    fi
done


#kljuc50.key

cp kljuc50.key openssl.cnf

