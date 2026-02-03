#!bin/bash

ulazi=$(ls ./ | grep "ulaz")

for ulaz in $ulazi;do
    algoritam=$(cat "$ulaz" | awk -F'$' '{print $2}')
    salt=$(cat "$ulaz" | awk -F'$' '{print $3}')

    echo "$ulaz"

    result=$(openssl passwd -"$algoritam" -salt "$salt" "$ulaz" 2>/dev/null)
#    echo $result
#    echo $(cat "$ulaz")

    if [[ $result = $(cat "$ulaz") ]]; then
        echo "ulaz: $ulaz " >> "resenje.txt"
    fi
    
done

#ulaz: ulaz40.txt 
