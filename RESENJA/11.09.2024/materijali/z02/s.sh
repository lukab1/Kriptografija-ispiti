#!usr/env/bin bash

for i in {1..20}
do
    curr_algo=$(awk -F'$' '{print $2}' "otisak$i.txt")
#    echo "$curr_algo"
    curr_salt=$(awk -F'$' '{print $3}' "otisak$i.txt")
#    echo "$curr_salt"
#    curr_hash=$(openssl passwd -"$curr_algo" -salt "$curr_salt" $(cat "ulaz$i.txt"))
    pass=$(cat "otisak$i.txt")

    for j in {1..20}
    do  
        curr_hash=$(openssl passwd -"$curr_algo" -salt "$curr_salt" $(cat "ulaz$j.txt"))
#        pass=$(cat "otisak$j.txt")
#        echo "$pass"
#        echo "$curr_hash"
        if [[ "$curr_hash" == "$pass" ]]
        then
        echo "JUU"
            echo "ulaz$j.txt : otisak$i.txt" >> parovi.txt
        fi
    done
done
