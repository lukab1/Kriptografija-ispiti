#!/bin/bash

potpisi=$(ls ./ | grep "potpis")
kljucevi=$(ls ./ | grep "key")

#Provjeriti da li je ulaz.txt u base64 formatu (mala/velika slova/+=)
#ako jeste izvrsiti openssl enc -d -base64 -in ulaz.txt -out dec_ulaz.txt

for kljuc in $kljucevi; do
    for potpis in $potpisi;do
        result=$(openssl dgst -sha224 -prverify "$kljuc" -signature "$potpis" "ulaz.txt")
        if echo "$result" | grep "OK"; then
            echo "$potpis, $kljuc" >> resenja.txt
        fi
    done
done

#potpis43.txt, kljuc11.key
