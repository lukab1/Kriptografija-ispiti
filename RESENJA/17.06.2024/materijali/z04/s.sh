#!bin/bash

otisci=$(ls ./ | grep "dec")
ulazi=$(ls ./ | grep "ulaz")
algoritmi=$(openssl dgst -list)

for algoritam in $algoritmi; do
    for ulaz in $ulazi; do
        result=$(openssl dgst -"$algoritam" "$ulaz" | sed 's/[^=]*= //' 2>/dev/null)
#        echo "$result"
        for otisak in $otisci; do
            if [[ "$result" = $(cat "$otisak") ]]; then
                echo "algoritam: $algoritam, ulaz: $ulaz, otisak: $otisak" >> resenje.txt
            fi
        done
    done
done

#
#algoritam: -blake2b512, ulaz: ulaz41.txt, otisak: dec_otisak4.txt
#algoritam: -blake2b512, ulaz: ulaz41.txt, otisak: dec_otisak4.txt
#algoritam: -md5, ulaz: ulaz22.txt, otisak: dec_otisak2.txt
#algoritam: -sha3-224, ulaz: ulaz1.txt, otisak: dec_otisak3.txt
#algoritam: -shake256, ulaz: ulaz23.txt, otisak: dec_otisak1.txt
#algoritam: -ssl3-md5, ulaz: ulaz22.txt, otisak: dec_otisak2.txt
