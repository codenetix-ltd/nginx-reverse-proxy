#!/bin/bash

set -e

for VH in `env | grep "VH_"`; do
    ENV=`echo $VH | awk -F "=" '{print $1}'`
    HOST=`echo $ENV | awk -F "_" '{print $2}'`
    TO_HOST=`echo $VH | awk -F "=" '{print $2}'`
    echo "server {listen 80; server_name $HOST; location / { proxy_pass $TO_HOST; } }" > /etc/nginx/conf.d/$HOST.conf
done;

echo "`env`" > /tmp/12312.txt

exec "$@"
