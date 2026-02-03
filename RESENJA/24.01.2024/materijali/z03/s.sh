#!bin/bash

algoritmi=$(openssl dgst -list)
otisci=$(ls f/)
ulazi=$(ls ./ | grep "ulaz")

for algo in $algoritmi; do
    for ulaz in $ulazi; do
        result=$(openssl dgst -"$algo" "$ulaz" | sed 's/[^=]*= //' 2>/dev/null)
        for otisak in $otisci; do
            if [[ "$result" = "$(cat "$otisak")" ]]; then
                echo "otisak: $otisak , datoteka: $ulaz" >> resenje.txt
            fi
        done
    done
done

#otisak: otisak4.txt , datoteka: ulaz41.txt
#otisak: otisak3.txt , datoteka: ulaz1.txt
