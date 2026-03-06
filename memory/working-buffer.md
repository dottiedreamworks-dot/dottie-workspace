# Working Buffer — Danger Zone Log

**Purpose:** Captures every exchange when context usage > 60%. Survives compaction.

**Rule:** Once context hits 60%, EVERY exchange gets logged here. No exceptions.

---

## Format

```
## [timestamp] Human
[their message]

## [timestamp] Agent (summary)
[1-2 sentence summary of your response + key details]
```

---

## Log Entries

<!-- Entries added automatically during danger zone -->

---

*This file survives compaction. Check here first when recovering context.*