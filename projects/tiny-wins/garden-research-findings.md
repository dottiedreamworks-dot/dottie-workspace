# Tiny Wins Garden System - Research Findings

**Research Date:** March 8, 2026  
**Task ID:** tinyWinsGarden  
**Status:** In Progress  
**Researcher:** Dottie

---

## Executive Summary

This document compiles research on gamified habit tracking apps to inform the design of Tiny Wins v5's Growth Garden system. The goal is to create a scalable, motivating visual progression system that celebrates accomplishments without creating guilt or pressure.

---

## Research Areas Covered

### 1. Finch App - Self-Care Pet

**What Works:**
- Virtual pet bird grows with self-care task completion
- Rainbow stones currency for decorations/outfits/trips
- **No pressure or punishment for missing days** - critical differentiator
- Free to use with optional premium upgrades
- Multi-functional: mood tracker + daily planner + journaling tool

**Key Insight:**
> "The app never pressures you or punishes you for missing a day - it's all gamification without guilt"

**Relevance to Tiny Wins:**
- ✅ No guilt/pressure aligns with design philosophy
- ✅ Currency system (rainbow stones) could translate to "stars" or "seeds"
- ✅ Accumulation model (more tasks = more currency) matches abundance mindset
- ⚠️ Pet care metaphor might create obligation feeling - avoid "feed your plant" mechanics

---

### 2. Forest App - Focus Trees

**What Works:**
- Tree planting metaphor for focus sessions
- Visual forest grows with each completed session
- Tags for different types of focus/work
- Real tree planting integration (social impact)
- Low-stakes consequence: tree dies if you leave app

**Key Insight:**
> "Every successfully completed focus session adds a new tree - accumulation without punishment"

**Relevance to Tiny Wins:**
- ✅ Visual accumulation model (forest gets bigger)
- ✅ Low-stakes, no guilt
- ✅ Different tree types could map to task categories
- ⚠️ Death mechanic (tree dying) could feel negative - avoid

---

### 3. Flora App - Green Focus

**What Works:**
- Multi-user tree planting (original feature)
- Focus on "staying present" not just productivity
- Virtual and real tree planting
- Gamification through cool animations

**Key Insight:**
- Multi-user functionality adds social layer
- Positioning as "staying present" rather than "being productive" reduces pressure

**Relevance to Tiny Wins:**
- ✅ "Staying present" framing aligns with mindfulness
- ⚠️ Multi-user adds complexity - maybe future feature

---

### 4. Habitica - RPG Gamification

**What Works:**
- RPG character progression (XP, levels, equipment)
- Parties with friends = shared accountability
- Guilds for like-minded communities
- Battling enemies by completing real-life tasks
- Challenges with shared task lists

**Key Insight:**
> "Social element adds accountability - party members' health/XP impacted by each other"

**Caution:**
- Habitica removed Tavern and guilds in August 2023 - social features can be removed

**Relevance to Tiny Wins:**
- ✅ Progression systems (levels, XP) work for long-term engagement
- ✅ Accountability through social features
- ⚠️ Too complex for Tiny Wins simplicity
- ⚠️ Health/XP loss mechanics create pressure - avoid

---

### 5. Long-Term Engagement Principles (500+ Days)

**Key Findings:**

1. **Journey-based progression** (Fabulous app) works better than pure streaks for long-term retention
2. **Fine-tuning reward structure** makes or breaks long-term engagement
3. **Free users should still get real value** - don't gate core experience
4. **Avoid pay-to-win mechanics** - monetization should support goals, not exploit them
5. **Well-structured advancement** can improve retention by up to 25%

**Relevance to Tiny Wins:**
- ✅ Journey/progression model fits 500+ day timeline
- ✅ All features should be free (no premium gates)
- ✅ Reward structure needs careful design

---

### 6. Currency & Milestone Systems

**Mobile Game Best Practices:**

**Daily Login Rewards:**
- Day 1: Basic currency
- Day 7: Rare item or exclusive skin
- Reset cycles maintain motivation (weekly/monthly)

**Milestone-Based Unlocks:**
- New abilities/characters at strategic progression points
- Achievement-based rewards for reaching milestones
- Points system for completing levels/challenges

**Relevance to Tiny Wins:**
- ✅ Milestone rewards at 7, 30, 100, 365 days
- ✅ Currency (stars/seeds) for garden customization
- ✅ Unlock new plant types or garden elements

---

## Design Recommendations for Tiny Wins Garden

### Core Philosophy (Preserved)
- **Celebrate what WAS done, not punish what wasn't**
- **Visual trophy case of accomplishments, not maintenance obligation**
- **Abundance mindset** (more wins = more garden)

### Proposed Mechanics

#### 1. **Growth System: Evolving Plants**
- Each completed task plants a seed
- Seeds grow through stages: Sprout → Seedling → Plant → Flower/Tree
- Growth happens automatically based on task completion (no "watering" required)
- Different plant types unlock based on task categories or milestones

#### 2. **Currency: Stars or Seeds**
- Earn currency for each completed task
- Bonus currency for streaks (but no penalty for breaking them)
- Spend currency on:
  - Garden decorations (visual only)
  - New plant types
  - Garden themes/backgrounds
  - Celebration effects

#### 3. **Milestone Rewards**
- **7 days:** New plant color variant
- **30 days:** New garden decoration
- **100 days:** Rare plant type
- **365 days:** Legendary garden element
- **500+ days:** Master gardener title + exclusive theme

#### 4. **Scalability for 500+ Days**
- Garden expands visually (zoom out or new areas unlock)
- Plants become more elaborate/diverse over time
- Seasonal changes (spring flowers, autumn colors, winter snow)
- No UI overwhelm - older plants become part of landscape

#### 5. **Category Representation**
- Each Tiny Wins category has associated plant type
  - Home: Cacti/succulents (low maintenance metaphor)
  - Body: Flowering plants (growth metaphor)
  - Mind: Trees (wisdom metaphor)
  - Social: Vines/climbing plants (connection metaphor)
  - Work: Bamboo (productivity metaphor)
  - Finance: Money tree/jade plant
  - Creative: Wildflowers (variety)

#### 6. **Preserved Celebrations**
- ✅ Confetti on task completion
- ✅ Level-up modal popups
- ✅ Task generation mechanism
- ✅ Category system

### What to AVOID

❌ **Daily requirements** - No "water your plant" mechanics
❌ **Death/dying mechanics** - Plants never die
❌ **Social pressure** - No comparing gardens (unless opt-in)
❌ **Paywalls** - All core features free
❌ **Complex RPG systems** - Keep it simple

---

## Next Steps

1. [ ] Create visual mockup of garden evolution (Day 1 vs Day 100 vs Day 500)
2. [ ] Design specific plant growth stages and timing
3. [ ] Define currency earning/spending economy
4. [ ] Create milestone reward list
5. [ ] Technical feasibility assessment (localStorage, performance)

---

## Research Checkpoints

- ✅ **Checkpoint 001:** Finch & Forest research (2026-03-08T05:37:00Z)
- ✅ **Checkpoint 002:** Long-term engagement & Habitica (2026-03-08T05:41:00Z)
- ⏳ **Checkpoint 003:** Evolving plant systems & milestone design

---

## Sources

- Finch App reviews and user feedback
- Forest App case studies
- Flora App documentation
- Habitica Wikipedia and user guides
- Gamification+ habit app comparison (2026)
- Mobile game retention research (Segwise, Elevatix)
- Trophy.so gamification case studies
