#!bin/bash

kljucevi=$(ls ./ | grep "kljuc")

openssl enc -d -base64 -in "sifrat.txt" -out "sifrat.dec"

for kljuc in $kljucevi;do
    openssl rsa -in $kljuc -out $kljuc.pem -inform DER -outform PEM 2>/dev/null
    rezultat=$(openssl rsautl -decrypt -in sifrat.dec -inkey $kljuc.pem 2>/dev/null)
    if [[ "$rezultat" != "" ]];then
        echo -e "kljuc: $kljuc.pem"
        echo -e "ulaz: $rezultat"
        break
    fi
    
done

openssl rsautl -decrypt -in sifrat.dec -inkey "kljuc101.key.pem" -out "resenje.txt" 2>/dev/null
