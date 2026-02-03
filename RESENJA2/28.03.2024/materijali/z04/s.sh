#!/bin/bash

sertifikati=$(ls ./ | grep "crt")

for sertifikat in $sertifikati;do
    result=$(openssl verify -CAfile cacert.pem $sertifikat)
    if ! echo $result | grep "error"; then
        echo "$sertifikat" >> resenje.txt
    fi
done
