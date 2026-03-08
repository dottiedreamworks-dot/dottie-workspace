# 🏆 STR MAINTENANCE PRO SYSTEM
## Complete Setup Guide - Premium Version

**What You Got:** A sophisticated 5-sheet interconnected maintenance tracking system worth $47-97

---

## 📊 SYSTEM OVERVIEW

This isn't just a checklist — it's a complete property management system with:

1. **Master Task List** — 110 comprehensive maintenance tasks
2. **My Schedule** — Personalized tracking with due dates & status
3. **Vendor Directory** — Contact management with ratings
4. **Cost Tracker** — Expense logging with tax deduction tracking
5. **Dashboard** — Auto-updating with QUERY formulas

**Key Features:**
- ✅ Linked data between sheets
- ✅ Automated calculations
- ✅ Cost tracking by category
- ✅ Vendor rating system
- ✅ Tax deduction documentation
- ✅ Progress tracking
- ✅ Priority-based organization

---

## 🚀 SETUP INSTRUCTIONS

### Step 1: Make Your Copy
1. Open the Google Sheet
2. **File → Make a copy**
3. Name it: "[Your Property Name] Maintenance Pro"
4. Click "Make a copy"

### Step 2: Create the 5 Sheets

Your copy currently has everything on one sheet. You need to split it into 5 separate sheets:

#### Create Sheet 1: Master Task List
1. Right-click "Sheet1" tab at bottom
2. Click "Rename"
3. Type: **Master Task List**
4. Keep columns A through K (rows 1-111)
5. Delete columns L onwards

#### Create Sheet 2: My Schedule
1. Click **+** (Add Sheet) at bottom
2. Name it: **My Schedule**
3. Copy data from original Sheet1 columns L-T, rows 1-11
4. Paste into new "My Schedule" sheet starting at A1
5. This is your working task list — copy only tasks you need from Master Task List

#### Create Sheet 3: Vendor Directory
1. Add another new sheet
2. Name it: **Vendor Directory**
3. Copy columns L-V, rows 13-23 from original
4. Paste starting at A1
5. Fill in your actual vendor contacts

#### Create Sheet 4: Cost Tracker
1. Add another new sheet
2. Name it: **Cost Tracker**
3. Copy columns L-T, rows 25-30 from original
4. Paste starting at A1
5. Add rows as needed for tracking expenses

#### Create Sheet 5: Dashboard
1. Add final new sheet
2. Name it: **Dashboard**
3. Copy columns L-P, rows 33-66 from original
4. Paste starting at A1
5. The formulas will auto-populate once other sheets have data

### Step 3: Set Up Data Validation

Add dropdown menus for consistency:

**My Schedule - Status Column (E):**
1. Select column E (except header)
2. Go to **Data → Data validation**
3. Criteria: **List of items**
4. Items: `Not Started, In Progress, Done, Overdue, Skipped`
5. Check "Show dropdown list in cell"
6. Click **Save**

**Master Task List - Priority Column (D):**
1. Select column D (except header)
2. Data → Data validation
3. List of items: `High, Medium, Low`
4. Save

### Step 4: Add Conditional Formatting

**Color-code task status:**

1. Go to **My Schedule** sheet
2. Select range A2:I100
3. **Format → Conditional formatting**

**Rule 1 - Overdue Tasks:**
- Format cells if: **Custom formula is**
- Formula: `=AND(D2<TODAY(),E2<>"Done")`
- Formatting: Red background, bold white text

**Rule 2 - Completed Tasks:**
- Format cells if: **Text is exactly** → `Done`
- Formatting: Gray background, strikethrough text

**Rule 3 - High Priority:**
- Go to **Master Task List**
- Select column D
- Format cells if: **Text is exactly** → `High`
- Formatting: Light red background

### Step 5: Customize for Your Property

**Master Task List:**
- Review all 110 tasks
- Delete rows that don't apply to your property
- Adjust frequencies based on your climate
- Update estimated costs for your area

**My Schedule:**
- Copy only tasks from Master Task List that you need
- Set realistic due dates
- Start with high-priority items

**Vendor Directory:**
- Add all your service providers
- Include emergency contacts
- Rate vendors after each use

**Cost Tracker:**
- Log every maintenance expense
- Upload receipt photos to Drive and link
- Mark tax-deductible items

---

## 💡 HOW TO USE THE SYSTEM

### Weekly (5 minutes)
1. Open **Dashboard** — check for overdue tasks
2. Open **My Schedule** — update any completed tasks
3. Change status to "Done" and add completion date

### Monthly (15 minutes)
1. Review upcoming tasks in **My Schedule**
2. Contact vendors for scheduled maintenance
3. Update **Vendor Directory** with any new contacts
4. Check **Cost Tracker** for budget status

### After Each Maintenance Task
1. Update status in **My Schedule**
2. Add actual cost in **Cost Tracker**
3. Rate vendor in **Vendor Directory**
4. Upload receipt photo and link in Cost Tracker

### Quarterly (30 minutes)
1. Full **Dashboard** review
2. Analyze costs by category
3. Adjust upcoming task priorities
4. Update any outdated vendor info

### Year-End (1 hour)
1. Export **Cost Tracker** for tax preparation
2. Review total maintenance spending
3. Plan next year's major projects
4. Update emergency contact list

---

## 📱 ADVANCED FEATURES

### Linking Between Sheets
The system uses formulas to connect data:

- **Dashboard** pulls from **My Schedule** and **Cost Tracker**
- **Cost Tracker** references **Master Task List** for task names
- **Vendor Directory** links to tasks by category

### Mobile Access
1. Download Google Sheets app
2. Access all 5 sheets on your phone
3. Update tasks on-the-go
4. Take receipt photos and upload immediately

### Sharing with Team
- Share with co-hosts or property managers
- Set permissions: Can view or Can edit
- Everyone sees real-time updates

### Backup
- Google Sheets auto-saves
- Export to Excel quarterly as backup
- Download CSV copies before major changes

---

## 🎯 WHAT MAKES THIS PREMIUM

**vs. Simple Checklist ($10-15):**
- ❌ Static list of tasks
- ❌ No tracking
- ❌ No cost monitoring
- ❌ No vendor management

**This Pro System ($47-97):**
- ✅ 110 comprehensive tasks
- ✅ Linked data across 5 sheets
- ✅ Automated dashboard
- ✅ Cost tracking with tax documentation
- ✅ Vendor rating system
- ✅ Progress analytics
- ✅ Customizable for any property
- ✅ Scales to multiple properties

---

## 📞 SYSTEM REQUIREMENTS

- Google account (free)
- Google Sheets (free)
- Basic spreadsheet knowledge
- 30 minutes initial setup time

---

## ✅ SETUP CHECKLIST

- [ ] Made a copy of the sheet
- [ ] Created 5 separate sheets
- [ ] Renamed sheets correctly
- [ ] Set up data validation (dropdowns)
- [ ] Added conditional formatting
- [ ] Customized Master Task List for my property
- [ ] Copied relevant tasks to My Schedule
- [ ] Added my vendors to Vendor Directory
- [ ] Set due dates in My Schedule
- [ ] Verified Dashboard formulas work
- [ ] Tested mobile access
- [ ] Shared with team members (if applicable)

---

## 🚀 NEXT LEVEL: AUTOMATION

Want to add email reminders? You can extend this with Google Apps Script:

1. **Extensions → Apps Script**
2. Create weekly email summary
3. Get alerts for overdue tasks
4. Monthly cost reports

*(Requires some coding or hiring a developer)*

---

**Questions?** This system is designed to be self-explanatory, but the linked formulas make it powerful. Start simple, add complexity as you get comfortable.

**Remember:** Consistency beats perfection. Use it weekly, even if imperfectly.

---

*System Version: 2.0 Pro*
*Created: March 2026*
*Tasks: 110 | Sheets: 5 | Formulas: 25+*