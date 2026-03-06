#!/bin/bash
# Check if Dropbox token is valid, refresh if needed
# Returns 0 if token is valid or was refreshed successfully

WORKSPACE="/root/.openclaw/workspace"
ENV_FILE="$WORKSPACE/.env"

# Source the env file
source "$ENV_FILE"

# Test if current token works
TEST_RESPONSE=$(curl -s -X POST https://api.dropboxapi.com/2/users/get_current_account \
    --header "Authorization: Bearer $DROPBOX_TOKEN" \
    --header "Content-Type: application/json" \
    --data 'null')

# Check if token is expired
if echo "$TEST_RESPONSE" | grep -q "expired_access_token"; then
    echo "Token expired, refreshing..."
    
    # Check if we have a refresh token
    if grep -q "DROPBOX_REFRESH_TOKEN" "$ENV_FILE" 2>/dev/null; then
        # Refresh the token
        bash "$WORKSPACE/scripts/dropbox-refresh-token.sh"
        if [ $? -eq 0 ]; then
            # Re-source the env file to get new token
            source "$ENV_FILE"
            exit 0
        else
            exit 1
        fi
    else
        echo "Error: Token expired and no refresh token available"
        echo "Please run: ./scripts/dropbox-refresh-setup.sh"
        exit 1
    fi
elif echo "$TEST_RESPONSE" | grep -q "invalid_access_token"; then
    echo "Error: Invalid access token"
    exit 1
else
    # Token is valid
    exit 0
fi