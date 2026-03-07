#!/bin/bash
# Check if Dropbox token is valid, refresh if needed
# Returns 0 if token is valid or was refreshed successfully

WORKSPACE="/root/.openclaw/workspace"
ENV_FILE="$WORKSPACE/.env"

# Source the env file
source "$ENV_FILE"

# Get fresh access token using refresh token
RESPONSE=$(curl -s -X POST https://api.dropboxapi.com/oauth2/token \
    --header "Content-Type: application/x-www-form-urlencoded" \
    --data-urlencode "refresh_token=$DROPBOX_REFRESH_TOKEN" \
    --data-urlencode "grant_type=refresh_token" \
    --data-urlencode "client_id=$DROPBOX_CLIENT_ID" \
    --data-urlencode "client_secret=$DROPBOX_CLIENT_SECRET")

# Extract new access token
NEW_ACCESS_TOKEN=$(echo "$RESPONSE" | grep -o '"access_token":"[^"]*"' | cut -d'"' -f4)

if [ -n "$NEW_ACCESS_TOKEN" ] && [ "$NEW_ACCESS_TOKEN" != "null" ]; then
    # Export for use by calling scripts
    export DROPBOX_TOKEN="$NEW_ACCESS_TOKEN"
    exit 0
else
    echo "Error: Failed to get access token"
    echo "Response: $RESPONSE"
    exit 1
fi
