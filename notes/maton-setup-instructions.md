# Maton.ai Setup Guide for Dottie

**Purpose:** Enable full Google Sheets API access including formatting, conditional formatting, and automated styling

**Date:** March 8, 2026

**Status:** Awaiting Jayna's action (Steps 1-3)

---

## What is Maton.ai?

Maton.ai is an OAuth connection management service that allows AI agents (like me!) to securely connect to SaaS tools including Google Workspace, Notion, Slack, Airtable, and more.

**For our use case:** It will give me full API access to Google Sheets so I can:
- Apply conditional formatting automatically
- Bold headers and style cells
- Auto-resize columns
- Create new sheets programmatically
- Build fully automated STR Maintenance System without manual formatting

---

## Setup Steps (Jayna needs to do Steps 1-3)

### Step 1: Sign Up for Maton.ai

1. Go to: **https://www.maton.ai/**
2. Click "Sign Up" or "Get Started"
3. Create an account with your email
4. Verify your email address

**Time required:** 2-3 minutes

---

### Step 2: Get Your API Key

1. Log into your Maton.ai dashboard
2. Navigate to **Settings** or **API Keys**
3. Generate a new API key
4. Copy the key (it will look like: `maton_xxxxxxxxxxxx`)

**Important:** Keep this key secure - treat it like a password

**Time required:** 1 minute

---

### Step 3: Connect Your Google Account

1. In the Maton.ai dashboard, find **Connections** or **Integrations**
2. Click **Google Sheets** (or Google Workspace)
3. Click **Connect**
4. You'll be redirected to Google's OAuth screen
5. Sign in with the Google account you use for Sheets
6. Grant permissions for:
   - View and manage your spreadsheets
   - View and manage Google Drive files

**Time required:** 2 minutes

---

### Step 4: Give Dottie the API Key

Once you've completed steps 1-3, simply tell me:

> "My Maton API key is: maton_xxxxxxxxxxxx"

I'll handle the rest:
- Add it to the .env file
- Test the connection
- Verify formatting capabilities

---

## What Happens After Setup?

Once Maton is connected, I can:

1. **Build the STR Maintenance System** with full formatting
   - Color-coded priority levels
   - Auto-bold headers
   - Conditional formatting for overdue tasks
   - Professional styling

2. **Create any Google Sheet** programmatically
   - No more manual formatting
   - Consistent styling across all sheets
   - Automated data entry with formatting

3. **Update existing sheets**
   - Add formatting to current sheets
   - Restructure data with styling
   - Generate reports with visual formatting

---

## Security Notes

- Maton uses OAuth 2.0 (the same secure method used by thousands of apps)
- I only get the permissions you explicitly grant
- You can revoke access anytime from your Google Account settings
- The API key is stored locally in your workspace .env file (never shared)

---

## Cost

Maton.ai has a free tier that should cover our needs. If we need higher limits later, paid plans are available.

---

## Questions?

If you run into any issues during setup, just ask me and I'll help troubleshoot!

---

**Next Action Needed:** Jayna to complete Steps 1-3 above

**Estimated Total Time:** 5-10 minutes
