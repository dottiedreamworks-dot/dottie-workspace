#!/bin/bash
# Dropbox Upload Script
# Usage: ./dbx-upload.sh <local-file> <remote-path>

# Load environment variables
export $(grep -v '^#' /root/.openclaw/workspace/.env | xargs)

# Get fresh access token
ACCESS_TOKEN=$(curl -s -X POST https://api.dropboxapi.com/oauth2/token \
  -d grant_type=refresh_token \
  -d refresh_token="$DROPBOX_REFRESH_TOKEN" \
  -d client_id="$DROPBOX_CLIENT_ID" \
  -d client_secret="$DROPBOX_CLIENT_SECRET" | python3 -c "import sys,json; print(json.load(sys.stdin).get('access_token',''))")

if [ -z "$ACCESS_TOKEN" ]; then
    echo "Error: Could not get access token"
    exit 1
fi

LOCAL_FILE="$1"
REMOTE_PATH="$2"

if [ ! -f "$LOCAL_FILE" ]; then
    echo "Error: Local file not found: $LOCAL_FILE"
    exit 1
fi

# Upload to Dropbox
curl -X POST https://content.dropboxapi.com/2/files/upload \
  -H "Authorization: Bearer $ACCESS_TOKEN" \
  -H "Content-Type: application/octet-stream" \
  -H "Dropbox-API-Arg: {\"path\": \"$REMOTE_PATH\", \"mode\": \"overwrite\", \"autorename\": false}" \
  --data-binary @"$LOCAL_FILE"

echo ""
echo "Uploaded: $LOCAL_FILE -> $REMOTE_PATH"
