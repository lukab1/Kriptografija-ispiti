#!/bin/bash

liste=$(ls ./ | grep "crl")
sertifikati=$(ls ./ | grep "crt")

for lista in $liste; do
    openssl crl -in $lista -noout -text | grep -E "Serial Number:" | sed 's/ .*Serial Number: *//' >> revoked.txt
done

for sertifikat in $sertifikati; do
    serial=$(openssl x509 -in $sertifikat -noout -serial | sed 's/serial=//' )
    echo "$serial"
    
    flag=false

    while IFS= read revoked; do
        if [[ "$serial" = "$revoked" ]];then
            flag=true
            break
        fi
    done < revoked.txt

    if [[ "$flag" = false ]]; then
        echo "$sertifikat" >> resenje.txt
    fi

done
