#!/bin/bash

#sertifikati=$(ls ./ | grep "client")
#
#for sertifikat in $sertifikati; do
#    result=$(openssl verify -CAfile cacert.pem "$sertifikat")
#    if echo "$result" | grep "OK"; then
#        echo "$sertifikat" >> resenje.txt
#    fi
#done

#
#for i in {1..30}; do
#    provjera=`openssl verify -CAfile cacert.pem clientcert$i.crt`
#    if [[ "$provjera" =~ "OK" ]]; then
#        echo "Sertifikat $i JE VALIDAN"
#    fi
#done
