#!bin/bash

hashovi=$(ls ./ | grep "otisak")
ulazi=$(ls ./ | grep "ulaz")
algoritmi=$(openssl dgst -list)

for algoritam in $algoritmi;do
#    echo "$algoritam"
    for ulaz in $ulazi;do
        var=$(openssl dgst -"$algoritam" "$ulaz" | sed 's/[^=]*= //' 2>/dev/null)
        echo "$var"
        for hesh in $hashovi;do
            if [[ "$var" == $(cat "$hesh") ]]; then
            echo "otisak: $hesh, ulaz: $ulaz"
            echo "otisak: $hesh, ulaz: $ulaz" >> resenje.txt
            fi
        done
    done
done
