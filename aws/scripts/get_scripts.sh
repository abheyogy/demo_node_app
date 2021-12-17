#!/bin/bash

# Fetch all the scripts ...

for i in demo_app.sql get_scripts.sh mysql_setup.sh setup_demoapp.sh setup_docker.sh; do
  curl -O https://raw.githubusercontent.com/abheyogy/demo_node_app/main/aws/scripts/$i;
done

# Save script location /tmp
echo $0 > /tmp/userdata_script
