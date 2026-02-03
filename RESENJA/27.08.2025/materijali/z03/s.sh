#!bin/bash

potpisi=$(ls ./ | grep "signature")

for potpis in $potpisi; do
    result=$(openssl dgst -prverify "privatni_kljuc.pem" -signature "$potpis" "ulaz.txt")
    if echo "$result" | grep "OK"; then
        echo "signature: $potpis" >> resenje.txt
        break
    fi
done

#signature: signature90.txt
