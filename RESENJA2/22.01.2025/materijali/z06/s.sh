#!/bin/bash

kljucevi=$(ls ./ | grep "kljuc")

mkdir -p keys

#for kljuc in $kljucevi;do
#    openssl rsa -in $kljuc -out "keys/$kljuc" -outform PEM
#done

for kljuc in $kljucevi; do
    if [[ "$(cat "my_key.key")" = "$(cat "keys/$kljuc")" ]]; then
        echo "$kljuc" >> resenjeA.txt
        break
    fi
done

#kljuc50.key
