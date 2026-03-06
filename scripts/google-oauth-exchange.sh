#!/bin/bash
# Exchange authorization code for refresh token

AUTH_CODE="$1"

if [ -z "$AUTH_CODE" ]; then
    echo "Usage: $0 'authorization_code_from_google'"
    exit 1
fi

WORKSPACE="/root/.openclaw/workspace"
cd "$WORKSPACE"

# Read credentials
CLIENT_ID=$(jq -r '.installed.client_id' .secrets/gmail_credentials.json)
CLIENT_SECRET=$(jq -r '.installed.client_secret' .secrets/gmail_credentials.json)

echo "Exchanging authorization code for tokens..."

# Exchange code for tokens
RESPONSE=$(curl -s -X POST https://oauth2.googleapis.com/token \
    -H "Content-Type: application/x-www-form-urlencoded" \
    -d "code=$AUTH_CODE" \
    -d "client_id=$CLIENT_ID" \
    -d "client_secret=$CLIENT_SECRET" \
    -d "redirect_uri=urn:ietf:wg:oauth:2.0:oob" \
    -d "grant_type=authorization_code")

# Extract tokens
REFRESH_TOKEN=$(echo "$RESPONSE" | jq -r '.refresh_token')
ACCESS_TOKEN=$(echo "$RESPONSE" | jq -r '.access_token')

if [ -n "$REFRESH_TOKEN" ] && [ "$REFRESH_TOKEN" != "null" ]; then
    echo ""
    echo "========================================="
    echo "SUCCESS! Tokens received."
    echo "========================================="
    echo ""
    
    # Save to .env
    if ! grep -q "GOOGLE_REFRESH_TOKEN" .env 2>/dev/null; then
        echo "GOOGLE_REFRESH_TOKEN=$REFRESH_TOKEN" >> .env
        echo "Added GOOGLE_REFRESH_TOKEN to .env"
    else
        # Update existing
        sed -i "s/GOOGLE_REFRESH_TOKEN=.*/GOOGLE_REFRESH_TOKEN=$REFRESH_TOKEN/" .env
        echo "Updated GOOGLE_REFRESH_TOKEN in .env"
    fi
    
    echo ""
    echo "Your Google integration is now active!"
    echo "Test with: 'Check my Gmail inbox'"
    
else
    echo "Error: No refresh token received"
    echo "Response: $RESPONSE"
    exit 1
fi
