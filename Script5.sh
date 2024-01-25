#!/bin/bash

length=$1
uppercase=false
lowercase=false
digits=false
special=false

while [[ $# -gt 0 ]]
do
    key="$1"

    case $key in
        -u|--uppercase)
            uppercase=true
            shift
            ;;
        -l|--lowercase)
            lowercase=true
            shift
            ;;
        -d|--digits)
            digits=true
            shift
            ;;
        -s|--special)
            special=true
            shift
            ;; *)
            shift
            ;;
    esac
done

if ! $uppercase && ! $lowercase && ! $digits && ! $special; then
    echo "At least one complexity option must be specified."
    exit 1
fi

chars=''
if $uppercase; then
    chars+='A-Z'
fi
if $lowercase; then
    chars+='a-z'
fi
if $digits; then
    chars+='0-9'
fi
if $special; then
    chars+='!@#$%^&*()'
fi
password=$( tr -dc "$chars" < /dev/urandom |head -c $length )

echo "Generated password: $password"
