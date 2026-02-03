#!usr/bin/env bash
#
#hash1=$(cat "otisak.txt")
#echo "$hash1"
#
#
#algoritmi=("SHA1" "SHA224" "SHA256" "SHA3-224" "SHA3-256" "SHA3-384" "SHA3-512" "SHA512-224" "SHA512-256")
#
#    for algo in $algoritmi
#    do
#for i in {0..30}
#do
#    input_file="lozinka$i.txt"
#    for algo in "${algoritmi[@]}"
#        do
#        novi_hash=$(openssl dgst -$algo "$input_file" | sed "s/^.*= //")
#        if [[ "$hash1" == "$novi_hash" ]]
#           then
#            echo "NADJENO"
#        fi
#    done
#done

#!/usr/bin/env bash

# Čitanje sadržaja iz fajla
hash1=$(cat "otisak.txt")
echo "$hash1"

# Definisanje niza algoritama
algoritmi=("SHA1" "SHA224" "SHA256" "SHA3-224" "SHA3-256" "SHA3-384" "SHA3-512" "SHA512-224" "SHA512-256" "MD5-SHA1" "SHA384" "SSL3-SHA1" "MD5" "RSA-SHA1" "SHA512")

# Petlja kroz fajlove (koristi seq za preciznu petlju)
for i in $(seq 0 30)
do
    input_file="lozinka$i.txt"
    
    # Petlja kroz algoritme
    for algo in "${algoritmi[@]}"
    do
        # Generisanje heša za fajl i algoritam, uklanjanje "sha256(stdin)="
        novi_hash=$(openssl dgst -$algo "$input_file" | sed "s/^.*= //")
#        echo "$novi_hash"
        echo

        # Poređenje heševa
        if [[ "$hash1" == "$novi_hash" ]]
        then
            echo "NADJENO za algoritam: $algo u fajlu $input_file"
        fi
    done
done

