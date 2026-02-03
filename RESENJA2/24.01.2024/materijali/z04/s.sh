#!/bin/bash

mkdir -p f
mkdir -p pub

openssl rsautl -decrypt -inkey "env_key.key" -in "envelopa.txt" -out "rezultat.txt"

datoteke=$(ls ./ | grep "p12")

for datoteka in $datoteke; do
    openssl pkcs12 -in $datoteka -nodes -nocerts -passin pass:sigurnost -out "f/$datoteka.key"
done

kljucevi=$(ls f/)

for kljuc in $kljucevi; do
    result=$(openssl rsa -in "f/$kljuc" -pubout)

    if [[ "$result" = "$(cat "rezultat.txt")" ]]; then
        echo "datoteka: $datoteka" >> final_resenje.txt
    fi
done

#datoteka: store9.p12
