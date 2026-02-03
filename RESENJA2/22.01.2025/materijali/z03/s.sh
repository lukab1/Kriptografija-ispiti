#!/bin/bash

otisci=$(ls ./ | grep "otisak")

#mkdir -p folder
#
#for otisak in $otisci; do
#    openssl enc -d -base64 -in $otisak -out "folder/$otisak"
#done

algoritmi=$(openssl dgst -list)

for algoritam in $algoritmi;do
    result=$(openssl dgst $algoritam "ulaz.txt" | sed 's/[^=]*= //')
    echo "$result"
    
    for otisak in $otisci;do

        if [[ "$result" = "$(cat "folder/$otisak")" ]]; then
            echo "$otisak ,  $algoritam" >> resenje.txt
        fi

    done

done

#otisak07.txt ,  -sha384
