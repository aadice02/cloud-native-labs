#!/bin/bash


VMNAME=$3
RESOURCEGROUPNAME=$2
# Get the instance metadata
metadata=$(az vm show -d --name $VMNAME  --resource-group $RESOURCEGROUPNAME --output json)

# Function to retrieve value for a specific data key
get_value() {
key=$1
value=$(echo "$metadata" | jq -r ".$key")
echo "$value"
}

# Output the metadata in JSON format
#echo "$metadata" | jq .

# Retrieve a specific data key value if provided
if [ -n "$1" ]; then
key_value=$(get_value "$1")
if [ "$key_value" == "null" ]; then
echo "Data key '$1' not found."
else
echo "Value for data key '$1': $key_value"
fi
fi
# Output the metadata in JSON format
#echo $metadata | jq .
