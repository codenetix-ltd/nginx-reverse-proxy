#!/bin/bash

set -e

for VH in `env | grep "VH_"`; do
    ENV=`echo $VH | awk -F "=" '{print $1}'`
    HOST=`echo $ENV | awk -F "_" '{print $2}'`
    TO_HOST=`echo $VH | awk -F "=" '{print $2}'`
    echo "server {listen 80; server_name $HOST; location / { proxy_pass $TO_HOST; } }" > /etc/nginx/vhosts.d/host-$HOST.conf
done;

for SET_HTTP in `env | grep "SET_HTTP_"`; do
    ENV=`echo $SET_HTTP | awk -F "=" '{print $1}'`
    VALUE=`echo $SET_HTTP | awk -F "=" '{print $2}'`
    echo "${ENV:9} $VALUE;" >> /etc/nginx/conf.d/http_vars.conf
done;

exec "$@"
