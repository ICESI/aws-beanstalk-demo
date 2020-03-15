#!/bin/sh

set -e

# EB Version
VERSION=$(eb --version)
echo $VERSION

# Environment variables
ENVIRONMENT='pricehunters-integration-env'
APPLICATION_NAME='pricehunters'
REGION='us-east-1'
PROFILE='integration'
PLATFORM='python-3.6'

# Create init files
eb init -p $PLATFORM $APPLICATION_NAME --region $REGION --profile $PROFILE
eb init --profile $PROFILE

# Create environment
eb create $ENVIRONMENT --profile $PROFILE 

# Deploy new version
eb deploy --profile $PROFILE

# Open website
eb open --profile $PROFILE

# Delete environment
eb terminate $ENVIRONMENT --profile $PROFILE

# Save configuration
# eb config save --cfg my-app-v1
# eb config put my-app-v1
# eb create --cfg savedconfig
# eb config --cfg v1
# eb config
# eb setenv ENVVAR=TEST
# eb logs

# WSGIScriptAlias / /opt/python/current/app/application.py