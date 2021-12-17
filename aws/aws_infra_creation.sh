#!/bin/bash -
#===============================================================================
#
#          FILE: aws_infra_creation.sh
#
#         USAGE: ./aws_infra_creation.sh
#
#   DESCRIPTION: Uses AWS CLI to automatically provision infra using CloudFormation
#
#        AUTHOR: Pranav Salunke <abheyogy@gmail.com>
#       CREATED: 17/12/21 17:19
#      REVISION: v0.0.1
#===============================================================================

set -o nounset                              # Treat unset variables as an error
CWD=$(dirname $0)

echo "Work in progess, this may not work."
aws cloudformation create-stack \
  --stack-name demo-app \
  --template-body file://${CWD}/cf_tmpl.yaml
