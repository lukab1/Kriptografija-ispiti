#!/bin/bash

certs=$(ls ./ | grep "client")

for cert in $certs; do
    result=$(openssl verify -CAfile "cacert.pem" "$cert")
    if echo $result | grep "OK"; then
        echo "$cert" >> resenje.txt
    fi
done
