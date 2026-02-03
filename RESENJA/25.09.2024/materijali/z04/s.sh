#!bin/bash


mkdir -p folder

ulazi=$(ls ./ | grep "ulaz")

for ulaz in $ulazi; do
    openssl enc -d -base64 -in "$ulaz" -out "folder/$ulaz"
done

ulazi=$(ls folder/ | grep "ulaz")

for ulaz in $ulazi;do
    algoritam=$(cat "$ulaz" | awk -F'$' '{print $2}')
    salt=$(cat "$ulaz" | awk -F'$' '{print $3}')

    echo "$ulaz"

    result=$(openssl passwd -"$algoritam" -salt "$salt" "$ulaz" 2>/dev/null)
#    echo $result
#    echo $(cat "$ulaz")

    if [[ $result = $(cat "folder/$ulaz") ]]; then
        echo "ulaz: $ulaz " >> "folder/resenje.txt"
    fi
    
done
