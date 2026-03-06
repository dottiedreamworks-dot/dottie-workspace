#!/bin/bash
source "$(dirname "$0")/../.env"

# Check and refresh token if needed
$(dirname "$0")/dropbox-check-token.sh || exit 1

# Re-source to get updated token
source "$(dirname "$0")/../.env"
DROPBOX_PATH="$1"
LOCAL_FILE="$2"
curl -s -X POST https://content.dropboxapi.com/2/files/download \
  --header "Authorization: Bearer $DROPBOX_TOKEN" \
  --header "Dropbox-API-Arg: {\"path\": \"$DROPBOX_PATH\"}" \
  -o "$LOCAL_FILE"
