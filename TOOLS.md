# TOOLS.md

Skills define how tools work. This file is for your specifics — the stuff that's unique to your setup.

## Dropbox Access

- **Token:** Stored in `.env` as `DROPBOX_TOKEN`
- **Access Level:** Full access to your entire Dropbox
- **Root folder:** `AgentProjects/` (currently empty — ready for project files)
- **Access expires:** April 2, 2026 (you can refresh it at [dropbox.com/developers](https://www.dropbox.com/developers))

### Scripts I Have
- `dbx-list.sh [path]` - List folder contents
- `dbx-upload.sh [local] [remote]` - Upload files
- `dbx-download.sh [remote] [local]` - Download files

### Important
- This is a **full access token** — I can read/write/delete anything in your Dropbox
- Folder is currently shared as a link but you can revoke that anytime
- The token stays on this machine only (not sent anywhere else)
