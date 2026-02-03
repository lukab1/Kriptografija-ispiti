#!usr/env/bin bash

fn1(){
algoritam="-aes-192-cbc"

for i in {1..250}
do
    openssl enc "$algoritam" -d -base64 -in "sifrat$i.txt" -out "dec/sifrat$i.txt" -k "sigurnost"
done
}

moj_hash=$(cat "otisak.hash")

algorithms=$(openssl dgst -list | grep -i "sha")

fn2(){
for i in {1..250}
do
    for algorithm in $algorithms
    do
        var=$(openssl dgst -"$algorithm" $(echo "dec/sifrat$i.txt") | sed 's/^[^=]*=//;s/ //' 2>/dev/null)
        if [[ "$var" == "$moj_hash" ]]
        then
            echo "sifrat$i.txt"
            break 2
        fi
    done
done
}

#fn1
fn2
