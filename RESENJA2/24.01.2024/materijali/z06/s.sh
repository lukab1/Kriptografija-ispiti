#!/bin/bash

keystores=$(ls ./ | grep "jks")
algoritmi=$(openssl dgst -list | grep "512")

for keystore in $keystores;do
#    result=$(openssl dgst -verify pub.key -signature "potpis.txt" $keystore)
#    if echo $result | grep "OK"; then
#        echo "keystore: $keystore" >> resenje.txt
#        break
#    fi
    for algoritam in $algoritmi; do
        result2=$(openssl dgst $algoritam -sign kljuc.key "$keystore")
        if [[ "$result2" = "$(cat "potpis.txt")" ]];then
            echo "$keystore" >> resenje;
            break
        fi
    done
done

#keystore21.jks
