#!/bin/bash

kljucevi=$(ls ./ | grep "key")
tekstovi=$(ls ./ | grep "tekst")
algoritmi=$(openssl dgst -list | grep "sha")

mkdir -p folder

for kljuc in $kljucevi; do
    openssl rsa -in $kljuc -out "folder/$kljuc" -outform PEM
done

mkdir -p folder/pub

for kljuc in $kljucevi; do
    openssl rsa -in "folder/$kljuc" -out "folder/pub/$kljuc" -outform PEM -pubout
done

kljucevi2=$(ls folder/ | grep "key")

for kljuc in $kljucevi; do
    for tekst in $tekstovi; do
        for algoritam in $algoritmi; do
            result=$(openssl dgst $algoritam -prverify "folder/$kljuc" -signature "potpis.txt" "$tekst")
            if echo $result | grep "OK"; then
                echo "$kljuc , $tekst" >> resenje.txt
                break
            fi
        done
    done
done

for kljuc in $kljucevi; do
    for tekst in $tekstovi; do
        result=$(openssl dgst -verify "folder/pub/$kljuc" -signature "enc_potpis.txt" "$tekst")
        if echo $result | grep "OK"; then
            echo "$kljuc , $tekst" >> resenje.txt
        fi
    done
done

#kljuc11.key , tekst12.txt
