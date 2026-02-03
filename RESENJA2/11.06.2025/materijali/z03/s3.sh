#!/bin/bash

ulazi=$(ls ./ | grep "ulaz")

mkdir -p dec

for ulaz in $ulazi;do
    openssl enc -d -base64 -in "$ulaz" -out "dec/$ulaz"
done

for ulaz in $ulazi;do
    
    algoritam=$(cat "dec/$ulaz" | awk -F'$' '{print $2}')
    moj_salt=$(cat "dec/$ulaz" | awk -F'$' '{print $3}')


    result2=$(openssl passwd -$algoritam -salt "$moj_salt" $ulaz)

    echo "$result2"

    if [[ "$result" = "$resutl2" ]]; then
        echo "$ulaz" >> resenje.txt
        break
    fi

done

#ulaz10.txt
