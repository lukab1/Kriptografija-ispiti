#!usr/bin/env bash

my_hash=$(cat "otisak.txt")

for i in {1..100}
do
#    openssl dgst -shake256 -out "o.txt" "ulaz$i.txt"
#    variable=$(cat "o.txt" | sed 's/^.*://')
    variable=$(openssl dgst -shake256 "ulaz$i.txt" | sed 's/^.*= //')
#    echo "$variable"
    if [[ "$my_hash" == "$variable" ]]
    then
        echo "NADJENO, ulaz$i.txt"
    fi
done

algorithms=$(openssl enc -list | grep -i "camellia")

for algo in $algorithms
do
    openssl enc $algo -d -base64 -in "sifrat.txt" -out "f1/${algo}.txt" -k ulaz55.txt
done
