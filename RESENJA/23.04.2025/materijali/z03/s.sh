#!bin/bash

ulazi=$(ls ./ | grep "ulaz")
otisci=$(ls ./ | grep "otisak")
algoritmi=$(openssl dgst -list)

for algoritam in $algoritmi; do
    echo "$algoritam"
    for ulaz in $ulazi; do
        result=$(openssl dgst $algoritam "$ulaz" | sed 's/[^=]*= //' 2>/dev/null)
        for otisak in $otisci; do
            if [[ "$result" = $(cat "$otisak") ]]; then
                echo "datoteka: $ulaz , otisak: $otisak, algoritam: $algoritam" > resenje.txt
                break 3
            fi
        done
    done
done

#datoteka: ulaz37.txt , otisak: otisak6.txt, algoritam: -shake256
