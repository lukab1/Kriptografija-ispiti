#!usr/bin/env bash

my_hash=$(cat "t.txt")
my_salt="ulaz14.txt"
my_algo="-5"


for i in {1..50}
do
    my_file="ulaz$i.txt"
    curr_hash=$(openssl passwd -5 -salt "$my_salt" $my_file)
    echo "$curr_hash"
    if [[ "$curr_hash" == "$my_hash" ]]
    then
        echo "NADJENO $my_file"
    fi
done
