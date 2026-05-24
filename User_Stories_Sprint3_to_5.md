# User Stories — Sprints 3 to 5
## CRM Migration | Home Equity Bank

**BA:** Mohan Sarath Ayinabathini
**Tool:** JIRA
**Note:** Sprint 3 was extended by 8 days due to data cleansing scope expansion. Stories below reflect the adjusted sprint boundaries.

---

## Sprint 3 — Data Migration Load & Lead Automation
**Original Dates:** Jan 12 – Jan 23, 2026
**Actual End Date:** Jan 31, 2026 (extended — see note below)
**Planned Points:** 44 | **Completed:** 37 | **Carried Over:** 7

> **Sprint 3 Note:** We discovered during the data cleansing sprint that ~18% of source records had quality issues — significantly higher than the 8% we'd estimated from the initial 5% sample profile. The team made the call to extend Sprint 3 rather than migrate dirty data. US-303 and US-304 were partially completed and carried into Sprint 4. This was the right call but it pushed our go-live forecast back by 2 weeks. I updated the project plan and communicated the impact to the steering committee the same day.

---

### US-301 | Web Form Lead Auto-Capture
**Epic:** EP-003 — Lead Management Automation

> **As a** Sales Operations Manager,
> **I want** leads from our website contact forms to appear automatically in Salesforce,
> **So that** the admin team stops spending 2+ hours a day manually forwarding emails and reps receive leads faster.

**Acceptance Criteria:**
- [ ] Web form submission creates a Salesforce lead record within 45 seconds
- [ ] Mandatory fields (first name, last name, email, phone, product interest) enforced at form level
- [ ] Incomplete submissions rejected with a clear error message to the user
- [ ] Lead source field auto-populated based on form URL origin
- [ ] If Salesforce API is unavailable, submission queued and retried — not lost
- [ ] Duplicate check on email runs at creation — flags but does not block

**Story Points:** 8 | **Priority:** Must Have | **Status:** Done ✅
**Notes:** API timeout issue found in testing — dev added retry logic. Retested and passed.

---

### US-302 | Territory-Based Lead Assignment
**Epic:** EP-003 — Lead Management Automation

> **As a** Sales Manager,
> **I want** new leads automatically routed to the right sales rep based on the customer's postal code and product type,
> **So that** reps stop getting leads that aren't relevant to their territory and no leads sit unassigned in a shared inbox.

**Acceptance Criteria:**
- [ ] Assignment rules configured for 4 territories: Toronto Core, GTA, Ontario-Wide, National
- [ ] Mortgage leads routed to Mortgage team; HELOC leads routed to HELOC team
- [ ] Lead with no matching rule goes to the relevant manager queue — not dropped
- [ ] Assignment completes within 60 seconds of lead creation
- [ ] Rep receives email notification and in-app alert at assignment
- [ ] Assignment timestamp and assigned-to field logged on lead record

**Story Points:** 13 | **Priority:** Must Have | **Status:** Done ✅
**Notes:** Edge case found — leads with PO Box addresses had no postal code match. Added fallback rule to route these to manager queue. Raised as known limitation in sprint review.

---

### US-303 | Active Customer Record Migration — Batch Load
**Epic:** EP-004 — Data Migration

> **As a** Data Governance Lead,
> **I want** all active customer records from the legacy database loaded into Salesforce with their key fields intact,
> **So that** the sales team can continue working in the new system from day one without losing customer history.

**Acceptance Criteria:**
- [ ] All active records from legacy export migrated — pre and post counts must match
- [ ] Mandatory fields populated on all records: name, email, account type, account status
- [ ] Account balances reconcile to source within $0.01 tolerance
- [ ] Duplicate records identified and resolved before load — not after
- [ ] Migration audit log generated and reviewed by Data Governance Lead before go-live sign-off
- [ ] Pre-2018 inactive records confirmed archived, not migrated

**Story Points:** 13 | **Priority:** Must Have | **Status:** Partially Done — Carried to Sprint 4 ⚠️
**Notes:** Data cleansing took longer than scoped. Migration load completed for 31,000 records in Sprint 3. Remaining ~17,900 records carried to Sprint 4 after cleansing completion. Zero data loss on completed batch.

---

### US-304 | Sales Manager Pipeline Dashboard
**Epic:** EP-005 — Reporting

> **As a** Sales Manager,
> **I want** a live dashboard showing my team's leads by status, conversion rate, and average response time,
> **So that** I can manage the team's performance in real time instead of waiting for a manual report every Friday.

**Acceptance Criteria:**
- [ ] Dashboard shows: total leads, open leads, converted leads, conversion rate %, avg response time
- [ ] Filters: date range, rep name, territory, product type
- [ ] Data refreshes every 15 minutes from live Salesforce data
- [ ] Loads within 4 seconds on standard broadband connection
- [ ] Export to Excel available from dashboard header
- [ ] Manager sees their team's data only — not other teams

**Story Points:** 10 | **Priority:** Must Have | **Status:** Carried to Sprint 4 ⚠️
**Notes:** Deprioritized during sprint to allow team capacity for data cleansing extension. Completed in Sprint 4.

---

## Sprint 4 — Migration Completion & Reporting Build
**Dates:** Feb 2 – Feb 13, 2026
**Planned Points:** 41 | **Completed:** 38 | **Velocity:** 93%

> **Sprint 4 Note:** Carried over US-303 and US-304 from Sprint 3. Both completed. One story (US-403) descoped mid-sprint after the business confirmed they didn't need overdue escalation in Phase 1 — moved to backlog for Phase 2.

---

### US-401 | Post-Migration Data Validation Report
**Epic:** EP-004 — Data Migration

> **As a** Data Governance Lead,
> **I want** a full comparison report showing source record counts against what landed in Salesforce,
> **So that** I can confirm the migration is complete and accurate before I sign off on UAT starting.

**Acceptance Criteria:**
- [ ] Report shows record count by account type: source vs target
- [ ] Flags any accounts where balance variance exceeds $0.01
- [ ] Lists all records excluded from migration and reason for exclusion
- [ ] Report delivered within 48 hours of migration load completion
- [ ] All Critical and High discrepancies resolved before UAT kick-off

**Story Points:** 8 | **Priority:** Must Have | **Status:** Done ✅
**Notes:** Found 14 records with formatting issues on account type field. Corrected and reloaded. Final report showed clean reconciliation.

---

### US-402 | Role-Based Access Control
**Epic:** EP-006 — Security & Compliance

> **As a** Compliance Officer,
> **I want** each user role in Salesforce to be restricted to only the data they're permitted to see,
> **So that** we're compliant with PIPEDA and our internal data access policy from day one.

**Acceptance Criteria:**
- [ ] Sales reps: view and edit own leads only
- [ ] Sales managers: view all team leads, edit own team, read-only on others
- [ ] Admin: full access, cannot delete records without approval workflow
- [ ] Compliance role: read-only across all records, no edit capability
- [ ] Access control test cases signed off by Compliance Officer before UAT

**Story Points:** 5 | **Priority:** Must Have | **Status:** Done ✅
**Notes:** Initially built 3 roles. Compliance Officer requested a 4th read-only role mid-sprint. Added — no significant impact to timeline.

---

## Sprint 5 — UAT & Go-Live Prep
**Dates:** Feb 16 – Mar 6, 2026 (3-week sprint — extended to accommodate UAT scheduling)
**Planned Points:** 32 | **Completed:** 29 | **Velocity:** 91%

> **Sprint 5 Note:** UAT took 3 weeks instead of 2 because two stakeholders were unavailable for the originally scheduled sessions due to Q4 budget reviews. We ran UAT in focused half-day sessions to work around schedules. 3 low-priority stories moved to Sprint 6.

---

### US-501 | End-to-End UAT Execution
**Epic:** EP-007 — UAT & Go-Live

> **As a** Product Owner,
> **I want** the full system tested by real business users before we go live,
> **So that** we catch anything the dev and QA teams missed and the business is confident in what they're signing off on.

**Acceptance Criteria:**
- [ ] All planned test cases executed by named business testers
- [ ] Pass rate of 90% or above achieved before go-live decision
- [ ] All Critical defects resolved — no exceptions
- [ ] High defects either resolved or have documented workarounds approved by Product Owner
- [ ] Go/No-Go sign-off documented from VP Sales, Product Owner, and Compliance Officer

**Story Points:** 13 | **Priority:** Must Have | **Status:** Done ✅
**Notes:** Final pass rate 93.2%. 6 defects raised. 4 resolved. 2 deferred to Sprint 6 with approved workarounds. Go-live approved March 6.

---

### US-502 | End User Training
**Epic:** EP-007 — UAT & Go-Live

> **As a** Sales Operations Manager,
> **I want** all reps and managers trained on Salesforce before go-live,
> **So that** the team can work productively from day one and we don't lose leads during the transition.

**Acceptance Criteria:**
- [ ] Training sessions delivered to all ~115 active users
- [ ] Quick reference guide available in SharePoint before go-live
- [ ] Training completion tracked — target 90% before go-live, 100% by end of week 2
- [ ] Post-training feedback score of 3.8/5 or above (based on 5-point survey)

**Story Points:** 8 | **Priority:** Must Have | **Status:** Done ✅
**Notes:** 89% completion before go-live — just under 90% target. 3 reps were on leave. 100% achieved by March 20. Post-training score 4.1/5.

---

## Sprint Velocity Summary

| Sprint | Planned | Delivered | Velocity | Notes |
|---|---|---|---|---|
| Sprint 3 | 44 | 37 | 84% | Extended 8 days — data cleansing scope increase |
| Sprint 4 | 41 | 38 | 93% | 1 story descoped by business |
| Sprint 5 | 32 | 29 | 91% | 3 stories moved to Sprint 6 — UAT scheduling |
