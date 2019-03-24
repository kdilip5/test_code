#!/bin/bash
#To get the certificate file

find . -name "*.cert" -o -name '*.pki' -o -name '*.jks' >> cert_file_path.txt

filename="cert_file_path.txt"

#While loop to read line by line
while read -r line
do
    readLine=$line
    #If the line starts with ST then echo the line
    if [[ $readLine == .cert* ]] ; then
        echo "$readLine"
        read line
        readLine=$line
        openssl x509 -enddate -noout -in $readLine
        if [[ $readLine = ubuntu* ]] ; then
            echo "$readLine"
        fi
    fi
done < "$filename"
