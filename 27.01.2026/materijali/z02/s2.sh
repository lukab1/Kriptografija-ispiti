#!/bin/bash

ulazi=$(ls ./ | grep "ulaz")

for ulaz in $ulazi; do
    result=$(openssl dgst -blake2s256 "$ulaz" | sed 's/[^=]*= //')
    
    if [[ "$result" = "$(cat "kontrolni_hash.txt")" ]]; then
        echo "$ulaz" >> resenje.txt
        break
    fi
done

#ulaz12.txt

kljuc=$(openssl dgst -sha1 ulaz12.txt | sed 's/[^=]*= //')

openssl enc -d -aes-192-ctr -in "sifrat.txt" -out "resenje2.txt" -k "$kljuc"

#Ulazni sadrzaj 12
