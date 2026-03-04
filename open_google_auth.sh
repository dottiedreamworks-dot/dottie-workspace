#!/bin/bash
# Open Google OAuth authorization page

AUTH_URL="https://accounts.google.com/o/oauth2/v2/auth?client_id=453605019935-qihvugte3t8uv8nt5pk0k63v5ihqdfvv.apps.googleusercontent.com&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Fcallback&scope=openid+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcalendar.readonly+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fgmail.readonly+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fdrive.readonly+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fdocuments.readonly+https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fspreadsheets.readonly&response_type=code&access_type=offline&prompt=consent"

echo "Opening Google OAuth authorization page..."
xdg-open "$AUTH_URL" 2>/dev/null || open "$AUTH_URL" 2>/dev/null || echo "Please manually open this URL in your browser:"
echo "$AUTH_URL"