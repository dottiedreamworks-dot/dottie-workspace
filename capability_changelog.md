# Capability Changelog
**Track new tools, services, skills, and integrations**
**Last Updated:** 2026-03-04
**Archive:** Entries >90 days old with [Adopted] or [Rejected] status

---

## [2026-03-04] OpenClaw Base System
**What it is:** Containerized AI agent environment with file system, git, CLI tools
**Potential use case:** Autonomous operation, task execution, file management
**Status:** [Adopted] — Core infrastructure operational

## [2026-03-04] Clawhub CLI
**What it is:** Skill registry and management system
**Potential use case:** Install/update agent capabilities on demand
**Status:** [Adopted] — Installed, 6 skills active
**Pipeline Impact:** Enables rapid capability expansion

## [2026-03-04] GitHub CLI (gh)
**What it is:** Command-line GitHub operations
**Potential use case:** Repository management, CI/CD monitoring, issue tracking
**Status:** [Adopted] — Installed and ready
**Pipeline Impact:** Supports code-based revenue streams, portfolio projects

## [2026-03-04] Night Worker Automation
**What it is:** Shell script for periodic system checks and maintenance
**Potential use case:** Autonomous monitoring, file sync, health checks
**Status:** [Adopted] — Active, runs every heartbeat
**Pipeline Impact:** Infrastructure for autonomous operations

## [BLOCKED] Brave Search API — CRITICAL FOR NICHE VALIDATION
**What it is:** Web search capability for research and monitoring
**Specific use cases:**
- **Niche Validation:** Search volume for keywords (ADHD productivity, perimenopause systems, etc.)
- **Competitor Analysis:** Find similar channels, estimate their size/engagement
- **Content Gap Research:** What aren't people covering?
- **Trend Monitoring:** Stay Current scans as per heartbeat protocol
- **Keyword Research:** YouTube/SEO optimization

**Status:** [Noted] — Container limitation, awaiting provider restoration
**Action Required:** Operator to:
1. Follow up with heyron.ai tech support
2. Get API key at https://api.search.brave.com (free tier available)
3. Add to environment configuration

**Pipeline Impact:** 
- **CRITICAL:** BLOCKS Small Bets niche validation
- Cannot research: search volume, competitor analysis, content gaps
- **Workaround:** Operator manually researches, provides URLs for me to analyze
- **Without this:** Flying blind on niche selection

**Unblock Priority:** HIGHEST — required for data-driven decisions

## [BLOCKED] Sub-Agent Creation
**What it is:** Parallel agent instances for multi-tasking
**Potential use case:** Simultaneous project work, specialized agents
**Status:** [Noted] — sessions_spawn restricted in environment
**Action Required:** Operator to confirm with tech support on limits/enablement
**Pipeline Impact:** BLOCKS parallel execution, SUBAGENTS.md operations

## [BLOCKED] Dropbox Integration
**What it is:** Cloud file storage and exchange
**Potential use case:** File deliverables, document sharing with operator
**Status:** [Noted] — Awaiting token setup
**Action Required:** Operator to generate token at dropbox.com/developers
**Pipeline Impact:** BLOCKS automated file exchange

## [BLOCKED] Google Workspace
**What it is:** Gmail, Calendar, Drive integration
**Potential use case:** Email monitoring, scheduling, document access
**Status:** [Noted] — OAuth flow incomplete
**Action Required:** Operator to run `./scripts/google-oauth-complete.sh`
**Pipeline Impact:** BLOCKS communication channel monitoring

## [BLOCKED] Notion Integration
**What it is:** Structured note-taking and database platform
**Potential use case:** Project documentation, knowledge base, task tracking
**Status:** [Noted] — Awaiting API key
**Action Required:** Operator to create integration at notion.so/my-integrations
**Pipeline Impact:** Using filesystem instead — functional but less structured

---

## Evaluation Queue
*Capabilities marked [Noted] awaiting evaluation*

None pending — all noted items currently blocked pending operator action.

---
