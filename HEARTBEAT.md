# HEARTBEAT.md - Autonomous Work Tasks

# When this file is read, execute the night worker and take appropriate actions
# based on the results.

## Task Execution Sequence

1. **RUN NIGHT WORKER**
   Execute: `/root/.openclaw/workspace/scripts/night-worker.sh`
   This checks Dropbox, inbox, system health, git status, and pending skills.

2. **CHECK LOG FOR ACTIONS**
   Read: `/root/.openclaw/workspace/.logs/night-worker.log`
   Look for actionable items logged.

3. **HANDLE DROPBOX ISSUES**
   If log shows "Token not configured":
   - Nothing to do until Jayna provides token
   - Document in status that Dropbox is pending

4. **PROCESS INBOX FILES**
   If log shows files in inbox:
   - List each file
   - Determine action needed
   - Document in status

5. **SYSTEM HEALTH ALERTS**
   If disk usage > 90% or memory > 95%:
   - Log warning
   - Notify if critical

6. **GIT CHECK**
   If not a git repo:
   - Run: `cd /root/.openclaw/workspace && git init`
   - Create initial commit

7. **SKILL CHECK**
   If pending skills exist in `.pending-skills`:
   - Attempt to install with clawhub
   - Log results

8. **CONTINUOUS OPERATION**
   - Log that heartbeat was processed
   - Update last-run timestamp

## Execution Command
When heartbeat triggers, run:
```
/root/.openclaw/workspace/scripts/night-worker.sh
cat /root/.openclaw/workspace/.logs/night-worker.log | tail -20
```

Then update `/root/.openclaw/workspace/.logs/heartbeat-status.log` with timestamp and summary.

## AUTONOMOUS EXECUTION
When this HEARTBEAT.md is read by the agent, immediately:
1. Run the night worker script
2. Process any inbox files
3. Update status logs
4. Report if critical issues found
