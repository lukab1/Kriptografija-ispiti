#!bin/bash
#
#mkdir -p f
#
#stores=$(ls ./ | grep "p12")
#
#for store in $stores;do
#
#    openssl pkcs12 -in "$store" -out "f/key_$store.pem" -passin pass:sigurnost -nocerts -nodes 2>/dev/null
#
#done
#
#keys=$(ls f/ | grep ".pem")
#
#for key in $keys;do
#
#    var=$(openssl rsautl -decrypt $key -in "envelopa.txt" -inform PEM)
#    echo "$var"
#
#done


#!/bin/bash


mkdir -p f


stores=$(ls ./ | grep "p12")


for store in $stores; do
    openssl pkcs12 -in "$store" -out "f/key_$store.pem" -passin pass:sigurnost -nocerts -nodes 2>/dev/null
done

keys=$(ls f/ | grep ".pem")


for key in $keys; do
    var=$(openssl rsautl -decrypt -inkey "f/$key" -in "envelopa.txt" 2>/dev/null)
    echo "$var"
done

#decrypted_key_store22.p12.pem

