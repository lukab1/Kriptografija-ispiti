#!bin/bash

mkdir -p f

kljucevi=$(ls ./ | grep ".key")
potpisi=$(ls ./ | grep "potpis")

#for kljuc in $kljucevi; do
#    openssl rsa -in "$kljuc" -out "f/pub_$kljuc" -pubout -inform PEM
#done

for kljuc in $kljucevi; do
#    result=$(openssl dgst -sha224 -sign)
    for potpis in $potpisi; do
        result=$(openssl dgst -sha224 -prverify "$kljuc" -signature "$potpis" "ulaz.txt")
        if echo "$result" | grep "OK"; then
            echo "kljuc:$kljuc, potpis:$potpis" >> resenja.txt
            break 2
        fi
    done
done

#kljuc:kljuc11.key, potpis:potpis43.txt


#pub_kljuveci=$(ls f/ | grep "pub")
#
#for kljuc in $pub_kljucevi; do
#    for potpis in $potpisi; do
#        result=$(openssl dgst -verify "f/$kljuc" -signature "$potpis" "ulaz.txt")
#        if echo "$result" | grep "OK"; then
#            echo "kljuc:$kljuc, potpis:$potpis" >> resenja.txt
#            break 2
#        fi
#    done
#done
