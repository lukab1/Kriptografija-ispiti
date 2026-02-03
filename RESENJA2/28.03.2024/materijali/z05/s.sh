#!/bin/bash

algoritmi="-1 -apr1 -5 -6 -aixmd5"

datoteke=$(ls ./ | grep "cnf")

salt=nije22

for datoteka in $datoteke; do
    for algoritam in $algoritmi; do
        result=$(openssl passwd $algoritam -salt "nije22" $datoteka | sed 's/^\$[^$]*\$//') 
        echo "$result"
        if [[ "$result" = "$(cat "dec_otisak.txt")" ]];then
            echo "$datoteka" >> resenje.txt
            break 2
        fi
    done
done

#openssl48.cnf
