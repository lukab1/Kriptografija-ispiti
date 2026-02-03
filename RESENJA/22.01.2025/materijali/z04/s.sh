#!bin/bash

algoritmi=$(openssl dgst -list)
ulazi=$(ls ./ | grep "ulaz")

for ulaz in $ulazi; do
    result=$(openssl dgst -verify "pub_kljuc.key" -signature "potpis.txt" "$ulaz")
    if echo "$result" | grep "OK"; then
        echo "ulaz: $ulaz" >> resenja.txt
    fi
done

#ulaz: ulaz33.txt
