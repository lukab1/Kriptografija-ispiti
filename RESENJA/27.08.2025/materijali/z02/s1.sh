#!usr/bin/env bash

control_hash=$(cat "kontrolni_hash.txt")
algorithms=$(openssl enc -list | grep -i "aes.*ecb")

#echo "?"

for algo in $algorithms
do
#    echo "?"
    for i in {1..100}
    do
        file_hash=$(openssl dgst -sha3-256 "ulaz$i.txt" | sed 's/^.*= //')
        file_decode=$(openssl enc "$algo" -d -in "sifrat.txt" -k "$file_hash")
        novi_hash=$(openssl dgst -sha3-512 <(echo "$file_decode") | sed 's/^.*= //')
        echo "$file_hash"
        if [[ "$control_hash" == "$novi_hash" ]]
        then
            echo "NADJENO, $algo i ulaz$i.txt" > nadjeno.txt
            break 2
        fi
    done
done
