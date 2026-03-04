#!/bin/bash
source "$(dirname "$0")/.env"
curl -s -X POST https://api.dropboxapi.com/2/files/list_folder \
  --header "Authorization: Bearer $DROPBOX_TOKEN" \
  --header "Content-Type: application/json" \
  --data "{\"path\": \"$1\", \"recursive\": false, \"limit\": 100}" | jq -r '.entries[] | "\(.tag): \(.path_display)"'
