#!/bin/bash

algoritmi=$(openssl dgst -list | grep "sha")
kljucevi=$(ls ./ | grep "key")
tekstovi=$(ls ./ | grep "tekst")

mkdir -p pub

for kljuc in $kljucevi; do
    openssl rsa -in $kljuc -out "pub/$kljuc" -pubout
done

for algoritam in $algoritmi;do

    for kljuc in $kljucevi; do
        
        for tekst in $tekstovi;do
        
            result=$(openssl dgst $algoritam -verify "pub/$kljuc" -signature "potpis.txt" "$tekst")
            if echo $result | grep "OK"; then

            echo "$algoritam, $kljuc , $tekst" >> resenje.txt
            break 3

            fi

        done

    done

done

#-sha224, kljuc19.key , tekst20.txt
