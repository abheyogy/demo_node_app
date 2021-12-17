#!/bin/bash -
#===============================================================================
#
#          FILE: setup_demoapp.sh
#
#         USAGE: ./setup_demoapp.sh
#
#   DESCRIPTION: Start the demo application.
#
#        AUTHOR: Pranav Salunke <abheyogy@gmail.com>
#       CREATED: 17/12/21 12:04
#      REVISION: v0.0.1
#===============================================================================

set -o nounset                              # Treat unset variables as an error

#-------------------------------------------------------------------------------
echo "Start demo node application."
sudo docker run \
  --name demo-node-app \
  -d -p 5000:5000 \
  abheyogy/demo_node_app:latest
echo "Demo Application container has been started."
#-------------------------------------------------------------------------------
