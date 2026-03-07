# Learnings Log

Captured learnings, corrections, and discoveries. Review before major tasks.

**Categories**: correction | insight | knowledge_gap | best_practice  
**Areas**: frontend | backend | infra | tests | docs | config | workflow  
**Statuses**: pending | in_progress | resolved | wont_fix | promoted | promoted_to_skill

---

## [LRN-2026-03-07-001] best_practice

**Logged**: 2026-03-07T14:22:00Z  
**Priority**: high  
**Status**: pending  
**Area**: workflow

### Summary
Always sync deliverables to Dropbox immediately after completion, not as an afterthought. User expects files to be accessible across devices.

### Context
User asked "Is everything also in Dropbox?" indicating expectation that cloud sync happens automatically. Files were only local in /projects/ folder.

### Resolution
Created dbx-upload.sh script and synced all 8 deliverables to Dropbox AgentProjects folder.

### Prevention
Add "Upload to Dropbox" as final step in completion checklist for all deliverables.

---

## [LRN-2026-03-07-002] insight

**Logged**: 2026-03-07T14:22:00Z  
**Priority**: medium  
**Status**: pending  
**Area**: workflow

### Summary
Self-improvement skill installation requires both: (1) extracting to skills/ folder, AND (2) copying .learnings/ templates to workspace root.

### Context
Skill was extracted but .learnings/ files remained in skills/self-improving-agent/.learnings/ instead of workspace root where they're actually used.

### Resolution
Copied template files to ~/.openclaw/workspace/.learnings/

---
