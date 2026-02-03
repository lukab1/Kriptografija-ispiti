#!/bin/bash

mkdir -p sesijskiKljuceviDecrypt
algoritmi=$(openssl enc -list)

sesijskiKljucevi=$(ls SesijskiKljucevi/)

#for sesijskiKljuc in $sesijskiKljucevi;do
#
#    result=$(openssl rsautl -decrypt -inkey "Bob/bob.key" -in "SesijskiKljucevi/$sesijskiKljuc")
#
#    echo "$result" >> resenja.txt
#    echo >> resenja.txt
#
#
#done

alicePoruke=$(ls Alice/ | grep "poruka")

for poruka in $alicePoruke;do
    result=$(openssl enc -d -base64 -aes-192-ecb -k neporecivost -in "Bob/$poruka")
    echo "$result, poruka: $poruka" >> test2.txt
    echo >> test2.txt
done

#Hej Alice, neko je izgleda kompromitovao nas sesijski kljuc.
#Molim te posalji mi novi sesijski kljuc (proizvoljna rijec), ali tako da ga samo ja mogu procitati!, poruka: poruka22.txt

#Hej Bobe, posalji mi dokaz da je tvoj javni kljuc koji je u mom posjedu, zaista tvoj!
#Ti znas kako jedino to mozes dokazati!, poruka: poruka49.txt


#1. openssl rsautl -decrypt -inkey "Alice/alice.key" -in info.enc
#2. openssl enc -d -base64 -aes-192-ecb -k neporecivost -in Alice i Bob
#3. Vadjenje alice i bob javnih kljuceva
#4. echo neka rijec sesijki kljuc, potpisivanje njega javnim, dekripcija privatnim
#5. kreiranje dokaza, potpisivanje njega privanim, verifikacija javnim
