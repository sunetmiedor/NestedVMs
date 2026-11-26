#!/usr/bin/env bash

#get arguments
CHILD_USER="$1"
CHILD_IP="$2"

#install and enable openssh
apt update
apt install -y openssh-server
systemctl enable --now ssh

#generate ssh keys
if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
    ssh-keygen -t ed25519 -N "" -f "$HOME/.ssh/id_ed25519"
fi
ssh-copy-id $CHILD_USER@$CHILD_IP

#test connection
ssh -o BatchMode=yes $CHILD_USER@$CHILD_IP