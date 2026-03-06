#!/bin/bash
# Exchange authorization code for refresh token
# Usage: ./dropbox-refresh-exchange.sh 'authorization_code'

AUTH_CODE="$1"

if [ -z "$AUTH_CODE" ]; then
    echo "Usage: $0 'authorization_code_from_dropbox'"
    echo ""
    echo "Get the code by running: ./dropbox-refresh-setup.sh"
    exit 1
fi

WORKSPACE="/root/.openclaw/workspace"
SECRETS_DIR="$WORKSPACE/.secrets"
ENV_FILE="$WORKSPACE/.env"

echo "Exchanging authorization code for tokens..."

# Read app credentials
APP_KEY=$(jq -r '.installed.client_id' "$SECRETS_DIR/dropbox_credentials.json" 2>/dev/null)
APP_SECRET=$(jq -r '.installed.client_secret' "$SECRETS_DIR/dropbox_credentials.json" 2>/dev/null)

# Exchange code for tokens
RESPONSE=$(curl -s -X POST https://api.dropboxapi.com/oauth2/token \
    --header "Content-Type: application/x-www-form-urlencoded" \
    --data-urlencode "code=$AUTH_CODE" \
    --data-urlencode "grant_type=authorization_code" \
    --data-urlencode "client_id=$APP_KEY" \
    --data-urlencode "client_secret=$APP_SECRET")

# Extract tokens
REFRESH_TOKEN=$(echo "$RESPONSE" | jq -r '.refresh_token')
ACCESS_TOKEN=$(echo "$RESPONSE" | jq -r '.access_token')
EXPIRES_IN=$(echo "$RESPONSE" | jq -r '.expires_in')

if [ -n "$REFRESH_TOKEN" ] && [ "$REFRESH_TOKEN" != "null" ]; then
    echo ""
    echo "========================================="
    echo "SUCCESS! Refresh token obtained."
    echo "========================================="
    echo ""
    
    # Save refresh token to .env
    if grep -q "DROPBOX_REFRESH_TOKEN" "$ENV_FILE" 2>/dev/null; then
        # Update existing
        sed -i "s/DROPBOX_REFRESH_TOKEN=.*/DROPBOX_REFRESH_TOKEN=$REFRESH_TOKEN/" "$ENV_FILE"
        echo "Updated DROPBOX_REFRESH_TOKEN in .env"
    else
        # Add new
        echo "DROPBOX_REFRESH_TOKEN=$REFRESH_TOKEN" >> "$ENV_FILE"
        echo "Added DROPBOX_REFRESH_TOKEN to .env"
    fi
    
    # Also save current access token
    if grep -q "DROPBOX_TOKEN" "$ENV_FILE" 2>/dev/null; then
        sed -i "s/DROPBOX_TOKEN=.*/DROPBOX_TOKEN=$ACCESS_TOKEN/" "$ENV_FILE"
    else
        echo "DROPBOX_TOKEN=$ACCESS_TOKEN" >> "$ENV_FILE"
    fi
    
    echo ""
    echo "Access token expires in: $EXPIRES_IN seconds"
    echo "Refresh token is long-lived (does not expire)"
    echo ""
    echo "Your Dropbox integration is now set up with automatic token refresh!"
    echo ""
    echo "Test with: ./scripts/dbx-list.sh ''"
    
else
    echo "Error: No refresh token received"
    echo "Response: $RESPONSE"
    exit 1
fi