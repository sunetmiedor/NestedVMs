#!/usr/bin/env bash

CONFIG_FILE="/etc/nginx/nginx.conf"

#add initial template to file
cat >> "$CONFIG_FILE" << EOF
server {
    listen 80;
    server_name [SERVER NAME];

    root /usr/share/nginx/html;
    index index.html;

EOF

#add child addresses recursively
while read -r name ip; do

    cat >> "$CONFIG_FILE" << EOF
    location /$name/ {
        proxy_pass http://$ip/;
    }

EOF

done < [PROJECT_DIRECTORY]/children.txt

#close pracket from server block
echo "}" >> "$CONFIG_FILE"

systemctl reload nginx