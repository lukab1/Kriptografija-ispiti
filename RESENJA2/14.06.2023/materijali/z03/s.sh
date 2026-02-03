#!/bin/bash

otisci=$(ls ./ | grep "otisak")
ulazi=$(ls ./ | grep "ulaz")
algoritmi=$(openssl dgst -list)

for algoritam in $algoritmi;do

    for ulaz in $ulazi;do
        
        result=$(openssl dgst $algoritam "$ulaz" | sed 's/[^=]*= //' 2>/dev/null)
#        echo "$result"
        
        for otisak in $otisci;do

            if [[ "$result" = "$(cat "$otisak")" ]]; then
                echo "$otisak, $ulaz , $algoritam" >> resenja.txt
            fi

        done

    done
    
done


#otisak6.txt, ulaz37.txt , -shake256
