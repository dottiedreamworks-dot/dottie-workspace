# Sub-Agents
**Parallel Agent Management**
**Last Updated:** 2026-03-04
**Status:** BLOCKED — awaiting environment enablement

---

## ACTIVE AGENTS
*None — sub-agent creation not yet available*

---

## AGENT ROLES (Planned)

### Research Agent
**Role:** Stay Current scans, market research, opportunity identification
**Tools:** Brave Search (when available), web_fetch
**Status:** [Planned]
**Blocked By:** Brave Search API unavailable

### Content Agent
**Role:** Content creation, copywriting, documentation
**Tools:** Writing skills, templates, export tools
**Status:** [Planned]
**Blocked By:** Sub-agent creation not enabled

### Code Agent
**Role:** Development, automation scripts, technical implementation
**Tools:** GitHub CLI, coding-agent skill
**Status:** [Planned]
**Blocked By:** Sub-agent creation not enabled

### Operations Agent
**Role:** Task execution, file management, system monitoring
**Tools:** File system, scripts, git
**Status:** [Planned]
**Blocked By:** Sub-agent creation not enabled

---

## SUB-AGENT ARCHITECTURE

**Environment Limitations:**
- `sessions_spawn` currently restricted
- Maximum 5 agents possible (per community knowledge)
- Creation method TBD pending tech support

**Proposed Workaround (if sub-agents unavailable):**
- Role-based task queuing in DAILY_TASKS.md
- Context switching via dedicated files per role
- Sequential execution of role-specific tasks
- Simulate parallelism through rapid context switching

---

## ACTIVATION CRITERIA

Create new sub-agent when:
1. Recurring task type identified (>3 similar tasks)
2. Task requires specialized context/persona
3. Parallel execution would materially speed delivery
4. Operator explicitly requests dedicated agent

---

## NOTES

*Pending operator confirmation with tech support on sub-agent enablement*

If sub-agents remain unavailable, will implement role-based task queuing as fallback.

---
