#!/bin/bash
######DEPENDENCIES
#NGINX
sudo apt update
sudo apt upgrade
sudo apt install nginx
sudo systemctl start nginx
sudo systemctl enable nginx

#NODE NPM
sudo apt install nodejs npm -y
node -v
npm -v

#percona mongodb
sudo percona-release enable psmdb-70 release
sudo apt update
sudo apt install percona-server-mongodb
sudo systemctl start mongod
sudo systemctl enable mongod
sudo systemctl status mongod

#PM2
sudo npm install pm2@latest -g

#certbot
sudo apt install certbot python3-certbot-nginx -y

######NEW USER
echo "To create a new user"
echo " enter user name"
read user
sudo adduser $user
sudo passwd $user
echo "creating a new folder in root directory /var/www/ having only accessed by $user and nginx....."
echo "enter folder name to be created as root directory for hosting"
read folder
sudo mkdir /var/www/$folder
sudo chown -R $user:$user /var/www/$folder
sudo chmod -R 770 /var/www/$folder
sudo usermod -a  -G $user www-data
groups $user 

######Upload Files
sudo su - $user
echo "enter git repo url"
read url
git clone $url project
cd project
