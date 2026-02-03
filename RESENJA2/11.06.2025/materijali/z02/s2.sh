#!/bin/bash

ulazi=$(ls ./ | grep "ulaz")

#for ulaz in $ulazi;do
#    result=$(openssl enc -base64 -des-ede3-ofb -in "$ulaz" -k "kliuczadrugizadatak")
#    
#    if [[ "$result" = "$(cat "sifrat.txt")" ]]; then
#        echo "$ulaz >> resenje.txt"
#        break
#    fi
#done

openssl enc -d -base64 -des-ede-ofb -in sifrat.txt -k kljuczadrugizadatak -out resenje.txt

#ulaz43
