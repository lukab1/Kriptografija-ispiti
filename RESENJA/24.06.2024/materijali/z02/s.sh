#!usr/env/bin bash
#
#for i in {1..3}
#do
#    echo $(openssl enc -d -base64 -in "otisak$i.txt")
#done

#$apr1$lozinka1$NayNtGqjZ5FzvSulsQvaa.
#$apr1$lozinka7$EneC7HhVrfMd5p6KWT8VT.
#$apr1$wAgnh5WA$CyPYmkLRTzbSN1fIQROnu1
#

lozinka1='$apr1$lozinka1$NayNtGqjZ5FzvSulsQvaa.'
lozinka2='$apr1$lozinka7$EneC7HhVrfMd5p6KWT8VT.'
lozinka3='$apr1$wAgnh5WA$CyPYmkLRTzbSN1fIQROnu1'

for i in {1..30}
do
    var=$(openssl passwd -apr1 -salt "lozinka1" $(cat "lozinka$i.txt"))
    var2=$(openssl passwd -apr1 -salt "lozinka7" $(cat "lozinka$i.txt"))
    var3=$(openssl passwd -apr1 -salt "wAgnh5WA" $(cat "lozinka$i.txt"))  
      
    if [[ "$var" == "$lozinka1" ]]
    then 
    echo "loznika1= $(cat "lozinka$i.txt")"
    fi

    if [[ "$var2" == "$lozinka2" ]]
    then 
    echo "loznika2= $(cat "lozinka$i.txt")"
    fi

    if [[ "$var3" == "$lozinka3" ]]
    then 
    echo "loznika3= $(cat "lozinka$i.txt")"
    fi
done

#loznika2= lozinka3
#loznika1= lozinka18
#loznika3= lozinka30
#


algoritmi=$(openssl enc -list | grep -i "aes[^d]*256")

for algo in $algoritmi
do  
    echo "$algo"
    a=$(openssl enc -$algo -d -base64 -in "sifrat.txt" -k "lozinka30" 2>/dev/null)
    b=$(echo "$a" | openssl enc -$algo -d -k "lozinka3" 2>/dev/null)
    c=$(echo "$b" | openssl enc -$algo -d -k "lozinka18" 2>/dev/null)

    echo "$algo, fajl: $c"
done
#a=$(openssl enc -d -base64 -in "sifrat.txt" )

#-aes-256-cbc, fajl: DANAS JE ISPIT IZ KRIPTOGRAFIJEa�3L��QO��:k�,


