# Learnings Log

Captured learnings, errors, and discoveries. Review before major tasks.

**Categories**: correction | insight | knowledge_gap | best_practice  
**Areas**: frontend | backend | infra | tests | docs | config | workflow  
**Statuses**: pending | in_progress | resolved | wont_fix | promoted | promoted_to_skill

---

## [LRN-2026-03-07-001] best_practice

**Logged**: 2026-03-07T14:22:00Z  
**Priority**: high  
**Status**: promoted  
**Area**: workflow

### Summary
Always sync deliverables to Dropbox immediately after completion, not as an afterthought. User expects files to be accessible across devices.

### Context
User asked "Is everything also in Dropbox?" indicating expectation that cloud sync happens automatically. Files were only local in /projects/ folder.

### Resolution
Created dbx-upload.sh script and synced all 8 deliverables to Dropbox AgentProjects folder.

### Prevention
Add "Upload to Dropbox" as final step in completion checklist for all deliverables.

**Promoted**: AGENTS.md - Added to workflow checklist

---

## [LRN-2026-03-07-002] insight

**Logged**: 2026-03-07T14:22:00Z  
**Priority**: medium  
**Status**: resolved  
**Area**: workflow

### Summary
Self-improvement skill installation requires both: (1) extracting to skills/ folder, AND (2) copying .learnings/ templates to workspace root.

### Context
Skill was extracted but .learnings/ files remained in skills/self-improving-agent/.learnings/ instead of workspace root where they're actually used.

### Resolution
Copied template files to ~/.openclaw/workspace/.learnings/

---

## [LRN-2026-03-07-003] correction

**Logged**: 2026-03-07T17:10:00Z  
**Priority**: high  
**Status**: resolved  
**Area**: workflow  
**Pattern-Key**: workflow.learnings_usage

### Summary
Misused LEARNINGS.md as secondary task list instead of systemic improvement tracker. Logged task-specific corrections (Disney rides, trip options) instead of behavioral patterns.

### Context
User clarified: "self improvement skill was more for correcting mistakes and documenting and learning from those mistakes, not adding another place to hold task specific instructions or updates."

### Resolution
- Removed task-specific entries from LEARNINGS.md
- Created proper tasks in TASK_QUEUE.json for deliverable updates
- Keeping only systemic learnings (workflow improvements, recurring patterns)
- Updated AGENTS.md and HEARTBEAT.md to check learnings before tasks

### Prevention
LEARNINGS.md is for:
- Systemic mistakes (things I do wrong repeatedly)
- Workflow improvements (better ways to work)
- Knowledge gaps (things I didn't know)
- Best practices (patterns to adopt)

NOT for:
- One-off task corrections
- Specific deliverable feedback
- Temporary to-do items

**See Also**: This is the third workflow pattern correction today - need to be more careful about understanding tool purposes before using them.

---

## [LRN-2026-03-08-001] correction

**Logged**: 2026-03-08T02:37:00Z  
**Priority**: high  
**Status**: resolved  
**Area**: workflow  
**Pattern-Key**: workflow.task_queue_structure

### Summary
Misplaced product deliverable in `improvementQueue` instead of as a top-level project. The `improvementQueue` is strictly for MY system/capability improvements, not for Jayna's product work.

### Context
User corrected me when I put Tiny Wins garden system (a product feature) in the improvement queue. User clarified: "improvement queue is for improvements to your systems."

### The Rule
- **Top-level projects** = Product deliverables, research, apps, content FOR Jayna
- **improvementQueue** = MY infrastructure, skills, capabilities, automation
- **backlog** = Completed/cleanup tasks

### Examples
✅ **improvementQueue** items:
- Maton.ai setup (my Google Sheets capability)
- Voice communication (my feature)
- New skill installation
- Workflow automation for me

❌ **NOT improvementQueue** items:
- Tiny Wins garden (product feature for Jayna)
- STR maintenance system (product for Jayna)
- Audio Empire research (work product for Jayna)

### Resolution
- Moved `tinywins-garden-001` to top-level `tinyWinsGarden` project
- Kept only `maton-setup-001` and `voice-communication-001` in improvementQueue

### Prevention
Before adding to improvementQueue, ask: "Is this making ME better, or is this delivering value TO Jayna?"
- If ME → improvementQueue
- If Jayna → top-level project or tasks array

---

## [LRN-2026-03-07-004] best_practice

**Logged**: 2026-03-07T14:57:00Z  
**Priority**: high  
**Status**: promoted  
**Area**: workflow

### Summary
Files are disorganized — everything dumped in root folders. Need proper project folder structure with each project in its own folder.

### Context
User feedback: "Each project should have its very own folder... hard to find things as you make more changes and iterations." Current structure has all HTML files flat in /projects/.

### Resolution
✅ COMPLETED: Created organized folder structure with subfolders for all 6 project areas. Moved 21 files to proper locations.

**Promoted**: AGENTS.md - File organization is now standard practice

---

## [LRN-2026-03-08-002] correction

**Logged**: 2026-03-08T19:35:00Z  
**Priority**: critical  
**Status**: in_progress  
**Area**: workflow  
**Pattern-Key**: workflow.immediate_memory_writes

### Summary
Failed to write user decisions and work commitments to memory immediately. Waited for "end of session" compaction that never happened. Lost entire v7 design conversation.

### Context
- User reviewed v6, provided detailed v7 requirements
- Committed to building v7 ("this is a significant upgrade I'll go work on it now")
- Never wrote to memory files
- Next session: complete amnesia about v7

### Root Cause
- Relied on "mental notes" instead of immediate writes
- Assumed "end of session" compaction would capture it
- Session ended unexpectedly (context shift, not explicit)

### Resolution
- Added IMMEDIATE MEMORY WRITE PROTOCOL to AGENTS.md
- Documented red flag phrases that trigger immediate writes
- This learning captures the systemic pattern

### Prevention
**Write immediately when:**
- User makes a decision ("let's do X", "I choose Y")
- User provides feedback or corrections
- User requests changes to work in progress
- I commit to work ("I'll build that", "working on it now")
- New requirements are clarified

**Red flag phrases:**
- "I'll work on that now"
- "Let me build that"
- "Good point, I'll change..."
- "Actually, I want..."
- "No, do it this way instead..."

**The Rule:** "Text > Brain" — If you think "I'll remember this" — write it NOW, not later.

---