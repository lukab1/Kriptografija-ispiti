#!/bin/bash

configs=$(ls ./ | grep "cnf")
algorithms="-6 -5 -apr1 -1 -aixmd5"
otisak=$(cat "otisak_dec.txt")

for config in $configs; do
    for algoritam in $algorithms; do
        result=$(openssl passwd $algoritam -salt nije22 "$config" | sed "s/^\$[^$]*\$//")
        echo "$result"
        if [[ "$result" = "$otisak" ]];then
            echo "$config" >> resenje.txt
        fi
    done
    
done
