#!/bin/bash

datoteke=$(ls ./ | grep "ulaz")

algoritam=apr1

for datoteka in $datoteke;do
    
    key=$(openssl passwd -apr1 -salt $(cat "$datoteka") "$datoteka")
    result=$(openssl enc -d -base64 -aes-192-cbc -in "sifrat.txt" -k $key)
    echo "datoteka: $datoteka, result: $result" >> resenja.txt
    

done

#datoteka: ulaz44.txt, result: sadrzaj44
