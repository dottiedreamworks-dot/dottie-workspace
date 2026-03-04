# Dropbox Setup Guide

## Quick Setup (5 minutes)

### Step 1: Create Dropbox App
1. Go to https://www.dropbox.com/developers/apps
2. Click "Create App"
3. Choose:
   - **Scoped access**
   - **Full Dropbox** (recommended) or App Folder
4. Name it: `openclaw-dottie`
5. Click "Create"

### Step 2: Get Access Token
1. In your app settings, scroll to "OAuth 2"
2. Set **Access token expiration** to "No expiration"
3. Click "Generate access token"
4. Copy the token (starts with `sl.`)

### Step 3: Save Token
Run this command in terminal:
```bash
echo "sl.xxxxxxxxxxxxxxxxx" > /root/.openclaw/workspace/.secrets/dropbox_token
chmod 600 /root/.openclaw/workspace/.secrets/dropbox_token
```

Or add to `.env`:
```bash
DROPBOX_TOKEN=sl.xxxxxxxxxxxxxxxxx
```

### Step 4: Create AgentProjects Folder
In your Dropbox, create a folder called `AgentProjects` at the root level.

### Step 5: Test
```bash
cd /root/.openclaw/workspace
./dbx-list.sh ""
```

## Using File Exchange

### Upload files to Dropbox:
```bash
./dbx-upload.sh local-file.txt /AgentProjects/
```

### Download files from Dropbox:
```bash
./dbx-download.sh /AgentProjects/file.txt ./inbox/
```

### Automatic Sync
The night worker will:
- Check for new files in AgentProjects
- Download them to ./inbox/
- Process files in ./inbox/
- Upload results to ./outbox/ → Dropbox

## Security Notes
- Token provides full Dropbox access (if using Full Dropbox scope)
- Only share files you want the agent to access
- Revoke in Dropbox settings if needed
- Token stored locally, never sent to external services
