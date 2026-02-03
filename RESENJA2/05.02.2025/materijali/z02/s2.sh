#!/bin/bash

ulazi=$(ls ./ | grep "ulaz")

for ulaz in $ulazi; do
    result=$(openssl passwd -5 -salt "ulaz14.txt" $ulaz)

    if [[ "$result" = "$(cat "dec_otisak.txt")" ]]; then
        echo "$ulaz" >> resenje.txt
        break
    fi
done

#ulaz35.txt
