#!/bin/bash

kljucevi=$(ls ./ | grep "key")

mkdir -p folder

#for kljuc in $kljucevi; do
#    openssl rsa -in $kljuc -out "folder/$kljuc" -outform PEM
#done

for kljuc in $kljucevi; do
    result=$(openssl rsautl -decrypt -inkey "folder/$kljuc" -in "sifrat_dex.txt")
    echo "$kljuc ,  result : $result " >> resenja.txt
done

#kljuc144.key ,  result : ovo je ulazna datoteka 
