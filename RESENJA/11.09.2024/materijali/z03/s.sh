#!usr/env/bin bash

algoritmi=$(openssl enc -list | grep -i "aes")


for algo in $algoritmi
do
    result=$(openssl enc "$algo" -d -base64 -in "sifrat.txt" -k "$algo" 2>/dev/null)
    echo "rezultat_$algo : $result" >> resenja3.txt
done
