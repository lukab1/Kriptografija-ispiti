#!/bin/bash

myKeyModulus=$(openssl rsa -in "client.key" -modulus -noout)

sertifikati=$(ls ./ | grep "crt")

for sertifikat in $sertifikati; do

    sertModulus=$(openssl x509 -in "$sertifikat" -modulus -noout)

    if [[ "$myKeyModulus" = "$sertModulus" ]]; then

        echo "$sertifikat" >> resenje.txt
    fi


done
#
#client24.crt

mkdir -p folder 

#kopirati ca.crt, client.key i client24.crt u folder
cp ca.crt client.key client24.crt folder

openssl pkcs12 -export -in "folder/client24.crt" -out "folder/client24.p12" -inkey "folder/client.key" -certfile "folder/ca.crt"

#dopisati samo password, kad zatrazi u terminalu, npr. sigurnost

#poslije ovoga, importovati sertifikat u web browser, ako je uspjesno, izaci ce prozor sa potvrdom (prof hostuje tomcat server...)
