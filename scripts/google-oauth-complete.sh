#!/bin/bash
# Complete Google OAuth Setup
# This script finishes the OAuth flow started previously

WORKSPACE="/root/.openclaw/workspace"
cd "$WORKSPACE"

if [ -f "gmail_credentials.json" ]; then
    echo "Found gmail_credentials.json"
    
    # Check if curl is available
    if ! command -v curl &> /dev/null; then
        echo "curl is required but not installed"
        exit 1
    fi
    
    # Extract client credentials
    CLIENT_ID=$(jq -r '.installed.client_id' gmail_credentials.json 2>/dev/null)
    CLIENT_SECRET=$(jq -r '.installed.client_secret' gmail_credentials.json 2>/dev/null)
    
    if [ -z "$CLIENT_ID" ] || [ "$CLIENT_ID" = "null" ]; then
        echo "Error: Could not extract client_id from credentials"
        exit 1
    fi
    
    echo "Client ID: ${CLIENT_ID:0:30}..."
    
    # Build authorization URL
    AUTH_URL="https://accounts.google.com/o/oauth2/v2/auth?client_id=$CLIENT_ID&redirect_uri=urn:ietf:wg:oauth:2.0:oob&scope=https://www.googleapis.com/auth/gmail.readonly%20https://www.googleapis.com/auth/calendar.readonly%20https://www.googleapis.com/auth/drive.readonly&response_type=code&access_type=offline&prompt=consent"
    
    echo ""
    echo "========================================="
    echo "GOOGLE OAUTH SETUP REQUIRED"
    echo "========================================="
    echo ""
    echo "1. Open this URL in your browser:"
    echo ""
    echo "$AUTH_URL"
    echo ""
    echo "2. Sign in with your Google account"
    echo "3. Click 'Advanced' → 'Go to OpenClaw Dottie (unsafe)'"
    echo "4. Grant permissions for Gmail, Calendar, Drive"
    echo "5. Copy the authorization code that appears"
    echo ""
    echo "6. Then run:"
    echo "   ./scripts/google-oauth-exchange.sh 'YOUR_AUTH_CODE'"
    echo ""
    
    # Try to open browser if available
    if command -v xdg-open &> /dev/null; then
        xdg-open "$AUTH_URL" &
    elif command -v open &> /dev/null; then
        open "$AUTH_URL" &
    fi
    
else
    echo "Error: gmail_credentials.json not found"
    echo "Please download your OAuth credentials from Google Cloud Console"
    exit 1
fi
