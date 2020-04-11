#!/bin/bash
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <port number>"
    exit 1
fi

#check php installation
dpkg -s php &> /dev/null
if [ $? -ne 0 ]; then
    echo "Will install php"
    apt update && apt install php -y
fi

#check php-xml installation
dpkg -s php-xml &> /dev/null
if [ $? -ne 0 ]; then
    echo "Will install php-xml"
    apt update && apt install php-xml -y
fi

PORT=$1
php -S 0.0.0.0:$PORT
