#!/bin/bash

# Function to get the value from a nested JSON object based on a key
get_value_from_json() {
local json="$1"
local key="$2"

local value=$(echo "$json" | jq -r ".$key")

echo "$value"
}

# Example usage
nested_object='{
"person": {
"name": "Abhishek",
"age": 30,
"address": {
"street": "123",
"city": "Bangalore",
"state": "Karnataka"
}
}
}'

key="person.address.city"

result=$(get_value_from_json "$nested_object" "$key")
echo "Value for key '$key': $result"
