#!bin/bash

#mkdir -p f
#mkdir -p f/pub
#
kljucevi=$(ls ./ | grep "key")
#
#for kljuc in $kljucevi; do
#    openssl rsa -in "$kljuc" -out "f/$kljuc" -outform PEM
#done
#
#for kljuc in $kljucevi; do
#    openssl rsa -in "f/$kljuc" -out "f/a/pub_$kljuc" -pubout -outform PEM
#done

openssl enc -d -base64 -in "sifrat.txt" -out "sifrat1.txt"

for kljuc in $kljucevi; do
    result=$(openssl rsautl -decrypt -inkey "f/$kljuc" -in "sifrat1.txt")
    echo "kljuc: $kljuc , rezultat:$result" >> resenje.txt
done

#kljuc: kljuc85.key , rezultat:OSVOJILI STE 1 BOD. IDEMO NA SLEDECI ZADATAK.
