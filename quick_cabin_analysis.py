#!/usr/bin/env python3
"""
Quick cabin revenue analysis using gspread
"""
import gspread
from google.oauth2.service_account import Credentials
from google_auth_oauthlib.flow import InstalledAppFlow
import json
import os

# Scopes needed for Google Sheets
SCOPES = [
    'https://www.googleapis.com/auth/spreadsheets.readonly',
    'https://www.googleapis.com/auth/drive.readonly'
]

def get_credentials():
    """Get or create credentials"""
    creds_file = '/home/agent/.openclaw/workspace/credentials.json'
    token_file = '/home/agent/.openclaw/workspace/token.json'
    
    # Check if we have a saved token
    if os.path.exists(token_file):
        with open(token_file, 'r') as f:
            creds_info = json.load(f)
            return Credentials.from_authorized_user_info(creds_info, SCOPES)
    
    # Otherwise authenticate
    flow = InstalledAppFlow.from_client_secrets_file(creds_file, SCOPES)
    creds = flow.run_local_server(port=0)
    
    # Save token
    with open(token_file, 'w') as f:
        f.write(creds.to_json())
    
    return creds

def analyze_cabin_revenue():
    """Analyze cabin revenue from spreadsheet"""
    # Authenticate with Google
    creds = get_credentials()
    client = gspread.authorize(creds)
    
    # Open the spreadsheet using the ID from the URL
    SPREADSHEET_ID = '1i5r1WGEd5oMtP4N3fEzIOzy8jdUL8BCiPusBZYx6gZw'
    spreadsheet = client.open_by_key(SPREADSHEET_ID)
    
    # Get all worksheet names
    worksheets = spreadsheet.worksheets()
    print("Available worksheets:")
    for ws in worksheets:
        print(f"  - {ws.title}")
    
    # Find worksheets related to actual revenue and projections
    actual_ws = None
    proj_ws = None
    
    for ws in worksheets:
        title_lower = ws.title.lower()
        if 'actual' in title_lower or 'revenue' in title_lower:
            actual_ws = ws
            print(f"\nFound actual revenue sheet: {ws.title}")
        if 'projection' in title_lower or 'proj' in title_lower:
            proj_ws = ws
            print(f"Found projection sheet: {ws.title}")
    
    # If we didn't find specific sheets, try the first few
    if not actual_ws and len(worksheets) > 0:
        actual_ws = worksheets[0]
        print(f"\nUsing first sheet as actual revenue: {actual_ws.title}")
    
    if not proj_ws and len(worksheets) > 1:
        proj_ws = worksheets[1]
        print(f"Using second sheet as projection: {proj_ws.title}")
    
    # Get data from actual revenue sheet
    print(f"\n{'='*60}")
    print(f"ACTUAL REVENUE - {actual_ws.title}")
    print(f"{'='*60}")
    actual_data = actual_ws.get_all_values()
    print(f"Total rows: {len(actual_data)}")
    print(f"Total columns: {len(actual_data[0]) if actual_data else 0}")
    
    # Print first few rows to understand structure
    print("\nFirst 5 rows:")
    for i, row in enumerate(actual_data[:5]):
        print(f"Row {i}: {row[:10]}")  # First 10 columns
    
    # Analyze actual revenue data
    total_actual = 0
    property_actuals = {}
    
    # Assuming row 0 is headers, data starts at row 1
    # Assuming column 0 is property name, column 1 is revenue
    for i, row in enumerate(actual_data[1:], 1):
        if len(row) >= 2 and row[1]:
            try:
                # Try to parse as float, removing $ and commas
                revenue_str = str(row[1]).replace('$', '').replace(',', '').strip()
                if revenue_str:
                    revenue = float(revenue_str)
                    property_name = row[0] if row[0] else f"Property_{i}"
                    total_actual += revenue
                    property_actuals[property_name] = revenue
            except (ValueError, TypeError):
                pass
    
    print(f"\nTotal Actual Revenue: ${total_actual:,.2f}")
    print("\nBy Property:")
    for prop, rev in sorted(property_actuals.items()):
        print(f"  {prop}: ${rev:,.2f}")
    
    # Get data from projection sheet
    print(f"\n{'='*60}")
    print(f"PROJECTED REVENUE - {proj_ws.title}")
    print(f"{'='*60}")
    proj_data = proj_ws.get_all_values()
    print(f"Total rows: {len(proj_data)}")
    print(f"Total columns: {len(proj_data[0]) if proj_data else 0}")
    
    # Print first few rows
    print("\nFirst 5 rows:")
    for i, row in enumerate(proj_data[:5]):
        print(f"Row {i}: {row[:10]}")
    
    # Analyze projection data
    total_projected = 0
    property_projected = {}
    
    for i, row in enumerate(proj_data[1:], 1):
        if len(row) >= 2 and row[1]:
            try:
                revenue_str = str(row[1]).replace('$', '').replace(',', '').strip()
                if revenue_str:
                    revenue = float(revenue_str)
                    property_name = row[0] if row[0] else f"Property_{i}"
                    total_projected += revenue
                    property_projected[property_name] = revenue
            except (ValueError, TypeError):
                pass
    
    print(f"\nTotal Projected Revenue: ${total_projected:,.2f}")
    print("\nBy Property:")
    for prop, rev in sorted(property_projected.items()):
        print(f"  {prop}: ${rev:,.2f}")
    
    # Comparison
    print(f"\n{'='*60}")
    print("COMPARISON")
    print(f"{'='*60}")
    diff = total_actual - total_projected
    pct = (diff / total_projected * 100) if total_projected else 0
    print(f"Difference: ${diff:,.2f} ({pct:+.1f}%)")
    
    # Property-level comparison
    print("\nBy Property:")
    all_properties = set(property_actuals.keys()) | set(property_projected.keys())
    for prop in sorted(all_properties):
        actual = property_actuals.get(prop, 0)
        proj = property_projected.get(prop, 0)
        diff_prop = actual - proj
        pct_prop = (diff_prop / proj * 100) if proj else 0
        status = "✓" if diff_prop >= 0 else "✗"
        print(f"  {prop}: Actual ${actual:,.0f} | Proj ${proj:,.0f} | Diff ${diff_prop:,.0f} ({pct_prop:+.1f}%) {status}")

if __name__ == '__main__':
    analyze_cabin_revenue