#!/bin/bash
# Upload file to Dropbox
# Usage: dbx-upload.sh <local-file> <dropbox-path>

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

LOCAL_FILE="$1"
DROPBOX_PATH="$2"

curl -s -X POST https://content.dropboxapi.com/2/files/upload \
    --header "Authorization: Bearer $ACCESS_TOKEN" \
    --header "Content-Type: application/octet-stream" \
    --header "Dropbox-API-Arg: {\"path\": \"$DROPBOX_PATH\", \"mode\": \"overwrite\", \"autorename\": false}" \
    --data-binary @"$LOCAL_FILE"
