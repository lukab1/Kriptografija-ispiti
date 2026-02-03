#!/bin/bash

kljucevi=$(ls ./ | grep "kljuc")

cert_key=$(openssl rsa -in priv_key.key -noout -modulus)

for kljuc in $kljucevi; do
    result=$(openssl rsa -in $kljuc -noout -modulus)

    if [[ "$cert_key" = "$result" ]]; then
        echo "$kljuc" >> resenjaA.txt
    fi

done

#kljuc87.key
