#!bin/bash

#openssl enc -d -base64 -in "potpis.txt" -out "potpis1.txt"
#
#openssl pkcs12 -in "cert.p12" -out "kljuc.pem" -nocerts -noenc -passin pass:sigurnost
#
ulazi=$(ls ./ | grep "ulaz")
algoritmi=$(openssl dgst -list)

for algoritam in $algoritmi; do
    for ulaz in $ulazi; do
        result=$(openssl dgst -"$algoritam" -prverify "kljuc.pem" -signature "potpis1.txt" "$ulaz" 2>/dev/null)
        echo "$result"
        if echo "$result" | grep "OK"; then
            echo "nadjeno: $ulaz" >> resenje.txt
        fi
    done
done
