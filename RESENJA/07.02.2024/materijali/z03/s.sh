#!bin/bash

datoteke=$(ls ./ | grep "jks")

#for datoteka in $datoteke; do
#
#    izlaz=$(echo "$datoteka" | sed 's/.jks//')
#    echo "$izlaz"
#
#    keytool -importkeystore -srckeystore "$datoteka" -srcstoretype JKS -destkeystore "$izlaz.p12" -deststoretype PKCS12 -srcstorepass sigurnost -deststorepass sigurnost
#
#done
#
#mkdir -p f
#
#datoteke2=$(ls ./ | grep "p12")
#
#for datoteka in $datoteke2; do
#    openssl pkcs12 -in "$datoteka" -out "f/$datoteka.pem" -passin pass:sigurnost -nocerts -nodes 2>/dev/null
#done
#

#openssl enc -d -base64 -in "envelopa.txt" -out "envelopa1.txt"

datoteke3=$(ls f/)

for datoteka in $datoteke3; do
    result=$(openssl rsautl -decrypt -inkey "f/$datoteka" -in "envelopa1.txt" 2>/dev/null)
    echo "datoteka: $datoteka , result : $result" >> "resenje.txt"
done

#datoteka: keystore47.p12.pem , result : USPJESNO STE OTKLJUCALI ENVELOPU!
