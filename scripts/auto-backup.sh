#!/bin/bash
# auto-backup.sh - Automated Git backup for Dottie workspace
# Run this on a schedule to ensure all work is safely backed up to GitHub

WORKSPACE_DIR="/root/.openclaw/workspace"
LOG_FILE="$WORKSPACE_DIR/.logs/auto-backup.log"
DATE=$(date '+%Y-%m-%d %H:%M:%S')

# Ensure log directory exists
mkdir -p "$WORKSPACE_DIR/.logs"

# Function to log with timestamp
log() {
    echo "[$DATE] $1" | tee -a "$LOG_FILE"
}

# Change to workspace
cd "$WORKSPACE_DIR" || {
    log "ERROR: Cannot change to workspace directory"
    exit 1
}

# Check if there are changes to commit
if git diff --quiet && git diff --cached --quiet; then
    log "No changes to commit"
    exit 0
fi

# Add all changes
git add -A

# Create commit with timestamp
COMMIT_MSG="Auto-backup: $DATE"
git commit -m "$COMMIT_MSG" >> "$LOG_FILE" 2>&1

if [ $? -ne 0 ]; then
    log "ERROR: Git commit failed"
    exit 1
fi

# Push to origin
git push origin master >> "$LOG_FILE" 2>&1

if [ $? -eq 0 ]; then
    log "SUCCESS: Backup completed and pushed to GitHub"
else
    log "ERROR: Git push failed"
    exit 1
fi