#!/bin/bash
wget https://repo.percona.com/apt/percona-release_latest.$(lsb_release -sc)_all.deb
echo "run sudo dpkg -i .deb-file"
