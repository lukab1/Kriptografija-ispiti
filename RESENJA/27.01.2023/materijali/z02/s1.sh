#!usr/env/bin bash

fn1(){
for i in {1..3}
do
    openssl enc -d -base64 -in "otisak$i.txt" -out "dec_otisak$i.txt"
done
}

#fn1

#$apr1$lozinka1$NayNtGqjZ5FzvSulsQvaa
#$apr1$lozinka7$EneC7HhVrfMd5p6KWT8VT
#$apr1$wAgnh5WA$CyPYmkLRTzbSN1fIQROnu1





fn2(){

for i in {0..30}
do
    key1=$(openssl passwd -apr1 -salt "lozinka1" -in "lozinka$i.txt")
    key2=$(openssl passwd -apr1 -salt "lozinka7" -in "lozinka$i.txt")
    key3=$(openssl passwd -apr1 -salt "wAgnh5WA" -in "lozinka$i.txt")

    for j in {1..3}
    do
        if [[ "$key1" == "$(cat "dec_otisak$j.txt")" ]]
        then
        echo "kljuc$j je lozinka$i.txt" 
        elif [[ "$key2" == "$(cat "dec_otisak$j.txt")" ]]
        then
        echo "kljuc$j je lozinka$i.txt" 
        elif [[ "$key3" == "$(cat "dec_otisak$j.txt")" ]]
        then
        echo "kljuc$j je lozinka$i.txt" 
        fi
    done
done
}

#fn2

#kljuc2 je lozinka3.txt
#kljuc1 je lozinka18.txt
#kljuc3 je lozinka30.txt

fn3(){
    algoritmi=$(openssl enc -list | grep -i "aes.*256")
    for algo in $algoritmi
    do
#        openssl enc -$algo -d -base64 -in "sifrat.txt" -out "f/out_$algo\_1.txt" -k "lozinka30"
#        openssl enc -$algo -d -in "f/out_$algo\_1.txt" -out "f/out_$algo\_2.txt" -k "lozinka3"
#        openssl enc -$algo -d -in "f/out_$algo\_2.txt" -out "f/out_$algo\_3.txt" -k "lozinka18"

         var1=$(openssl enc -$algo -d -base64 -in "sifrat.txt" -k "lozinka30" 2>/dev/null)
         var2=$(openssl enc -$algo -d -in <(echo "$var1") -k "lozinka3" 2>/dev/null) 
         var3=$(openssl enc -$algo -d -in <(echo "$var2") -k "lozinka18" 2>/dev/null)
    
    echo "Algoritam: $algo , tekts: $var3"
    done
}

fn3


