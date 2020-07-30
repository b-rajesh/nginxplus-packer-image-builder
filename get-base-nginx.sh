#!/bin/bash
rm -rf base-nginx-plus/
git clone https://github.com/b-rajesh/diy-nginx-plus-api-gateway.git base-nginx-plus
sleep 5
cp nginx-repo.crt nginx-repo.key base-nginx-plus/etc/ssl/nginx/