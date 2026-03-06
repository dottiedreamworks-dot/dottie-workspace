#!/bin/bash
# Night Worker - Autonomous Agent Tasks
# Runs periodically to check for work and process files
# Logs everything to .logs/night-worker.log

WORKSPACE="/root/.openclaw/workspace"
LOGDIR="$WORKSPACE/.logs"
LOGFILE="$LOGDIR/night-worker.log"

# Ensure log directory exists FIRST
mkdir -p "$LOGDIR"

echo "========================================" >> "$LOGFILE"
echo "Night Worker Started: $(date)" >> "$LOGFILE"
echo "========================================" >> "$LOGFILE"

# Task 1: Check Dropbox for new files
echo "[$(date '+%H:%M:%S')] Checking Dropbox..." >> "$LOGFILE"
if [ -f "$WORKSPACE/.env" ]; then
    source "$WORKSPACE/.env"
    if [ -n "$DROPBOX_TOKEN" ]; then
        # List files in AgentProjects folder
        DROPBOX_RESULT=$(curl -s -X POST https://api.dropboxapi.com/2/files/list_folder \
            --header "Authorization: Bearer $DROPBOX_TOKEN" \
            --header "Content-Type: application/json" \
            --data '{"path": "/AgentProjects", "recursive": true, "limit": 100}' 2>&1)
        echo "$DROPBOX_RESULT" | jq -r '.entries[]? | "[DROPBOX] \(.path_display) - \(.size // \"dir\")"' >> "$LOGFILE" 2>/dev/null || echo "[DROPBOX] Check completed or no files" >> "$LOGFILE"
    else
        echo "[DROPBOX] Token not configured - needs setup" >> "$LOGFILE"
    fi
else
    echo "[DROPBOX] .env file not found" >> "$LOGFILE"
fi

# Task 2: Check for local inbox files
echo "[$(date '+%H:%M:%S')] Checking inbox..." >> "$LOGFILE"
INBOX_COUNT=$(ls -1 "$WORKSPACE/inbox" 2>/dev/null | wc -l)
if [ "$INBOX_COUNT" -gt 0 ]; then
    echo "[INBOX] Found $INBOX_COUNT files: $(ls -1 "$WORKSPACE/inbox")" >> "$LOGFILE"
else
    echo "[INBOX] Empty" >> "$LOGFILE"
fi

# Task 3: System health check
echo "[$(date '+%H:%M:%S')] System health..." >> "$LOGFILE"
DISK_USAGE=$(df -h /root | tail -1 | awk '{print $5}')
echo "[SYSTEM] Disk usage: $DISK_USAGE" >> "$LOGFILE"
MEMORY=$(free -m | grep Mem | awk '{printf "%.1f%%", $3/$2*100}')
echo "[SYSTEM] Memory usage: $MEMORY" >> "$LOGFILE"

# Task 4: Git status
echo "[$(date '+%H:%M:%S')] Git status..." >> "$LOGFILE"
if [ -d "$WORKSPACE/.git" ]; then
    cd "$WORKSPACE"
    GIT_STATUS=$(git status --porcelain 2>&1)
    if [ -z "$GIT_STATUS" ]; then
        echo "[GIT] Working tree clean" >> "$LOGFILE"
    else
        echo "[GIT] Changes pending:" >> "$LOGFILE"
        echo "$GIT_STATUS" >> "$LOGFILE"
    fi
else
    echo "[GIT] Not a git repository" >> "$LOGFILE"
fi

# Task 5: Check for skills to install (from pending list)
echo "[$(date '+%H:%M:%S')] Checking pending skill installs..." >> "$LOGFILE"
if [ -f "$WORKSPACE/.pending-skills" ]; then
    echo "[SKILLS] Pending installs:" >> "$LOGFILE"
    cat "$WORKSPACE/.pending-skills" >> "$LOGFILE"
else
    echo "[SKILLS] No pending installs" >> "$LOGFILE"
fi

echo "[$(date '+%H:%M:%S')] Night Worker Complete" >> "$LOGFILE"
echo "" >> "$LOGFILE"
