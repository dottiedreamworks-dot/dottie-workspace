# Checkpoints Directory

This folder stores task progress checkpoints for interruption recovery.

Each task gets a subdirectory: `checkpoints/{task-id}/`

Format: `{step-number}-{description}.json`

Example:
```
checkpoints/task-001/
├── 001-initialize-project.json
├── 002-research-complete.json
└── 003-draft-complete.json
```
