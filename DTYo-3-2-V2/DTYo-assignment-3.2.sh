#!/bin/sh
##################################
#
# Bash script for DTYo Activity 3.2
# Azure Blob Create Web site.
# M Shaunnessey Apr 2020
#
#################################
#
# your storage account 
# your storage account
RES=NetworkWatcherRG  # Your resource group
STOR=tempdeletetyler  # Your storage account name
echo Storage $STOR
echo Group $RES
#  check that there is a storage account
echo Look for storage account
az storage account list
#
# Set the website properties
#
echo Set website params 
az storage blob service-properties update --account-name $STOR --static-website --404-document error.html --index-document index.html
# copy website files
az storage blob upload-batch -s ~/DTYo-3-2-V2 -d \$web --account-name $STOR --content-type 'text/html; charset=utf-8'
#
# Get the public URL

az storage account show -n $STOR -g $RES --query "primaryEndpoints.web" --output tsv

# Say Goodnight Gracie
#
