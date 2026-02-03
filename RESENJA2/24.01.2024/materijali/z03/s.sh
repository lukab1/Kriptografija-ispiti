#!/bin/bash

b64_otisci=$(ls ./ | grep "otisak")


for otisak in $b64_otisci; do
    openssl enc -d -base64 -in "$otisak" -out "dec_$otisak"
done

dec_otisci=$(ls ./ | grep "dec")
algoritmi=$(openssl dgst -list)
ulazi=$(ls ./ | grep "ulaz")


for algoritam in $algoritmi;do

    for ulaz in $ulazi;do
    
    result=$(openssl dgst $algoritam "$ulaz" | sed 's/[^=]*= //')   
     
        for otisak in $dec_otisci;do
            if [[ "$result" = "$(cat "$otisak")" ]]; then
                echo "ulaz: $ulaz , otisak: $otisak" >> resenje.txt
            fi
        done
    done
done

#ulaz: ulaz22.txt , otisak: dec_otisak2.txt
#ulaz: ulaz23.txt , otisak: dec_otisak1.txt
#ulaz: ulaz22.txt , otisak: dec_otisak2.txt
