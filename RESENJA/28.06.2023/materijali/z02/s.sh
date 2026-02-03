#!usr/bin/env bash

for i in {1..20};do
    openssl enc -d -base64 -in "potpis$i.sign" -out "dec_potpis$i.sign" 
done


for i in {1..70}
do
    for j in {1..20};do
    var=$(openssl dgst -sha1 -verify "key$i.key" -signature "dec_potpis$j.sign" ulaz.txt 2>/dev/null)
    echo "$var"
    if echo "$var" | grep -qi "ok";then
        echo "key$i.key i potpis$j.sign" > fajl.txt
        break;
    fi
    done
done

for i in {1..70}
do
    for j in {1..20};do
    var=$(openssl dgst -sha1 -prverify "key$i.key" -signature "dec_potpis$j.sign" ulaz.txt 2>/dev/null)
    echo "$var"
    if echo "$var" | grep -qi "ok";then
        echo "key$i.key i potpis$j.sign" > fajl.txt
        break
    fi
    done
done

#key65.key i potpis13.sign
