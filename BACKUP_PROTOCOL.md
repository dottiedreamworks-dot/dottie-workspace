# Backup Protocol

## Why This Matters
Heyron/OpenClaw is in beta. Sessions can be interrupted, containers can restart, and we need to ensure no work is lost. This protocol ensures everything important is safely stored in GitHub.

## What's Backed Up
- All workspace files (code, docs, memory, skills)
- Configuration (excluding secrets)
- Task queues and checkpoints

## What's NOT Backed Up (Security)
- `.env` files (API keys, tokens)
- `.credentials/` directory
- `.secrets/` directory
- Any `*.key` or `*.token` files
- Gmail/Google OAuth credentials

## Manual Backup
Run this anytime you want to force a backup:
```bash
cd ~/.openclaw/workspace && ./scripts/auto-backup.sh
```

Or the simple version:
```bash
cd ~/.openclaw/workspace && git add -A && git commit -m "Manual backup: $(date '+%Y-%m-%d %H:%M:%S')" && git push
```

## Automatic Backup Options

### Option 1: Heartbeat-Triggered (Recommended)
The HEARTBEAT.md protocol includes a backup check. When I receive a heartbeat and there are uncommitted changes, I'll commit and push them.

### Option 2: End-of-Session Backup
Every time we finish a significant session, I should run the backup before signing off.

### Option 3: Pre-Task Backup
Before starting any major task, I can create a checkpoint commit.

## Recovery
If the container restarts or I go offline:
1. Clone the repo: `git clone https://github.com/dottiedreamworks-dot/dottie-workspace.git`
2. Restore any needed secrets from your password manager
3. Continue where we left off

## GitHub Repo
https://github.com/dottiedreamworks-dot/dottie-workspace

## Last Backup
Check the latest commit: `cd ~/.openclaw/workspace && git log -1 --format="%h %s %ci"`