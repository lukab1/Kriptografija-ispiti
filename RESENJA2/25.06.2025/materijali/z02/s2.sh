#!/bin/bash


ulazi=$(ls ./ | grep "ulaz")
#
#for ulaz in $ulazi;do
#    result=$(openssl dgst -shake256 $ulaz | sed 's/[^=]*= //')
#    if [[ "$result" = "$(cat "otisak.txt")" ]]; then
#        echo "$ulaz" >> resenja.txt
#        break    
#    fi
#done

#ulaz55.txt

algoritmi=$(openssl enc -list | grep "camellia")

#for algoritam in $algoritmi; do
#
#    result=$(openssl enc -base64 $algoritam -in "ulaz55.txt" -k "ulaz55.txt")
#
#    echo "$result"
#
#    if [[ "$result" = "$(cat "sifrat.txt")" ]]; then
#        echo "$algoritam" >> resenja.txt
#        break
#    fi
#done

#for algoritam in $algoritmi; do
#    for ulaz in $ulazi;do
#        result=$(openssl enc -base64 $algoritam -in "$ulaz" -k "ulaz55.txt")
#
#        echo "$result"
#
#        if [[ "$result" = "$(cat "sifrat.txt")" ]]; then
#            echo "$algoritam" >> resenja.txt
#            break
#        fi
#    done
#done


for algoritam in $algoritmi; do
        result=$(openssl enc -d -base64 $algoritam -in "sifrat.txt" -k "ulaz55.txt")

        echo "algoritam: $algoritam, rezultat: $result" >> resenje3.txt
done


#algoritam: -camellia-192-ctr, rezultat: Ulazni sadrzaj 5Mô

