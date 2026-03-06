#!/bin/bash
source "$(dirname "$0")/../.env"

# Check and refresh token if needed
$(dirname "$0")/dropbox-check-token.sh || exit 1

# Re-source to get updated token
source "$(dirname "$0")/../.env"
LOCAL_FILE="$1"
DROPBOX_PATH="$2"
curl -s -X POST https://content.dropboxapi.com/2/files/upload \
  --header "Authorization: Bearer $DROPBOX_TOKEN" \
  --header "Content-Type: application/octet-stream" \
  --header "Dropbox-API-Arg: {\"path\": \"$DROPBOX_PATH\", \"mode\": \"overwrite\", \"autorename\": false}" \
  --data-binary @"$LOCAL_FILE"
