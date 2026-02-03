#!usr/env/bin bash

sifrat=$(cat "sifrat.txt")

for i in {1..50}
do
    kljuc=$(openssl passwd -apr1 -salt $(cat "ulaz$i.txt") "ulaz$i.txt")
    var=$(openssl enc -aes-192-cbc -d -base64 -in "sifrat.txt" -k $kljuc 2>/dev/null)
    echo "$var , $kljuc ,"
    
#    for j in {1..50}
#    do
#        kript=$(openssl enc -aes-192-cbc -base64 -in "ulaz$j.txt" -k "$kljuc" 2>/dev/null)
#        echo "$kript"
#        if [[ "$kript" == "$sifrat" ]]
#        then
#            echo "NADJENO"
#        fi
#    done
done
