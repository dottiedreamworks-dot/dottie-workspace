# Tiny Wins App — Improvement Notes
**Date:** 2026-03-04
**Status:** IN PROGRESS — Night work task

## User Feedback (Jayna)

### Bug Report
- **Issue:** Done List "+" button not working
- **Symptom:** Click plus, nothing happens
- **Expected:** Item added to Done List with timestamp
- **Actual:** No response, item not added
- **Likely Cause:** JavaScript event handler or localStorage issue

### Enhancement Request
**Current:** Vague suggestions like "What's one thing you could do in 2-5 minutes?"
**Problem:** Creates decision fatigue for ADHD brains
**Solution:** Ultra-specific, concrete micro-tasks

**Examples of better prompts:**
- ❌ "Clean something" → ✅ "Wipe one counter, table, desk, or shelf"
- ❌ "Do laundry" → ✅ "Put in a load, switch a load, or fold 10 items"
- ❌ "Organize" → ✅ "Clear one surface completely"
- ❌ "Exercise" → ✅ "Put on workout clothes OR do 5 jumping jacks"

## Implementation Plan

### Phase 1: Bug Fix (Priority: HIGH)
- [ ] Debug JavaScript event listener for addDone()
- [ ] Check localStorage write functionality
- [ ] Test across browsers
- [ ] Add error handling/logging

### Phase 2: Enhanced Suggestion Engine (Priority: HIGH)
- [ ] Rewrite all suggestion templates with concrete specifics
- [ ] Add category: "Quick Chores" (household tasks)
- [ ] Add category: "Self-Care" (hygiene, rest, mental health)
- [ ] Add category: "Admin" (bills, emails, scheduling)
- [ ] Ensure every prompt starts with action verb
- [ ] Include time estimate ("2 min", "5 min", "10 min max")

### Phase 3: UX Improvements (Priority: MEDIUM)
- [ ] Add visual feedback when button clicked
- [ ] Show "Saved!" confirmation
- [ ] Make Done List editable (delete items)
- [ ] Add streak counter ("3 days of tiny wins!")

## New Suggestion Categories

### Quick Chores (Household)
"Take out the trash bag and put in a new one"
"Wipe one counter, table, desk, or shelf"
"Put away 5 things that are out of place"
"Fill or empty the dishwasher (just one action)"
"Clean one toilet, sink, or mirror"
"Take out recycling"
"Vacuum one room (or one corner of a room)"
"Change bed sheets OR make the bed"
"Water one plant"
"Take the pile off one chair"

### Self-Care
"Brush teeth OR wash face"
"Shower (even 2 minutes counts)"
"Put on real clothes (not pajamas)"
"Drink one full glass of water"
"Take meds if you haven't yet"
"Step outside for 2 minutes of fresh air"
"Text one friend "thinking of you""
"Sit in silence for 3 minutes (set timer)"
"Stretch for 60 seconds"
"Put on lotion or sunscreen"

### Admin & Life
"Check email and delete 5 spam messages"
"Pay one bill (or schedule payment)"
"Make one appointment you've been avoiding"
"File one piece of paper"
"Send one text to reschedule something"
"Order one thing you've been meaning to buy"
"Set a timer and work on taxes for 10 minutes"
"Write one thank you note (text is fine)"
"Return one phone call"
"Update calendar with one upcoming event"

### Work & Projects
"Open the document and read the first paragraph"
"Send one work email or message"
"Write down 3 things you did today (for your boss or yourself)"
"Set up one meeting or call"
"Research one specific question for 5 minutes"
"Draft one paragraph of that thing you're avoiding"
"Schedule one task in your calendar"
"Decline one meeting you don't need to attend"
"Organize one folder on your computer"
"Back up one important file"

### Food & Kitchen
"Put one thing in the slow cooker"
"Prep one vegetable or ingredient"
"Order groceries OR make grocery list"
"Clean out one expired item from fridge"
"Set the table for next meal"
"Put leftovers in containers"
"Take meat out to thaw"
"Make coffee or tea"
"Eat something (even a banana counts)"
"Drink one glass of water before next coffee"

## Implementation Notes

**Time Estimates:**
- 2 minutes = "Right now, no excuses"
- 5 minutes = "Quick but feels substantial"
- 10 minutes = "Short but complete task"

**Language Pattern:**
- Start with action verb
- Be specific about quantity ("one", "5 items", "60 seconds")
- Remove decision-making (don't ask "what surface?" — say "wipe one counter, table, desk, or shelf")
- Include alternatives ("OR" options reduce resistance)

## Testing Checklist

- [ ] Done List adds items on button click
- [ ] Items persist after refresh (localStorage)
- [ ] All 5 categories show unique suggestions
- [ ] Suggestions are concrete and specific
- [ ] No vague "organize something" type prompts
- [ ] App works in both Dropbox and Google Drive versions

---
**Target:** Complete by morning (next user session)
**Deliverable:** Updated tiny-wins-prototype.html v2.0
