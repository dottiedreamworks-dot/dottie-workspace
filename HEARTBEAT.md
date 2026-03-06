# HEARTBEAT.md — Agent Response Protocol
**Version:** 5.0 — Task Queue Integration
**Last Updated:** 2026-03-06

## HEARTBEAT PROTOCOL

When this file is read (via prompt), execute:

1. **Read TASK_QUEUE.json**
2. **Check for active task:**
   - If `meta.activeTask` exists → resume from last checkpoint
   - If no active task → pick highest priority pending task
3. **Execute one atomic step** (2-5 minutes max)
4. **Write checkpoint** to `checkpoints/{task-id}/`
5. **Update TASK_QUEUE.json** with progress
6. **Git commit** changes
7. **Report completion** or HEARTBEAT_OK

---

## TASK SELECTION PRIORITY

1. User-requested tasks (highest)
2. [BLOCKED] or [AWAITING REVIEW] tasks (check if unblocked)
3. Pending tasks from TASK_QUEUE.json tasks array
4. Self-improvement tasks from improvementQueue (when user tasks complete)

---

## CHECKPOINT PROTOCOL

For each atomic step:
1. **Before:** Read latest checkpoint (if exists)
2. **During:** Execute the step
3. **After:** Write checkpoint with:
   - Step number and description
   - Timestamp
   - Status (completed/in_progress/failed)
   - Any partial results

Checkpoint filename: `checkpoints/{task-id}/{step:03d}-{short-desc}.json`

---

## USER TASK COMPLETION PROTOCOL

When operator asks for specific task:
1. Acknowledge receipt immediately
2. Add to TASK_QUEUE.json with status "pending"
3. Execute task fully (may take multiple heartbeats)
4. Provide completion notification:
   - ✅ Status (completed/partial/blocked)
   - 📊 What was accomplished
   - 📁 Files changed (if any)
   - ⏭️ Next steps (if applicable)

**Rule:** Only mark done when you have PROOF (file exists, command succeeded)

---

## MORNING SUMMARY (6 AM CST)

When prompted by cron:
1. Read TASK_QUEUE.json
2. Read git log (last 24h)
3. Read checkpoints/ for task progress
4. Generate report:
   - ✅ Completed tasks
   - ⏳ In Progress (with checkpoint status)
   - ⏸️ Awaiting Review/Blocked
   - 🔄 Self-improvement work done

---

## AUTONOMOUS WORK RULES

**When user is absent:**
- Continue working on active task
- If no active task, pick from improvementQueue
- Never mark tasks complete without proof
- Git commit after every checkpoint
- Update TASK_QUEUE.json before ending any session

**Red flags (STOP and await user):**
- Any external action (email, post, purchase)
- Destructive operations without backup
- Tasks requiring API keys that aren't configured

---

## CURRENT STATUS

**Active Task:** See TASK_QUEUE.json meta.activeTask
**Last Checkpoint:** See checkpoints/{task-id}/ directory
**Systems:** All operational
