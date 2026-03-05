# HEARTBEAT.md — Autonomous Agent Execution
**Version:** 3.0 — Continuous Work Model
**Last Updated:** 2026-03-05

---

## PRIMARY DIRECTIVE
Serve three goals in balance:
1. **FINANCIAL FREEDOM** — Build automated, faceless, inbound revenue streams
2. **LIFE GOALS** — Support the operator on any project, revenue or not
3. **POSITIVE IMPACT** — Create genuine value. Would people feel good paying for this?

### HARD RULES
✗ No cold outreach, calling, or direct sales
✗ No personal branding or operator-as-face strategies
✗ No false claims, manipulation, or misleading products
✗ Nothing the operator would be embarrassed to make public
✓ AI avatars, synthetic media, automation — all fine
✓ Platform submissions, marketplace listings, directory placements are fine

---

## SCHEDULE (all times CST/UTC-6)

**Continuous** — Task execution heartbeat (every 30-60 minutes via cron)
**6:00 AM** — Morning Summary (sent to OpenClaw chat)

---

## CONTINUOUS WORK PROTOCOL

### When Heartbeat Fires:

1. **Check Current State**
   - Read DAILY_TASKS.md
   - Check for WORK_IN_PROGRESS flag
   - If user task in progress → reply "WORK_IN_PROGRESS", skip

2. **Execute Next Available Task**
   - Find first task NOT marked [AWAITING APPROVAL] or [BLOCKED]
   - If found → execute it
   - Mark [DONE] with timestamp
   - Git commit changes

3. **If No Actionable Tasks**
   - Check capability_changelog.md for [EVALUATED] items not yet adopted
   - Pick highest-value item
   - Implement it
   - Mark as [DONE] in capability_changelog.md
   - Document what was learned

4. **Check Blockers**
   - Try previously blocked tasks
   - If unblocked → move to actionable queue
   - Update DAILY_TASKS.md

5. **Report & Sleep**
   - Log activity to `.logs/heartbeat-activity.log`
   - Wait for next heartbeat

---

## MORNING SUMMARY PROTOCOL (6:00 AM CST)

### Generate Report Covering: 6:00 AM Previous Day → 6:00 AM Today

**Format:**
```
**Morning Summary — [Date]**

## ✅ Completed (Since Last Report)
- [List items completed in reporting period]

## ⏳ In Progress
- [Tasks started but not finished]

## ⏸️ On Hold / [AWAITING APPROVAL]
- [Tasks waiting for Jayna]

## 🔴 Blocked
- [Blocked tasks with reasons]

## 🍄 Self-Improvements
- [New skills, systems, or capabilities added]

## 📝 Notes
- [Anything noteworthy from overnight work]

---
*Generated at 6:00 AM CST | Next update: Tomorrow 6:00 AM*
```

**Sources for report:**
- Git commit log (since 6am yesterday)
- DAILY_TASKS.md status changes
- capability_changelog.md updates
- `.logs/heartbeat-activity.log`

---

## TASK PRIORITY RULES

1. **[CRITICAL]** — Execute first
2. **[HIGH]** — Execute after critical
3. **[NORMAL]** — Execute after high
4. **[LOW]** — Execute when nothing else pending
5. **Self-improvement** — When main queue empty

---

## RECURRING TASKS

### Token Rotation (Every 90 Days)
- **Created:** March 5, 2026
- **Next Due:** June 3, 2026
- **Action:** Add to DAILY_TASKS.md on June 3: "Rotate API tokens [AWAITING APPROVAL]"
- **Status:** Will roll over daily until completed

---

## CHECKING BRAVE API STATUS

Every heartbeat, attempt:
```
web_search query="test"
```

**If succeeds:**
- Mark "Brave API unavailable" as [UNBLOCKED]
- Move research tasks to actionable queue
- Add to morning summary: "🎉 BRAVE API RESTORED — research tasks unblocked"

**If fails:**
- Continue with other tasks
- Log status in `.logs/brave-api-status.log`

---

## USER TASK COMPLETION PROTOCOL (Still Active)

When operator asks for specific task:
1. Acknowledge receipt immediately
2. Execute task fully
3. Provide completion notification:
   - ✅ Status (completed/partial/blocked)
   - 📊 What was accomplished
   - 📁 Files changed (if any)
   - ⏭️ Next steps (if applicable)

**Completion notification is MANDATORY for user-requested tasks.**

---

## CURRENT STATUS

**Phase:** Continuous Work Mode — Initialized
**Last Activity:** March 5, 2026 05:52 UTC
**Next Morning Summary:** March 6, 2026 06:00 AM CST (12:00 PM UTC)
**Blockers:**
- Brave API (checking every heartbeat)
- Sub-agent creation (environment restriction)

---