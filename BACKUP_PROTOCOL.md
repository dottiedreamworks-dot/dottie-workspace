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

## Git Authentication Issue (March 6, 2026)
**Status:** Push requires authentication. HTTPS push is failing with "could not read Username."

**Options to fix:**
1. **GitHub Personal Access Token** (Recommended):
   - Generate token at: https://github.com/settings/tokens
   - Update remote URL: `git remote set-url origin https://TOKEN@github.com/dottiedreamworks-dot/dottie-workspace.git`
   - Or use credential helper: `git config credential.helper store`

2. **SSH Key** (More secure):
   - Generate SSH key: `ssh-keygen -t ed25519 -C "dottie@openclaw.ai"`
   - Add public key to GitHub: https://github.com/settings/keys
   - Update remote URL: `git remote set-url origin git@github.com:dottiedreamworks-dot/dottie-workspace.git`

3. **GitHub CLI** (Easiest):
   - Install: `apt-get install gh` (or download from https://cli.github.com)
   - Authenticate: `gh auth login`
   - Push: `gh repo sync` or regular `git push`

**Current workaround:** Commits are local. When you want to push, you'll need to provide credentials or set up one of the above methods.

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