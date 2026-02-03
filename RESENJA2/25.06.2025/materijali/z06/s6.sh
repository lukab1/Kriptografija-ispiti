#!/bin/bash

mkdir {certs,newcerts,requests,private,crl}

touch {crlnumber,serial,index.txt}

#promeniti u openssl.cnf liniju private_key	= $dir/private/private4096.key	# The private key
# u $dir/private/rootca.key
