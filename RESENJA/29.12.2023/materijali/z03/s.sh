#!bin/bash

dgst_heshevi=$(ls ./ | grep "otisak")

for hesh in $dgst_heshevi;do
    openssl enc -d -base64 -in "$hesh" -out "dec_$hesh" 2>/dev/null
done

algoritmi=$(openssl dgst -list)
datoteke=$(ls ./ | grep "dec")

for algo in $algoritmi;do
    result=$(openssl dgst -"$algo" ulaz.txt | sed 's/[^=]*= //' 2>/dev/null)
#    echo "$result"
    for datoteka in $datoteke;do
#        echo "$datoteka"
        if [[ "$result" = $(cat "$datoteka") ]]; then
            echo "NAJDENO, datoteka: $datoteka"
            break 2
        fi
    done
done

#NAJDENO, datoteka: dec_otisak11.txt

