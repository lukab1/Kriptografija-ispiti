#!/bin/bash

stores=$(ls ./ | grep "store")
mkdir -p keys

for store in $stores;do
    openssl pkcs12 -in $store -noenc -nocerts -passin pass:sigurnost -out "keys/$store.private.key"
done

mkdir -p pub_keys

privKeys=$(ls keys/ | grep "key")

for privKey in $privKeys;do
    result=$(openssl rsa -in "keys/$privKey" -pubout)

    if [[ "$result" = "$(cat "envelopa_pub_key.key")" ]]; then
        echo "$privKey" >> resenje.txt
        break
    fi


done

#store50.p12.private.key
