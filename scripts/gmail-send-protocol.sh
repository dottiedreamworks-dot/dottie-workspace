#!/bin/bash
# Dottie-AI Gmail Send Protocol
# Requires explicit operator approval

WORKSPACE="/root/.openclaw/workspace"
DRAFT_FILE="$1"
GUARDRAIL_LOG="$WORKSPACE/.logs/guardrail-actions.log"

source "$WORKSPACE/.env"

if [ -z "$DRAFT_FILE" ] || [ ! -f "$DRAFT_FILE" ]; then
    echo "Usage: $0 [draft-email-file]"
    echo ""
    echo "Draft file format:"
    echo "TO: recipient@example.com"
    echo "SUBJECT: Subject line"
    echo "---"
    echo "Email body here..."
    exit 1
fi

# Parse draft
TO=$(grep "^TO:" "$DRAFT_FILE" | cut -d: -f2- | xargs)
SUBJECT=$(grep "^SUBJECT:" "$DRAFT_FILE" | cut -d: -f2- | xargs)
BODY=$(sed '0,/^---$/d' "$DRAFT_FILE")

echo "📧 EMAIL DRAFT PREPARED"
echo ""
echo "To:      $TO"
echo "Subject: $SUBJECT"
echo "---"
echo "$BODY"
echo "---"
echo ""

# GUARDRAIL: NEVER send without explicit approval
echo "🔒 GUARDRAIL ENFORCED"
echo ""
echo "This email CANNOT be sent without explicit operator approval."
echo ""
echo "To send, operator must reply with:"
echo "   'Yes, send this email'"
echo ""
echo "To save as draft, operator must reply with:"
echo "   'Save as draft'"
echo ""
echo "To discard, operator must reply with:"
echo "   'Discard email'"

# Log the draft for approval
echo "[$(date)] EMAIL_DRAFT_AWAITING_APPROVAL: $TO | $SUBJECT" >> "$GUARDRAIL_LOG"

# In autonomous mode, this would queue for next operator interaction
# The approval would be checked and processed during heartbeat
