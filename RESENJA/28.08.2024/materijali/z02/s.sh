#!usr/env/bin bash

for i in {1..50}
do
    kljuc=$(openssl passwd -5 -salt $(cat "ulaz$i.txt") "ulaz$i.txt" 2>/dev/null)
#    echo "$kljuc"
    result=$(openssl enc -aria-192-ofb -d -base64 -in "sifrat.txt" -k "$kljuc" 2>/dev/null)
#    result2=$(echo "$result" | openssl enc -d -base64 2>/dev/null)
#    echo "result2: $result2 , ulaz: ulaz$i.txt"

    openssl enc -aria-192-ofb -d -base64 -in "sifrat.txt" -out "dec_$i.txt" -k "$kljuc" 2>/dev/null
done


for i in {1..50}
do
    echo "ulaz: ulaz$i.txt"
    cat "dec_$i.txt"
done
