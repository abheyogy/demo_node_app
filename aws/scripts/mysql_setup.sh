#!/bin/bash -
#===============================================================================
#
#          FILE: mysql_setup.sh
#
#         USAGE: ./mysql_setup.sh
#
#   DESCRIPTION: Setup MySQL container using Docker CLI
#
#        AUTHOR: Pranav Salunke <abheyogy@gmail.com>
#       CREATED: 17/12/21 12:04
#      REVISION: v0.0.1
#===============================================================================

set -o nounset                              # Treat unset variables as an error

#-------------------------------------------------------------------------------
# Global Vars
MYSQL_USER=root
MYSQL_PASS=adminpass
#-------------------------------------------------------------------------------
function setup_mysql {
  echo "Check if MySQL is accessible."
  mysqladmin -h 127.0.0.1 \
    -u$MYSQL_USER -p$MYSQL_PASS \
    processlist

  if [ $? -eq 0 ]; then
    echo "MySQL is accessible, populating data."
    CWD=$(dirname $0)
    mysql -h 127.0.0.1 \
      -u$MYSQL_USER -p$MYSQL_PASS \
      < $CWD/demo_app.sql

    echo "MySQL is not accessible, exiting ..."
    exit 2
  fi
}
#-------------------------------------------------------------------------------
echo "Starting MySQL Container."

# Start Docker MySQL Container
sudo docker run \
  --name demo-app-mysql \
  -e MYSQL_ROOT_PASSWORD=$MYSQL_PASS \
  -d -p 3306:3306 \
  mysql:5.7

# Wait for 2 minutes for MySQL to be up and running.
# TODO(pranav): Update this logic to be more graceful -- readiness probe?
echo "Waiting for 2 minutes to allow MySQL container to be up \
  and ready to serve traffic."
sleep 120

echo "Installing mysql-client."
#sudo apt update && sudo apt install -y mysql-client

# Check if the Docker container is in running state
STATUS=$(sudo docker inspect --format="{{.State.Running}}" demo-app-mysql)
if [ "$STATUS" == true ]; then
  # Check if MySQL can connect
  echo "MySQL container seems to be running, setting it up!"
  # If it connects, then setup the DB & users.
  setup_mysql
else
  echo "Error: Something went wrong, MySQL container seems to be not running ..."
  exit 1
fi
#-------------------------------------------------------------------------------
