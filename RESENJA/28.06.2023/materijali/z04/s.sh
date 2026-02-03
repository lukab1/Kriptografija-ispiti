#!bin/bash

mkdir f

ulazi=$(ls ./ | grep "ulaz")

for ulaz in $ulazi;do
    openssl enc -d -base64 -in "$ulaz" -out "f/$ulaz"
done
#
ulazi2=$(ls f/ | grep "ulaz")

for ulaz in $ulazi2;do
#    echo "$ulaz"
    algo=$(cat "$ulaz" | awk -F'\\$' '{print $2}')
    salt=$(cat "$ulaz" | awk -F'\\$' '{print $3}')
    echo "algo: $algo , salt: $salt"
    pas=$(openssl passwd -"$algo" -salt "$salt" "$ulaz" 2>/dev/null)
    

    echo "ULAZ:" $(cat "$ulaz")
    echo "PASS: $pas"

    if [[ $(cat "$ulaz") == "$pass" ]];then
        echo "NADJENO!!! , $ulaz"
        break
    fi
done
