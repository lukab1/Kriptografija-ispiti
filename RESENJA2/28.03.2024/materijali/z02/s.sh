#!/bin/bash

#otisci=$(ls ./ | grep "otisak")
#
#for otisak in $otisci; do
#    openssl enc -d -base64 -in $otisak -out "dec_$otisak"
#done
#
#var1=$apr1$lozinka1$NayNtGqjZ5FzvSulsQvaa.
#var2=$apr1$lozinka7$EneC7HhVrfMd5p6KWT8VT.
#$apr1$wAgnh5WA$CyPYmkLRTzbSN1fIQROnu1

#lozinke=$(ls ./ | grep "lozinka")
#
#for lozinka in $lozinke;do
#    result=$(openssl passwd -apr1 -salt lozinka1 "$(cat $lozinka)")
#    result2=$(openssl passwd -apr1 -salt lozinka7 "$(cat $lozinka)")
#    result3=$(openssl passwd -apr1 -salt wAgnh5WA "$(cat $lozinka)")
#    
#    if [[ "$result" ==  "$(cat "dec_otisak1.txt")" ]]; then
#        echo "1:$(cat $lozinka)" >> resenja.txt
#    fi
#    if [[ "$result2" ==  "$(cat "dec_otisak2.txt")" ]]; then
#        echo "2:$(cat $lozinka)" >> resenja.txt
#    fi
#    if [[ "$result3" ==  "$(cat "dec_otisak3.txt")" ]]; then
#        echo "3:$(cat $lozinka)" >> resenja.txt
#    fi
#done

#1:lozinka18
#3:lozinka30
#2:lozinka3

algoritmi=$(openssl enc -list | grep "aes")

mkdir -p folder

for algoritam in $algoritmi;do

    openssl enc "$algoritam" -d -base64 -in "sifrat.txt" -k "lozinka30" -out "folder/1$algoritam.txt"
    openssl enc $algoritam -d -in "folder/1$algoritam.txt" -out "folder/2$algoritam.txt" -k "lozinka3"
    result3=$(openssl enc $algoritam -d -in "folder/2$algoritam.txt" -k "lozinka18")
    
    echo $result3 >> resenja2.txt
done



#DANAS JE ISPIT IZ KRIPTOGRAFIJE





