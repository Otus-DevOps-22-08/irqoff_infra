#!/bin/bash

apt -y install git
useradd -m -s /bin/bash appuser
echo "appuser ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
cd /home/appuser && sudo -u appuser git clone -b monolith https://github.com/express42/reddit.git
cd reddit && sudo -u appuser bundle install --no-cache
cp /tmp/reddit.service /etc/systemd/system/reddit.service
systemctl daemon-reload
systemctl enable reddit
