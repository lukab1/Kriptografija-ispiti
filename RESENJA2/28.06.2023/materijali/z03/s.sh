#!/bin/bash

#mkdir -p certs
#
#openssl pkcs12 -in store.p12 -nokeys -cacerts -out certs/s0.pem -passout pass:sigurnost -passin pass:sigurnost -legacy
#
#for i in {1..6};do
#    openssl pkcs12 -in store.p12 -nokeys -clcerts -out "certs/s$i.pem" -passin pass:sigurnost -passout pass:sigurnost -legacy
#done

mkdir -p pub

keys=$(ls ./ | grep "key")

#for key in $keys;do
#    openssl rsa -in $key -out "pub/$key" -pubout
#done

cert_keys=$(ls keys/ | grep "key")

for key in $keys;do
    for c_key in $cert_keys;do
        if [[ "$(cat "pub/$key")" = "$(cat "keys/$c_key")" ]]; then
            echo "$key" >> resenja.txt
        fi
    done
done

k1.key
key13.key
key22.key
key45.key
key50.key
key72.key
key94.key
