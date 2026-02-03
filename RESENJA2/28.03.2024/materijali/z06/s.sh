#!/bin/bash

keystores=$(ls ./ | grep "keystore")
algoritmi=$(openssl dgst -list | grep "sha")

openssl enc -d -base64 -in otisak.txt -out otisak_dec.txt

for keystore in $keystores; do

    for algoritam in $algoritmi; do
        
        result=$(openssl dgst $algoritam $keystore | sed 's/[^=]*= //')
        if [[ "$result" = "$(cat "otisak_dec.txt")" ]]; then
            echo "$keystore" >>resenjeA.txt
            break 2
        fi
    
    done

done

keystore5.jks
