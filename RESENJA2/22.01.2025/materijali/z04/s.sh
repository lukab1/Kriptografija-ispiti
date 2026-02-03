#!/bin/bash

ulazi=$(ls ./ | grep "ulaz")

algoritmi=$(openssl dgst -list)

for algoritam in $algoritmi;do

    for ulaz in $ulazi; do

        result=$(openssl dgst $algoritam -prverify "store.key" -signature "potpis.txt" $ulaz)
        if echo $result | grep "OK";then
            echo "$ulaz, $algoritam" >> resenje.txt
            break 2
        fi

    done

done

#ulaz33.txt, -sha256
