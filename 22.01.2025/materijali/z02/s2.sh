#!/bin/bash

otisakAlgoritmi=$(openssl dgst -list | grep "sha")

otisak=$(cat "otisak.txt")

for otisakAlgoritam in $otisakAlgoritmi; do
    
    for i in {1..30};do
     result=$(echo -n "lozinka$i" | openssl dgst $otisakAlgoritam | sed 's/[^=]*= //')

    if [[ "$result" = "$otisak" ]]; then
        echo "lozinka$i , $otisakAlgoritam"
        break 2
    fi
    done

done

#lozinka19 , -sha512


algoritmi=$(openssl enc -list | grep "des")

for algoritam in $algoritmi; do
    result1=$(openssl enc -d "$algoritam" -in sifrat.dec -k lozinka19 2>/dev/null)
    result2=$(echo "$result1" | openssl enc -d -k lozinka19 "$algoritam" 2>/dev/null)
    result3=$(echo "$result2" | openssl enc -d -k lozinka19 "$algoritam" 2>/dev/null)
    
    echo "$algoritam ,  $result3" >> resenja.txt
done

-des-ede3-ofb ,  OSVOJILI STE 1 BOD. IDEMO NA SLEDECI ZADATAK.Ó
