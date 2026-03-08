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