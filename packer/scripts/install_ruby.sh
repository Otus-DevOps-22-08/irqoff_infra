#!/bin/bash

apt update
apt install -y ruby-full ruby-bundler build-essential apt-transport-https || { sleep 60; apt install -y ruby-full ruby-bundler build-essential apt-transport-https; }
