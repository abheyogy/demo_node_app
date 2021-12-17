#!/bin/bash -
#===============================================================================
#
#          FILE: setup_docker.sh
#
#         USAGE: ./setup_docker.sh
#
#   DESCRIPTION: Install docker
#
#        AUTHOR: Pranav Salunke <abheyogy@gmail.com>
#       CREATED: 17/12/21 12:04
#      REVISION: v0.0.1
#===============================================================================

set -o nounset                              # Treat unset variables as an error

#-------------------------------------------------------------------------------
echo "Installing Docker"
sudo apt update
sudo apt install -y docker.io
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo usermod -a -G docker ubuntu
echo "Docker has been installed."
sleep 30
echo "Waiting for a few seconds before exiting ..."
#-------------------------------------------------------------------------------
