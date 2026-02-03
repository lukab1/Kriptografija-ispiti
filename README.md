# Kriptografija-ispiti

### Korisnike komande

storepass je uvijek ''sigurnost''

```bash
lozinke=$(ls ./ | grep "lozinka") - vraca niz imena fajlova iz trenutnog foldera koji imaju "lozinka" u imenu
```
U skriptama se rezultati najcesce cuvaju u varijablama umjesto fajlovima (komanda ''-out''):

```bash
result=$(openssl rsautl -decrypt -inkey "f/$kljuc" -in "sifrat1.txt")
```

Provjeravanje fajlova da li su u base64 formatu (mala i velika slova, brojevi, +,/,=)

```bash
cat "ime fajla"
```

Prebacivanje JKS->PKCS12 kada se trazi kljuc iz keystora.

```bash
keytool -importkeystore -srckeystore "$datoteka" -srcstoretype JKS -destkeystore "$izlaz.p12" -deststoretype PKCS12 -srcstorepass sigurnost -deststorepass sigurnost
```

Komanda sed

```bash
result=$(openssl dgst -"$algoritam" "$ulaz" | sed 's/[^=]*= //')

umjesto (SHA256)= 209574854390539
result je 209574854390539

's/[^=]*= //' - sve sto nije  '=' , znak '=' i space ' ' i zamijeni sa // (nisacim)
```

Pravljenje niza,
```bash
algorithms="-6 -5 -apr1 -1 -aixmd5"

Da bi se mogla koristiti komanda:

for algoritam in algorithms; do

done
```

Pravljenje niza aes algoritama:
```bash
algoritmi=$(openssl enc -list | grep -i "aes")
```

Verifikacija privatnim kljucem:

```bash
openssl dgst -"$algoritam" -prverify "kljuc.pem" -signature "potpis1.txt" "$ulaz" 2>/dev/null
```

Verifikacija javnim kljucem:

```bash
result=$(openssl dgst -verify "pub_kljuc.key" -signature "potpis.txt" "$ulaz")
    if echo "$result" | grep "OK"; then
        echo "ulaz: $ulaz" >> resenja.txt
    fi

Ove komande, ako je nadjen potpis vracaju 'OK verified'

```

Uporedjivanje stringa iz varijable i stringa iz fajla

```bash
if [[ "$result" == $(cat "f/$otisak") ]]; then
    echo "otisak: $otisak" >> resenje.txt
fi
```

Trazenje jedinog sertifikata koji mozemo koristiti i za serversku i klijentsku autentikaciju

```bash
#!/bin/bash

storovi=$(ls ./ | grep "p12")

for store in $storovi; do
    result=$(keytool -list -v -keystore "$store" -storepass sigurnost)
    if ! echo "$result" | grep "ExtendedKeyUsage";then
        continue
    fi

    if ! echo "$result" | grep "serverAuth" || ! echo "$result" | grep "clientAuth"; then
        continue
    else
        echo "$store" > resenje.txt
    fi 
done
```

Uporedjivanje kljuceva : 
(22.01.2025)
```bash
#!/bin/bash

kljucevi=$(ls ./ | grep "kljuc")
mojKljuc=$(openssl rsa -in "folder/mojKljuc.key" -noout -modulus)


for kljuc in $kljucevi; do
    val1=$(openssl rsa -in $kljuc -noout -modulus)
    if [[ "$val1" = "$mojKljuc" ]]; then
        echo "$kljuc" >> resenje.txt
        break;
    fi
done
```

Komanda awk

```bash
gdje je ulaz=$apr1$ABCDEFGH$wU73ZKY2kJAHJKi/DEMrI0

algoritam=$(cat "$ulaz" | awk -F'$' '{print $2}') -ovo je apr1
salt=$(cat "$ulaz" | awk -F'$' '{print $3}') - ovo je ABCDEFGH

```

Za zadatke sa ca, sertifikatima...:

```bash

mkdir {certs,newcerts,private,requests,crl}
touch {serial,crlnumber,index.txt}

serial je hex, ako trazi da je sertifikat 0xb1, znaci echo b1 > serial

[usr_cert] sam mijenjao za sertifikate

Ako treba ca na osnovu openssl.cnf i kljuc40.key, preimenovati kljuc40,key na private/private4096.key ili u openssl.cnf staviti kljuc40.key

openssl req -new -x509 -out ca.pem -key private/kljuc40.key -config openssl.cnf

openssl genrsa -out private/s1.key 2048

openssl req -new -out requests/s1.csr -key private/s1.key -config openssl.cnf

openssl ca -in private/s1.csr -out s1.crt -config openssl.cnf -days 60

```