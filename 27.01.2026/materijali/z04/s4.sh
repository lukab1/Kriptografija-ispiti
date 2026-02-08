#!/bin/bash

signatures=$(ls ./ | grep "signature")

for signature in $signatures;do
    result=$(openssl dgst -sha256 -prverify "privatni_kljuc.pem" -signature "$signature" ulaz.txt)

    if echo "$result" | grep "OK"; then

        echo "$signature" >> resenja.txt
        break
    fi
done

#signature75.txt
