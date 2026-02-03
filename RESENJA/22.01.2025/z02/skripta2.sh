#!usr/bin/env bash

#sifrat = $(cat "sifrat.txt")

algoritmi=$(openssl list -cipher-algorithms | grep -i "DES")

i=0

for algo in $algoritmi; do
    # Prvo dešifrovanje
    openssl enc -$algo -base64 -d -in "sifrat.txt" -out "folder2/dec${i}_step1.txt" -k lozinka19

    # Drugo dešifrovanje (koristi prvi izlaz kao ulaz)
    openssl enc -$algo -d -in "folder2/dec${i}_step1.txt" -out "folder2/dec${i}_step2.txt" -k lozinka19

    # Treće dešifrovanje (koristi drugi izlaz kao ulaz)
    openssl enc -$algo -d -in "folder2/dec${i}_step2.txt" -out "folder2/dec${i}_step3${algo}.txt" -k lozinka19

    # Povećavanje brojača za sledeći fajl
    ((i++))
done
