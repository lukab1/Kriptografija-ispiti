#!bin/bash

ulazi=$(ls ./ | grep "ulaz")

for ulaz in $ulazi; do
    algo=$(cat "$ulaz" | awk -F'\$' '{print $2}')
    salt=$(cat "$ulaz" | awk -F'\$' '{print $3}')
    for ulaz2 in $ulazi; do
        pas=$(openssl passwd -"$algo" -salt "$salt" "$ulaz2" 2>/dev/null)
        if [[ $(cat "$ulaz") == "$pas" ]]; then
            echo "NADJENO!!! , $ulaz"
            break
        fi
    done
done

#ulazi=$(ls ./ | grep "ulaz")
#for ulaz in $ulazi; do
#    algo=$(cat "$ulaz" | awk -F'\$' '{print $2}')
#    salt=$(cat "$ulaz" | awk -F'\$' '{print $3}')
#
#
#    for ulaz2 in $ulazi; do
#        pass=$(openssl passwd -"$algo" -salt "$salt" "$ulaz2" 2>/dev/null)
#        if [[ $(cat "$ulaz") == "$pass" ]]; then
#            echo "NADJENO!!! Fajl: $ulaz, Algoritam: $algo, Salt: $salt"
#            break
#        fi
#    done
#done
#
