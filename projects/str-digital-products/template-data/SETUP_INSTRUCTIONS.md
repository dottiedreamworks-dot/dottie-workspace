# STR Maintenance System - Google Sheets Template

## 📦 What's Included

This package contains everything needed to set up your STR maintenance tracking system in Google Sheets.

## 📁 Files

### 1. Master Task List (CSV)
- **File:** `master-task-list.csv`
- **Contains:** 130 maintenance tasks with all details
- **Columns:** Task ID, Task Name, Category, Priority, Frequency, Est. Cost, Vendor Type, Season, Notes, Default Month

### 2. Dashboard Template (CSV)
- **File:** `dashboard-template.csv`
- **Contains:** Pre-formatted dashboard structure
- **Includes:** Formulas for stats and upcoming tasks

### 3. Setup Instructions
- **File:** `SETUP_INSTRUCTIONS.md` (this file)
- **Contains:** Step-by-step setup guide

## 🚀 Quick Setup (5 minutes)

### Step 1: Create Your Google Sheet
1. Go to [Google Sheets](https://sheets.google.com)
2. Click "Blank" to create new spreadsheet
3. Name it: "[Your Property Name] Maintenance System"

### Step 2: Import Master Task List
1. Click on "Sheet1" tab at bottom
2. Rename to "Master Task List"
3. Go to File → Import
4. Upload `master-task-list.csv`
5. Select "Replace current sheet"
6. Click "Import data"

### Step 3: Create Dashboard Sheet
1. Click "+" at bottom to add new sheet
2. Name it "Dashboard"
3. Copy contents from `dashboard-template.csv` into this sheet
4. Or manually create using the structure below

### Step 4: Create My Schedule Sheet
1. Add new sheet named "My Schedule"
2. Add these column headers in row 1:
   - A1: Task ID
   - B1: Task Name
   - C1: Category
   - D1: Due Date
   - E1: Status
   - F1: Date Completed
   - G1: Cost Actual
   - H1: Vendor Used
   - I1: Notes

3. Copy tasks from Master Task List that apply to your property
4. Set your first due dates

### Step 5: Create Vendor Directory
1. Add new sheet named "Vendor Directory"
2. Add these column headers:
   - A1: Vendor Name
   - B1: Category
   - C1: Contact Name
   - D1: Phone
   - E1: Email
   - F1: Website
   - G1: Address
   - H1: Hourly Rate
   - I1: Rating (1-5)
   - J1: Notes
   - K1: Last Used

3. Fill in your service providers

### Step 6: Create Cost Tracker
1. Add new sheet named "Cost Tracker"
2. Add these column headers:
   - A1: Date
   - B1: Task ID
   - C1: Task Name
   - D1: Vendor
   - E1: Description
   - F1: Cost
   - G1: Category
   - H1: Receipt Link
   - I1: Tax Deductible

## 🎨 Formatting (Optional but Recommended)

### Conditional Formatting

Set up these rules to color-code your tasks:

**Rule 1: High Priority Tasks**
- Apply to range: Master Task List!A:J
- Format cells if: Text contains "High" (Column D)
- Formatting: Light red background (#ffebee)

**Rule 2: Overdue Tasks**
- Apply to range: My Schedule!A:I
- Format cells if: Custom formula =AND(D2<TODAY(),E2<>"Done")
- Formatting: Red text bold

**Rule 3: Completed Tasks**
- Apply to range: My Schedule!A:I
- Format cells if: Text is exactly "Done" (Column E)
- Formatting: Gray text (#999999) with strikethrough

### Data Validation

Set up dropdown menus for consistency:

**My Schedule - Status Column (E)**
1. Select column E (except header)
2. Data → Data validation
3. Criteria: List of items
4. Items: Not Started, In Progress, Done, Overdue, Skipped
5. Check "Show dropdown list in cell"
6. Click "Save"

## 📊 Dashboard Formulas

If not using the template, add these formulas to your Dashboard sheet:

```
A1: "STR MAINTENANCE DASHBOARD"

A3: "Property Name:"
B3: [Type your property name]

A4: "Date Created:"
B4: =TODAY()

A5: "Last Updated:"
B5: =MAX('My Schedule'!F:F)

A7: "QUICK STATS"
A8: "Total Tasks:"
B8: =COUNTA('Master Task List'!A:A)-1

A9: "High Priority:"
B9: =COUNTIF('Master Task List'!D:D,"High")

A10: "Completed This Month:"
B10: =COUNTIFS('My Schedule'!E:E,"Done",'My Schedule'!F:F,">="&EOMONTH(TODAY(),-1)+1,'My Schedule'!F:F,"<="&EOMONTH(TODAY(),0))

A11: "Overdue Tasks:"
B11: =COUNTIFS('My Schedule'!D:D,"<"&TODAY(),'My Schedule'!E:E,"<>Done")

A13: "UPCOMING TASKS (Next 30 Days)"
A14: =QUERY('My Schedule'!A:I,"SELECT A, B, C, D WHERE D <= date '"&TEXT(TODAY()+30,"yyyy-mm-dd")&"' AND D >= date '"&TEXT(TODAY(),"yyyy-mm-dd")&"' AND E <> 'Done' ORDER BY D ASC LIMIT 10")
```

## 🔔 Optional: Email Reminders

For automated email reminders, you'll need to add Apps Script:

1. Extensions → Apps Script
2. Delete default code
3. Copy and paste code from `apps-script-email-reminders.js` (if provided)
4. Save project
5. Click clock icon (Triggers)
6. Add trigger: Choose function, Time-driven, Week timer, Every Monday, 9:00 AM
7. Authorize the script when prompted

**Note:** Free Google accounts can send 100 emails per day.

## 💡 Tips for Success

1. **Start Small:** Don't try to do all 130 tasks at once. Pick the high-priority items first.

2. **Set Realistic Due Dates:** Spread tasks throughout the year, don't cluster them.

3. **Use the Vendor Directory:** Having all your contacts in one place saves time.

4. **Track Costs:** Log expenses as they happen for accurate budgeting.

5. **Review Monthly:** Spend 10 minutes each month updating status and adjusting schedules.

6. **Customize:** Remove tasks that don't apply to your property. Add location-specific items.

## 🆘 Troubleshooting

**Formulas showing as text:**
- Make sure cells are formatted as "Automatic" not "Plain text"
- Select column → Format → Number → Automatic

**Dates displaying as numbers:**
- Select date column → Format → Number → Date

**Dropdown not working:**
- Make sure data validation is applied to the correct range
- Check for extra spaces in list items

**Import errors:**
- Make sure CSV is UTF-8 encoded
- Check that column headers match exactly

## 📞 Support

For questions or issues:
- Review the setup video (link provided separately)
- Check the FAQ in the main documentation
- Contact support via [your support email]

---

**Version:** 1.0
**Last Updated:** March 8, 2026
**License:** Personal use only. Do not distribute.