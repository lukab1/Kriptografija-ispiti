#!bin/bash

mkdir -p f
mkdir -p fa

stores=$(ls ./ | grep "store")

for store in $stores;do
    openssl pkcs12 -in "$store" -out "f/$store.pem" -passin pass:sigurnost -nocerts -nodes 2>/dev/null
done

keys=$(ls f/ | grep ".pem")

for key in $keys;do
#    echo "$key"
    openssl rsautl -decrypt -inkey "f/$key" -in "envelopa.txt" -out "fa/$key.txt" 2>/dev/null
    echo "fa/$key.txt: $(cat fa/$key.txt)"
    echo 
done

#fa/store45.p12.pem.txt: Ajmo sad četvrti :).

