#!/bin/bash
sudo amazon-linux-extras enable nginx1.12
sudo yum -y install nginx
sudo systemctl start nginx
echo "<html><h1>This is Test Web Server</h1></html>" > /usr/share/nginx/html/index.html