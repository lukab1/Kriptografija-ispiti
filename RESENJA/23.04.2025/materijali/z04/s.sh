#!bin/bash

#openssl enc -d -base64 -in "envelopa.txt" -out "envelopa1.txt"

jks_datoteke=$(ls ./ | grep "jks")

mkdir -p f
#
#for datoteka in $jks_datoteke; do
#    izlaz=$(echo "$datoteka" | sed 's/jks/p12/')
#    keytool -importkeystore -srckeystore "$datoteka" -srcstoretype JKS -destkeystore "f/$izlaz" -deststoretype PKCS12 -deststorepass sigurnost -srcstorepass sigurnost
#done

mkdir -p f/a

#datoteke=$(ls f/ | grep "p12")
#
#for datoteka in $datoteke; do
#    openssl pkcs12 -in "f/$datoteka" -out "f/a/$datoteka.pem" -passin pass:sigurnost -noenc -nocerts
#done
#
mkdir -p f/a/b

#kljucevi=$(ls f/a/ | grep "pem")
#
#for kljuc in $kljucevi; do
#    openssl rsa -in "f/a/$kljuc" -out "f/a/b/pub_$kljuc" -pubout
#done

klucevi2=$(ls f/a | grep "pem")

for kljuc in $klucevi2; do
    echo $kljuc
    result=$(openssl rsautl -decrypt -inkey "f/a/$kljuc" -in "envelopa1.txt")
    echo "$result" >> resenja.txt
done


#OVO JE SKRIVENI TEKST VEZAN ZA JEDAN ISPITNI ZADATAK
