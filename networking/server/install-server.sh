#!/usr/bin/env bash

#download, enable, and check status of nginx
apt update
apt install -y nginx
systemctl enable --now nginx