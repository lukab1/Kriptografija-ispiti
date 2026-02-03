#!/bin/bash


KEYSTORE_PASS="sigurnost"

for ks in *.jks; do
    echo "[*] Proveravam $ks"

    # Izlistaj sve entry-je
    entries=$(keytool -list -v -keystore "$ks" -storepass "$KEYSTORE_PASS" 2>/dev/null)

    # Mora postojati PrivateKeyEntry
    if ! echo "$entries" | grep -q "Entry type: PrivateKeyEntry"; then
        continue
    fi

    # I serverAuth i clientAuth moraju postojati
    if echo "$entries" | grep -q "ExtendedKeyUsage" && \
       echo "$entries" | grep -q "serverAuth" && \
       echo "$entries" | grep -q "clientAuth"; then
        echo "✅ OVO JE TRAŽENI JKS: $ks"
        exit 0
    fi
done

echo "❌ Nije pronađen odgovarajući JKS"

