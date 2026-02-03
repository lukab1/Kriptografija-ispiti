#!/bin/bash

kljucevi=$(ls ./ | grep "key")

openssl enc -d -base64 -in sifrat.txt -out dec_sifrat.txt

mkdir -p rsaKljucevi

for kljuc in $kljucevi; do
#    openssl rsa -in $kljuc -out "rsaKljucevi/$kljuc" -outform PEM


    result=$(openssl rsautl -decrypt -inkey "rsaKljucevi/$kljuc" -in "dec_sifrat.txt")

    echo "KLJUC: $kljuc, REZULTAT: $result" >> resenja.txt
    echo >> resenja.txt

done

#KLJUC: kljuc85.key, REZULTAT: OSVOJILI STE 1 BOD. IDEMO NA SLEDECI ZADATAK.
