#!bin/bash

#datoteke=$(ls ./ | grep "jks")
#
#for datoteka in $datoteke; do
#    izlaz=$(echo "$datoteka" | sed 's/.jks//')
#    keytool -importkeystore -srckeystore "$datoteka" -srcstoretype JKS -destkeystore "$izlaz.p12" -deststoretype PKCS12 -srcstorepass sigurnost -deststorepass sigurnost
#done
#
#datoteke2=$(ls ./ | grep "p12")
#
#mkdir -p f
#
#for datoteka in $datoteke2; do
#    openssl pkcs12 -in "$datoteka" -out "f/$datoteka.pem" -nocerts -passin pass:sigurnost -nodes
#done
#
#

kljucevi=$(ls f/)

for kljuc in $kljucevi; do
    result=$(openssl rsautl -decrypt -inkey "f/$kljuc" -in "envelopa1.txt")
    echo "kljuc: $kljuc  , rezultat : $result" >> resenja.txt
done

#kljuc: keystore19.p12.pem  , rezultat : USPJESNO STE OTKLJUCALI ENVELOPU!
