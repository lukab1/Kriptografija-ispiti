#!/bin/bash

#sertifikati=$(ls folder)
#
#for sert in $sertifikati;do
#    openssl x509 -in "folder/$sert" -pubkey -noout > "kljucevi/$sert.key"
#done
#
rsaKljucevi=$(ls ./ | grep "key")

mkdir -p rsaKeys

for rsaKljuc in $rsaKljucevi;do
    openssl rsa -in $rsaKljuc -pubout -out "rsaKeys/$rsaKljuc"
done

sertKljucevi=$(ls kljucevi/ | grep "key")

for rsaKljuc in $rsaKljucevi;do
    
    for sertKljuc in $sertKljucevi; do
        
        if [[ "$(cat "kljucevi/$sertKljuc")" = "$(cat "rsaKeys/$rsaKljuc")" ]]; then
            echo "$sertKljuc , $rsaKljuc" >> resenja.txt
        fi
    done
        
done

#s3.key , kljuc17.key
#s10.key , kljuc71.key
