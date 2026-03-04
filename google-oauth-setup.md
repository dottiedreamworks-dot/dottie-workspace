# Google Workspace Integration Setup

## What We're Building
OAuth access to:
- Gmail (read emails, search)
- Google Calendar (read events, create reminders)
- (Optional) Google Drive (file access)

## Step 1: Create Google Cloud Project

1. Go to: https://console.cloud.google.com
2. Sign in with your Gmail account
3. Click "Select a project" (top left) → "New Project"
4. Name it something like: `openclaw-dottie`
5. Leave "Location" as default → Click "Create"

## Step 2: Enable APIs

1. Go to "APIs & Services" → "Library" (left sidebar)
2. Search and enable each:
   - **Gmail API** → Click "Enable"
   - **Google Calendar API** → Click "Enable"
3. (Optional: Google Drive API if you want file access)

## Step 3: Configure OAuth Consent Screen

1. Go to "APIs & Services" → "OAuth consent screen" (left sidebar)
2. Choose "External" (for personal use) → Click "Create"
3. Fill in:
   - **App name**: `OpenClaw Dottie`
   - **User support email**: Your Gmail address
   - **Developer contact info**: Your Gmail address
4. Click "Save and Continue" (skip Scopes for now)
5. Click "Save and Continue" (skip Test users for now)
6. Click "Back to Dashboard"

## Step 4: Create OAuth 2.0 Credentials

1. Go to "APIs & Services" → "Credentials" (left sidebar)
2. Click "Create Credentials" → "OAuth client ID"
3. Application type: "Desktop app"
4. Name: `OpenClaw Desktop Client`
5. Click "Create"
6. **IMPORTANT**: You'll see a popup with:
   - **Client ID** (long string ending in ...apps.googleusercontent.com)
   - **Client Secret** (shorter string)
7. Click "Download JSON" — save this file somewhere safe
8. Click "OK"

## Step 5: Get Refresh Token (One-Time Setup)

We need to run a quick Python script to exchange your credentials for a refresh token:

```bash
# First, save your credentials
mkdir -p ~/workspace/google-auth
cd ~/workspace/google-auth

# Install the Google auth library
pip install google-auth-oauthlib google-auth-httplib2

# Create this Python script
python3 << 'PYEOF'
from google_auth_oauthlib.flow import InstalledAppFlow
import json

# Scopes we need
SCOPES = [
    'https://www.googleapis.com/auth/gmail.readonly',
    'https://www.googleapis.com/auth/calendar.readonly',
]

# Run the OAuth flow
flow = InstalledAppFlow.from_client_secrets_file(
    'credentials.json',  # The JSON you downloaded
    SCOPES)
    
creds = flow.run_local_server(port=0)

# Print the refresh token
print("\n" + "="*60)
print("SAVE THIS REFRESH TOKEN:")
print("="*60)
print(creds.refresh_token)
print("="*60)
print("\nToken saved! You can close this.")
PYEOF
```

When you run this:
1. It will open your browser
2. Sign in with your Gmail account
3. Click through the warnings ("This app isn't verified" → "Advanced" → "Go to OpenClaw Dottie")
4. Grant permissions for Gmail and Calendar
5. The script will print your refresh token

## Step 6: Configure OpenClaw

Add these to your OpenClaw config:

```bash
# Store the credentials in your workspace
mkdir -p ~/workspace/.secrets
echo "YOUR_CLIENT_ID" > ~/workspace/.secrets/google_client_id
echo "YOUR_CLIENT_SECRET" > ~/workspace/.secrets/google_client_secret
echo "YOUR_REFRESH_TOKEN" > ~/workspace/.secrets/google_refresh_token

# Set permissions so only you can read them
chmod 600 ~/workspace/.secrets/*
```

## Step 7: Test It

Once configured, you can:
- Read unread emails: `Check my unread Gmail`
- Search emails: `Search Gmail for "invoice"`
- Check calendar: `What's on my calendar today?`
- Get upcoming events: `What do I have tomorrow?`

## Troubleshooting

**"This app isn't verified" warning:**
- Normal for personal OAuth apps. Click "Advanced" → "Go to OpenClaw Dottie (unsafe)"

**Token expires:**
- Refresh tokens for "testing" apps expire after 7 days
- To avoid this, after testing, go to OAuth consent screen → "Publish App" (doesn't cost anything, just makes it "production")

**Permission denied:**
- Make sure you enabled both Gmail API AND Calendar API
- Check that the scopes in the auth match what you enabled

## Need Help?

If any step fails, tell me exactly where and I'll troubleshoot with you.
