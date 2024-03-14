#!/bin/bash

# adding repository and installing nginx		
apt update
apt install nginx -y
cat <<EOF > vproapp
upstream vproapp {
  server appserver.com:8080;
}
server {
  listen 80;
location / {
  proxy_pass http://vproapp;
}
}
EOF

mv vproapp /etc/nginx/sites-available/vproapp
rm -rf /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/vproapp /etc/nginx/sites-enabled/vproapp

#starting nginx service and firewall
systemctl start nginx
systemctl enable nginx
systemctl restart nginx