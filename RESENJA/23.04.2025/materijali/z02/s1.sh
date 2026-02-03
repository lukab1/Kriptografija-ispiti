#!usr/bin/env bash

h_pass1=$(cat "o1.txt")
h_pass2=$(cat "o2.txt")
h_pass3=$(cat "o3.txt")

salt1="lozinka1"
salt2="lozinka7"
salt3="wAgnh5WA"

j=0

for i in {1..30}
do
    k1=$(openssl passwd -apr1 -salt "$salt1" -in "lozinka$i.txt")
    if [[ "$h_pass1" == "$k1" ]]
    then
        echo "KLJUC JE" "lozinka$i.txt"
    fi

    k2=$(openssl passwd -apr1 -salt "$salt2" -in "lozinka$i.txt")
    if [[ "$h_pass2" == "$k2" ]]
    then
        echo "KLJUC2 JE" "lozinka$i.txt"
    fi

    k3=$(openssl passwd -apr1 -salt "$salt3" -in "lozinka$i.txt")
    if [[ "$h_pass3" == "$k3" ]]
    then
        echo "KLJUC3 JE lozinka$i.txt"
    fi
done

#KLJUC2 JE lozinka3.txt
#KLJUC JE lozinka18.txt
#KLJUC3 JE lozinka30.txt
#

algorithms=$(openssl list -cipher-algorithms | grep -i "AES-256")

i=0

for algo in $algorithms
do
#    mkdir -p "f2/$algo"
    openssl enc -$algo -d -base64 -in "sifrat.txt" -out "f2/{$algo}step1.txt" -k lozinka30
    openssl enc -$algo -d -in "f2/{$algo}step1.txt" -out "f2/{$algo}step2.txt" -k lozinka3
    openssl enc -$algo -d -in "f2/{$algo}step2.txt" -out "f2/{$algo}step3.txt" -k lozinka18
done


    
