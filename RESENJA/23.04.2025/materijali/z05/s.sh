#!/bin/bash

kljucevi=$(ls ./ | grep ".key")
tekstovi=$(ls ./ | grep "tekst")

mkdir -p f

for kljuc in $kljucevi; do
    openssl rsa -in "$kljuc" -out "f/$kljuc" -pubout
done

kljucevi2=$(ls f/ | grep ".key")

for kljuc in $kljucevi2;do

    for tekst in $tekstovi; do
        
        result=$(openssl dgst -verify "f/$kljuc" -signature "potpis.txt" "$tekst")
        if echo "$result" | grep "OK"; then
            echo "ulaz: $ulaz" >> resenja.txt
        fi

    done

done


