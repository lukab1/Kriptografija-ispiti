#!/bin/bash

algorithms="-6 -5 -apr1 -1 -aixmd5"
configs=$(ls ./ | grep "cnf")
password=$(cat "otisak_dec.txt")

for config in $configs; do
    for algoritam in $algorithms; do
        result=$(openssl passwd $algoritam -salt "nije22" "$config" | sed 's/^\$[^$]*\$//')
        if [[ "$result" = "$password" ]]; then
            echo "$config" >> resenje.txt
        fi
    done
done

openssl48.cnf
