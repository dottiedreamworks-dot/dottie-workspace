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

## [LRN-2026-03-07-003] correction

**Logged**: 2026-03-07T14:48:00Z  
**Priority**: high  
**Status**: pending  
**Area**: docs

### Summary
Disney trip recommendations did not account for daughters being daredevils who want the most intense rides. Need to verify thrill ride focus in recommendations.

### Context
User's daughter feedback: "they are daredevils and will want to ride the most intense rides." Current plan focused on "magical experiences" but may have underweighted thrill rides.

### Resolution
Review and verify: Space Mountain, Big Thunder Mountain, Seven Dwarfs Mine Train, TRON (if open) are the most intense. Confirm these are highlighted as priorities.

---

## [LRN-2026-03-07-004] correction

**Logged**: 2026-03-07T14:48:00Z  
**Priority**: critical  
**Status**: in_progress  
**Area**: frontend

### Summary
Tiny Wins V5 is completely broken — lost all categories and task generation. Unusable. Must redo using V4 as base.

### Context
User reported: "Tiny Wins V5 lost all of the categories and how to generate tasks entirely. It is unusable." V5 was built from scratch instead of iterating on working V4.

### Resolution
Rebuild using V4 as starting point. Preserve working category/task system. Only add enhancements on top of stable base.

---

## [LRN-2026-03-07-005] correction

**Logged**: 2026-03-07T14:48:00Z  
**Priority**: high  
**Status**: pending  
**Area**: docs

### Summary
Family trip research may have missed cheaper "fly elsewhere in Asia first" options. Need to verify if flying to alternative destinations (Philippines, Taiwan, etc.) then to Korea, or skipping Korea entirely, was thoroughly explored.

### Context
User question: "were there no viable options to fly into Asia somewhere else that is cheaper and then go to Korea afterwards to save costs, or even leave out Korea entirely?" Need to verify research covered multi-city itineraries and Korea-as-optional scenarios.

### Resolution
Re-review flight research. Check if multi-city (Nashville → X → Seoul) or Nashville → X (no Korea) options were fully analyzed. Current recommendation was Seoul + Philippines ($1,148-$1,700 total).

---

## [LRN-2026-03-07-006] best_practice

**Logged**: 2026-03-07T14:57:00Z  
**Priority**: high  
**Status**: pending  
**Area**: workflow

### Summary
Files are disorganized — everything dumped in root folders. Need proper project folder structure with each project in its own folder.

### Context
User feedback: "Each project should have its very own folder... hard to find things as you make more changes and iterations." Current structure has all HTML files flat in /projects/.

### Resolution
Create organized folder structure:
- /projects/tiny-wins/ (with versions subfolder)
- /projects/audio-empire/ (with subfolders for niches, implementation, etc.)
- /projects/seoul-family-trip/
- /projects/disney-trip/
- /projects/str-digital-products/
- /projects/rolling-strong/

Move all associated files to respective folders. Update any references.

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
