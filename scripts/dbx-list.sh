#!/bin/bash
# List Dropbox folder contents
# Usage: dbx-list.sh [path]

source "$(dirname "$0")/../.env"

# Get fresh access token
TOKEN_RESPONSE=$(curl -s -X POST https://api.dropboxapi.com/oauth2/token \
    --header "Content-Type: application/x-www-form-urlencoded" \
    --data-urlencode "refresh_token=$DROPBOX_REFRESH_TOKEN" \
    --data-urlencode "grant_type=refresh_token" \
    --data-urlencode "client_id=$DROPBOX_CLIENT_ID" \
    --data-urlencode "client_secret=$DROPBOX_CLIENT_SECRET")

ACCESS_TOKEN=$(echo "$TOKEN_RESPONSE" | grep -o '"access_token":"[^"]*"' | cut -d'"' -f4)

if [ -z "$ACCESS_TOKEN" ] || [ "$ACCESS_TOKEN" = "null" ]; then
    echo "Error: Failed to get access token"
    exit 1
fi

PATH_ARG="${1:-""}"

curl -s -X POST https://api.dropboxapi.com/2/files/list_folder \
    --header "Authorization: Bearer $ACCESS_TOKEN" \
    --header "Content-Type: application/json" \
    --data "{\"path\": \"$PATH_ARG\", \"recursive\": false, \"limit\": 100}" | \
    grep -o '"name":"[^"]*"' | cut -d'"' -f4
