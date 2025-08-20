#!/bin/bash 
sudo percona-release enable psmdb-70 release
sudo apt update
sudo apt install percona-server-mongodb
sudo systemctl start mongod
sudo systemctl enable mongod
sudo systemctl status mongod
