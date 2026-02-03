#!/bin/bash

kljucevi=$(ls ./ | grep "key")

mkdir -p pub

#for kljuc in $kljucevi;do
#    openssl rsa -in $kljuc -out "pub/$kljuc" -outform PEM
#done

for kljuc in $kljucevi;do
    openssl dsa -in $kljuc -out "pemDSA/$kljuc" -outform PEM
done

for kljuc in $kljucevi;do
    result=$(openssl pkeyutl -decrypt -inkey "pemDSA/$kljuc" -in "dec_izlaz.txt")
    echo "$kljuc, $result" >> resenja2.txt
done




for kljuc in $kljucevi;do
    result=$(openssl rsautl -decrypt -inkey "pemRSA/$kljuc" -in "dec_izlaz.txt")
    echo "$kljuc, $result" >> resenja.txt
done

#luka@luka-virtual-machine:~/Desktop/14.06.2023/materijali/z04$ openssl pkeyutl -decrypt -inkey "kljuc18v3.key" -in "dec_izlaz.txt"
#Ulazna datoteka sadrzi smislen tekst.
#
