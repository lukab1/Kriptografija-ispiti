#!bin/bash

#otisci=$(ls ./ | grep "otisak")
#
#mkdir -p f
#
#for otisak in $otisci; do
#    openssl enc -d -base64 -in "$otisak" -out "f/$otisak"
#done

otisci=$(ls f/ | grep "otisak")
algoritmi=$(openssl dgst -list)
#ulaz=$(cat "ulaz.txt")

for algoritam in $algoritmi; do
#    echo "$algoritam"
    result=$(openssl dgst "$algoritam" "ulaz.txt" | sed 's/[^=]*= //')
#    echo "$result"
    for otisak in $otisci; do

        echo "otisak: $(cat "$otisak")"
        echo "result: $result"

        if [[ "$result" == $(cat "f/$otisak") ]]; then
            echo "otisak: $otisak" >> resenje.txt
        fi
    done
done

#otisak: otisak07.txt
