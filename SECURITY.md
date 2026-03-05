# Security Hardening Plan
**Created:** March 4, 2026
**Analyst:** Dottie-AI
**Status:** Draft — Implementation Pending

---

## Executive Summary

**Current Grade:** B+
**Risk Level:** MEDIUM (acceptable for personal/single-user use)
**Primary Concerns:** Token longevity, breadth of access, no encryption

**Goal:** Implement enterprise-grade security practices for personal AI workspace.

---

## Threat Model

### Assets to Protect
1. Dropbox account (full personal storage)
2. Google Workspace (Gmail, Drive, Calendar)
3. Notion workspace (personal projects)
4. GitHub account (if connected)
5. Workspace files and configurations

### Threat Actors
- **Script kiddies:** Automated attacks on exposed APIs
- **Container escape:** If host environment is compromised
- **Token leak:** Accidental exposure in logs/screenshots
- **Insider threat:** (Jayna's own family/others with access)

---

## PHASE 1: Immediate Actions (This Week)

### 1.1 Token Rotation Schedule
**Priority:** CRITICAL
**Effort:** 15 minutes per token
**Responsibility:** Jayna (manual)

**Actions:**
1. Create calendar reminder: "Rotate API tokens" — quarterly (every 90 days)
   - Next rotation: June 4, 2026
2. Set phone reminder 1 week before
3. Document rotation process

**For Dropbox:**
```
1. Go to dropbox.com/developers
2. Find "Dottie-AI" app
3. Generate new token
4. Update .env file
5. Test connection
6. Revoke old token
```

### 1.2 Scope Restriction for Dropbox
**Priority:** HIGH
**Trade-off:** Less convenient, more secure

**Current:** Full Dropbox access (all folders)
**Recommended:** App folder access only (isolated folder)

**Creates:** `Apps/Dottie-AI/` (isolated)
**Benefit:** If token leaked, attacker only sees app folder, not personal photos/documents

### 1.3 Create Master Password
**Priority:** HIGH
**Effort:** 30 minutes

Encrypt .env file with password:
```bash
openssl enc -aes-256-cbc -salt -in .env -out .env.enc
rm .env

# To decrypt:
openssl enc -aes-256-cbc -d -in .env.enc -out .env
```

---

## PHASE 2: Short-Term (Next 30 Days)

### 2.1 Activity Logging
Track security events:
- Token usage
- File uploads >10MB
- Email drafts created
- Failed authentication attempts
- Security audit log: `.logs/security-audit.log`

### 2.2 Backup Strategy
```bash
# Monthly encrypted backup
tar czf - /root/.openclaw/workspace/.env | gpg -c > ~/secure-backup/dottie-env-backup.tar.gz.gpg
```

---

## PHASE 3: Long-Term (Next 90 Days)

### 3.1 Service Account Migration
Migrate from personal OAuth to isolated service accounts for professional-grade access control.

### 3.2 Principle of Least Privilege
Audit and reduce Google permissions:
- Current: `gmail.modify`, `calendar`, `drive` (full access)
- Target: Minimal scopes only

---

## Incident Response Plan

### If Token Compromised (0-5 min)
1. REVOKE token immediately at provider
2. Notify Dottie
3. Generate new tokens
4. Test connections
5. Audit logs for unauthorized access

### Revoke URLs (Emergency)
- Dropbox: dropbox.com/account/security
- Google: myaccount.google.com/security
- Notion: notion.so/my-integrations

---

## Security Checklist

### Weekly (5 min)
- [ ] Review recent Git commits for anomalies
- [ ] Check `.logs/` for unusual activity

### Monthly (15 min)
- [ ] Review token last-used dates
- [ ] Verify backups exist

### Quarterly (30 min)
- [ ] Rotate all tokens
- [ ] Test restore from backup

---

## Decisions Needed from Jayna

### Priority 1 (This Week)
1. Set calendar reminder for token rotation (every 90 days)?
2. Restrict Dropbox to app-folder only? (Y/N)
3. Encrypt .env with master password? (Y/N)

### Priority 2 (Next 30 Days)
4. Implement activity logging? (Y/N)
5. Create offline backups? (Y/N)

---

**Status:** Plan created, awaiting Jayna's decisions
**Last Updated:** 2026-03-04
