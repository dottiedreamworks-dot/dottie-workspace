#!/bin/bash
# Dropbox OAuth Setup with Refresh Token
# This script handles the full OAuth flow to get a long-lived refresh token

WORKSPACE="/root/.openclaw/workspace"
SECRETS_DIR="$WORKSPACE/.secrets"
ENV_FILE="$WORKSPACE/.env"

echo "========================================="
echo "Dropbox OAuth Refresh Token Setup"
echo "========================================="
echo ""

# Check for credentials
if [ ! -f "$SECRETS_DIR/dropbox_credentials.json" ]; then
    echo "Error: Dropbox app credentials not found"
    echo "Please ensure you have created a Dropbox app and have the credentials"
    exit 1
fi

# Read app key and secret
APP_KEY=$(jq -r '.installed.client_id' "$SECRETS_DIR/dropbox_credentials.json" 2>/dev/null)
APP_SECRET=$(jq -r '.installed.client_secret' "$SECRETS_DIR/dropbox_credentials.json" 2>/dev/null)

if [ -z "$APP_KEY" ] || [ "$APP_KEY" = "null" ]; then
    echo "Error: Could not read app credentials"
    exit 1
fi

echo "App Key: ${APP_KEY:0:20}..."
echo ""

# Build authorization URL with offline token access
AUTH_URL="https://www.dropbox.com/oauth2/authorize?client_id=$APP_KEY&response_type=code&token_access_type=offline"

echo "Step 1: Open this URL in your browser:"
echo ""
echo "$AUTH_URL"
echo ""
echo "Step 2: Sign in with your Dropbox account"
echo "Step 3: Click 'Allow' to authorize the app"
echo "Step 4: Copy the authorization code that appears"
echo ""
echo "Step 5: Run the exchange script:"
echo "   ./scripts/dropbox-refresh-exchange.sh 'YOUR_AUTH_CODE'"
echo ""

# Try to open browser if available
if command -v xdg-open &> /dev/null; then
    xdg-open "$AUTH_URL" &
elif command -v open &> /dev/null; then
    open "$AUTH_URL" &
fi