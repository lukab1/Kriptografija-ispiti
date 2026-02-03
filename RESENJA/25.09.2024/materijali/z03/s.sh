#!bin/bash

ulazi=$(ls ./ | grep "ulaz")
algoritmi=$(openssl enc -list | grep "des")

for algoritam in $algoritmi; do
        result=$(openssl enc -d "$algoritam" -in "sifrat1.txt" -k "ulaz73.txt" 2>/dev/null)
        echo "algoritam: $algoritam, ulaz: $ulaz, resenje: $result" >> resenja2.txt
done

#for ulaz in $ulazi; do
#    result=$(openssl dgst -sha1 -verify "pub_key.key" -signature "potpis1.txt" "$ulaz")
#    if echo "$result" | grep "OK"; then
#        echo "ulaz: $ulaz"
#    fi
#done
#
#Verified OK
#ulaz: ulaz73.txt
#

#algoritam: -des-ede3, ulaz: , resenje: Ulazni sadrzaj 73

#for i in {1..33}; do
#    openssl rsa -in keys/rsa/keys$i.key -inform PEM -pubout -out keys/public/keys$i.key; 
#done 2>/dev/null
#
#for i in {42..78}; do
#    openssl dsa -in keys/dsa/keys$i.key -inform PEM -pubout -out keys/public/keys$i.key;
#done 2>/dev/null
