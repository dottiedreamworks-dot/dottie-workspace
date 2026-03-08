# Builder Agent Spawn Protocol

## When to Spawn Builder

**DO spawn builder for:**
- HTML/CSS/JS app development
- Writing documentation from specs
- Creating config files
- Generating templates
- Repetitive formatting tasks
- Testing implementations

**DON'T spawn builder for:**
- Research tasks (needs judgment)
- Strategic decisions (needs context)
- Conversations with you (needs relationship)
- Tasks requiring continuous coordination

## Spawn Checklist

Before spawning, I must:

- [ ] Task is purely implementation (no research/decisions)
- [ ] Requirements are clear and specific
- [ ] Output format is defined
- [ ] Output path is specified
- [ ] Quality gates are listed
- [ ] I have the full context to provide

## Spawn Command Template

```json
{
  "task": "TASK_ID: [id]\nTASK_TYPE: [type]\nDESCRIPTION: [description]\nREQUIREMENTS:\n  - [req1]\n  - [req2]\nOUTPUT_FORMAT: [format]\nOUTPUT_PATH: [path]\nCONTEXT: [context]\nQUALITY_GATES:\n  - [gate1]\n  - [gate2]",
  "agentId": "main",
  "model": "anthropic/claude-sonnet-4",
  "runTimeoutSeconds": 1800,
  "cleanup": "delete"
}
```

## Validation After Spawn

When builder returns, I must:

1. **Check BUILDER_STATUS**
   - If COMPLETE → proceed to validation
   - If ERROR → read error, decide retry/fix/escalate

2. **Validate deliverable**
   - File exists at OUTPUT_PATH
   - File is not empty
   - File passes basic sanity check

3. **Review BUILDER_LOG**
   - Check assumptions made
   - Note any limitations
   - Plan integration steps

4. **Integrate into project**
   - Move/rename if needed
   - Update TASK_QUEUE.json
   - Git commit
   - Sync to Dropbox

5. **Report to Jayna**
   - What was built
   - Any issues or limitations
   - Next steps

## Error Handling

**If builder fails:**
1. Read BUILDER_ERROR carefully
2. Check if requirements were unclear
3. Decide: Retry with clearer spec / Fix myself / Escalate to Jayna
4. Document decision in checkpoint

**If builder produces low quality:**
1. Don't accept partial work
2. Provide specific feedback
3. Re-spawn with clearer requirements
4. Or build it myself if faster

## Cost Optimization

- Use cheaper model for builder (Sonnet instead of Opus)
- Set reasonable timeout (30 min default)
- Clean up after completion
- Don't spawn for trivial tasks (< 5 min work)

## Example Spawns

### Example 1: Tiny Wins Garden UI
```json
{
  "task": "TASK_ID: tinywins-v6-garden-ui\nTASK_TYPE: html_app\nDESCRIPTION: Build the garden visualization UI for Tiny Wins v6\nREQUIREMENTS:\n  - Show 6 evolution stages\n  - Display growth energy counter\n  - Show 7 category plants\n  - Include milestone celebrations\n  - CSS animations for transitions\n  - Mobile responsive\nOUTPUT_FORMAT: file_path\nOUTPUT_PATH: projects/tiny-wins/tiny-wins-v6-garden-prototype.html\nCONTEXT: Based on growth-garden-design-document.md. Visual trophy case philosophy.\nQUALITY_GATES:\n  - Renders without errors\n  - Responsive to 375px\n  - Smooth 60fps animations",
  "agentId": "main",
  "model": "anthropic/claude-sonnet-4",
  "runTimeoutSeconds": 1800,
  "cleanup": "delete"
}
```

### Example 2: STR Cleaning Checklist
```json
{
  "task": "TASK_ID: str-cleaning-checklist\nTASK_TYPE: markdown_doc\nDESCRIPTION: Create room-by-room cleaning checklist for STR owners\nREQUIREMENTS:\n  - Cover all rooms: bedroom, bathroom, kitchen, living area\n  - Include pre-arrival and post-departure tasks\n  - Format as printable checklist\n  - Professional but friendly tone\nOUTPUT_FORMAT: markdown\nOUTPUT_PATH: projects/str-digital-products/cleaning-checklist-templates.md\nCONTEXT: Target audience: short-term rental owners. Price point $29.\nQUALITY_GATES:\n  - Complete and comprehensive\n  - Ready to convert to PDF\n  - No spelling/grammar errors",
  "agentId": "main",
  "model": "anthropic/claude-sonnet-4",
  "runTimeoutSeconds": 900,
  "cleanup": "delete"
}
```

## Integration with Daily Vitamins

**Morning dose:** Review any pending builder tasks
**Heartbeat:** Check builder status if active
**Evening:** Ensure all builder outputs are committed

---

*Protocol Version: 1.0*
*Purpose: Reliable, fast delegation to builder agent*