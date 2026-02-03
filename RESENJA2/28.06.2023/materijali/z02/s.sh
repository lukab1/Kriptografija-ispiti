#!/bin/bash

kljucevi=$(ls ./ | grep "key")
potpisi=$(ls ./ | grep "potpis")

mkdir -p pubRSA
mkdir -p pubDSA

mkdir -p RSA
mkdir -p DSA
mkdir -p PUB
mkdir -p POTPISI

#for potpis in $potpisi; do
#    openssl enc -d -base64 -in "$potpis" -out "POTPISI/$potpis"
#done
#
#for kljuc in $kljucevi; do
#    result=$(cat "$kljuc")
#    
#    if echo $result | grep "PUB"; then
#        mv $kljuc "PUB/$kljuc"
#    fi
#done
potpisi=$(ls POTPISI/ | grep "potpis")

kljuceviRSA=$(ls pubRSA/ | grep "key")

for kljuc in $kljuceviRSA; do

    for potpis in $potpisi; do
        
        result=$(openssl dgst -sha1 -verify "pubRSA/$kljuc" -signature "POTPISI/$potpis" "ulaz.txt")
        if echo $result | grep "OK"; then
            echo "$kljuc , $potpis" >> resenje.txt
            break 2
        fi

    done

done

kljuceviDSA=$(ls pubDSA/ | grep "key")

for kljuc in $kljuceviDSA; do

    for potpis in $potpisi; do

        result2=$(openssl dgst -sha1 -verify "pubDSA/$kljuc" -signature "POTPISI/$potpis" "ulaz.txt")
        if echo $result2 | grep "OK"; then
            echo "$kljuc , $potpis" >> resenje.txt
            break 2
        fi

    done

done


kljucevi2=$(ls PUB/ | grep "key")

for kljuc in $kljucevi2; do

    for potpis in $potpisi; do
        
        result=$(openssl dgst -sha1 -verify "PUB/$kljuc" -signature "POTPISI/$potpis" "ulaz.txt")
        if echo $result | grep "OK"; then
            echo "$kljuc , $potpis" >> resenje.txt
            break 2
        fi

    done

done


kljuceviRSAPRIV=$(ls RSA/ | grep "key")

for kljuc in $kljuceviRSAPRIV; do

    for potpis in $potpisi; do
        
        result=$(openssl dgst -sha1 -prverify "RSA/$kljuc" -signature "POTPISI/$potpis" "ulaz.txt")
        if echo $result | grep "OK"; then
            echo "$kljuc , $potpis" >> resenje.txt
            break 2
        fi

    done

done

kljuceviDSAPRIV=$(ls DSA/ | grep "key")

for kljuc in $kljuceviDSAPRIV; do

    for potpis in $potpisi; do
        
        result2=$(openssl dgst -sha1 -prverify "DSA/$kljuc" -signature "POTPISI/$potpis" "ulaz.txt")
        if echo $result2 | grep "OK"; then
            echo "$kljuc , $potpis" >> resenje.txt
            break 2
        fi  

    done

done

#key65.key , potpis13.sign
