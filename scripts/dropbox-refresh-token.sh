#!/bin/bash
# Refresh Dropbox access token using refresh token
# This script gets a new access token when the current one expires

WORKSPACE="/root/.openclaw/workspace"
SECRETS_DIR="$WORKSPACE/.secrets"
ENV_FILE="$WORKSPACE/.env"

# Check if refresh token exists
if ! grep -q "DROPBOX_REFRESH_TOKEN" "$ENV_FILE" 2>/dev/null; then
    echo "Error: No refresh token found in .env"
    echo "Please run: ./scripts/dropbox-refresh-setup.sh"
    exit 1
fi

# Read refresh token and app credentials
REFRESH_TOKEN=$(grep "DROPBOX_REFRESH_TOKEN" "$ENV_FILE" | cut -d= -f2)
APP_KEY=$(jq -r '.installed.client_id' "$SECRETS_DIR/dropbox_credentials.json" 2>/dev/null)
APP_SECRET=$(jq -r '.installed.client_secret' "$SECRETS_DIR/dropbox_credentials.json" 2>/dev/null)

echo "Refreshing Dropbox access token..."

# Request new access token
RESPONSE=$(curl -s -X POST https://api.dropboxapi.com/oauth2/token \
    --header "Content-Type: application/x-www-form-urlencoded" \
    --data-urlencode "refresh_token=$REFRESH_TOKEN" \
    --data-urlencode "grant_type=refresh_token" \
    --data-urlencode "client_id=$APP_KEY" \
    --data-urlencode "client_secret=$APP_SECRET")

# Extract new access token
NEW_ACCESS_TOKEN=$(echo "$RESPONSE" | jq -r '.access_token')
EXPIRES_IN=$(echo "$RESPONSE" | jq -r '.expires_in')

if [ -n "$NEW_ACCESS_TOKEN" ] && [ "$NEW_ACCESS_TOKEN" != "null" ]; then
    # Update access token in .env
    sed -i "s/DROPBOX_TOKEN=.*/DROPBOX_TOKEN=$NEW_ACCESS_TOKEN/" "$ENV_FILE"
    echo "Access token refreshed successfully (expires in $EXPIRES_IN seconds)"
    echo "New token: ${NEW_ACCESS_TOKEN:0:30}..."
else
    echo "Error: Failed to refresh token"
    echo "Response: $RESPONSE"
    exit 1
fi