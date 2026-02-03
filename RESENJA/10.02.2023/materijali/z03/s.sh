#!bin/bash

kljucevi=$(ls ./ | grep "kljuc")
envelope=$(ls ./ | grep "env")
lozinke=$(ls ./ | grep "lozinka")

#for key in $kljucevi;do
#    for env in $envelope;do
#        echo "$key, $env"
#    done
#done

f1(){

for key in $kljucevi;do
    for env in $envelope;do
        result=$(openssl rsautl -decrypt -inkey "$key" -keyform PEM -in "$env" 2>/dev/null)
#        echo "$result"
        if [[ "$result" != "" ]];then
            echo -e "$key i $env"
            echo "key:$key , env: $env , result : $result" >> r2.txt
#            for pas in $lozinke;do
#                var=$(openssl enc -camellia-128-cfb -d -base64 -in "sifrat.txt" -k $pas -K $result  2>/dev/null)
#            if [[ "$var" != "" ]];then
#                echo -e "$var"
#            fi
#            done
#            break
        fi
    done
done

}

#key:kljuc15.key , env: env11.txt , result : lozinka15
#key:kljuc19.key , env: env19.txt , result : lozinka19
#key:kljuc2.key , env: env20.txt , result : lozinka2
#key:kljuc6.key , env: env6.txt , result : lozinka6
#key:kljuc9.key , env: env8.txt , result : lozinka9


lozinke2=("lozinka15" "lozinka19" "lozinka2" "lozinka6" "lozinka9")
for loz in ${lozinke2[*]};do
    echo "$loz"
    var=$(openssl enc -camellia-128-cfb -d -base64 -in "sifrat.txt" -k "$loz")
    echo -e "$var"
done

#lozinka9
#*** WARNING : deprecated key derivation used.
#Using -iter or -pbkdf2 would be better.
#Bravo, nasli ste rjesenje :).



#mkdir -p f
#
# Iteracija kroz svaki fajl u 'envelope', 'kljucevi', i 'lozinke'
#for env in $envelope; do
#    for key in $kljucevi; do
#        for pas in $lozinke; do
#            # Izvršenje openssl komande za dešifrovanje
#            output_file="f/d_$(basename $key)_$(basename $env)_$(basename $pas).txt"
#            openssl enc -d -camellia-128-cfb -in "$env" -out "$output_file" -pass file:"$pas" -keyfile "$key"
#            echo "Dešifrovanje $env sa ključem $key i lozinkom $pas završeno. Izlaz u $output_file"
#        done
#    done
#done
