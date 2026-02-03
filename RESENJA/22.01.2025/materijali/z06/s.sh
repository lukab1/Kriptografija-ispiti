#!/bin/bash

kljucevi=$(ls ./ | grep "kljuc")
mojKljuc=$(openssl rsa -in "folder/mojKljuc.key" -noout -modulus)


for kljuc in $kljucevi; do
    val1=$(openssl rsa -in $kljuc -noout -modulus)
    if [[ "$val1" = "$mojKljuc" ]]; then
        echo "$kljuc" >> resenje.txt
        break;
    fi
done


#kljuc50.key
