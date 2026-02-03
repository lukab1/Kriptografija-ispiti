#!bin/bash

ulazi=$(ls ./ | grep ".sign")
kljucevi=$(ls ./ | grep ".key")
algoritmi=$(openssl dgst -list | grep "sha")



for ulaz in $ulazi; do
    openssl enc -d -base64 -in "$ulaz" -out "$ulaz.dec"
done

novi_ulazi=$(ls ./ | grep ".dec")


for algoritam in $algoritmi;do
    for ulaz in $novi_ulazi; do
        for kljuc in $kljucevi; do
            result=$(openssl dgst -"$algoritam" -verify "$kljuc" -signature "$ulaz" "ulaz1.txt" 2>/dev/null)

            if echo "$result" | grep "OK"; then
                echo "NADJENO, algoritam:$algoritam , kljuc: $kljuc, potpis: $ulaz" >> "resenje.txt"
                break 3
            fi
            result2=$(openssl dgst -"$algoritam" -prverify "$kljuc" -signature "$ulaz" "ulaz1.txt" 2>/dev/null)

            if echo "$result2" | grep "OK"; then
                echo "NADJENO, algoritam:$algoritam , kljuc: $kljuc, potpis: $ulaz" >> "resenje.txt"
                break 3
            fi
        done
    done
done

#NADJENO, algoritam:-sha1 , kljuc: key44.key, potpis: potpis8.sign.dec

