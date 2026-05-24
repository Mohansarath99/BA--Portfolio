# User Stories — Sprints 3, 4 & 5
## On-Premise to Cloud CRM Migration — Home Equity Bank

**Business Analyst:** Mohan Sarath Ayinabathini
**Sprints Covered:** Sprint 3 (Data Migration), Sprint 4 (Validation), Sprint 5 (UAT)
**Project:** On-Premise to Cloud CRM Migration
**Tool:** JIRA

---

## Sprint 3 — Data Migration & Lead Automation
**Sprint Goal:** Complete lead capture automation and begin data migration load
**Duration:** January 12 – January 23, 2026
**Team Capacity:** 42 story points

---

### Epic EP-003: Customer Data Migration

---

**US-301 | Automated Lead Capture from Web Forms**

> **As a** Sales Operations Manager,
> **I want** all leads from our website and campaign forms to automatically appear in Salesforce,
> **So that** no leads are missed and manual email forwarding is eliminated.

**Acceptance Criteria:**
- [ ] All web form submissions create a new lead record in Salesforce within 30 seconds
- [ ] Mandatory fields (name, email, phone, product interest) enforced at form level
- [ ] Duplicate check runs automatically on email address at lead creation
- [ ] Lead source field auto-populated based on form origin
- [ ] Failed submissions trigger an alert to the admin team

**Story Points:** 8
**Priority:** Must Have
**Status:** Done ✅

---

**US-302 | Rules-Based Lead Assignment Engine**

> **As a** Sales Manager,
> **I want** leads to be automatically assigned to the right sales rep based on territory and product type,
> **So that** every lead reaches the right person within 60 seconds and no leads fall through the cracks.

**Acceptance Criteria:**
- [ ] Assignment rules configured for 4 territories: Toronto, GTA, Ontario, National
- [ ] Product-based routing: Mortgage leads → Mortgage team, HELOC → HELOC team
- [ ] If no matching rule found, lead assigned to team manager queue
- [ ] Assignment timestamp recorded on every lead record
- [ ] Sales rep receives email + in-app notification within 60 seconds of assignment

**Story Points:** 13
**Priority:** Must Have
**Status:** Done ✅

---

**US-303 | Legacy Customer Record Migration — Batch 1**

> **As a** Data Governance Lead,
> **I want** all active customer records from the legacy system loaded into Salesforce with full data integrity,
> **So that** the sales team can continue working without disruption after go-live.

**Acceptance Criteria:**
- [ ] All 50,000+ active records migrated from legacy CSV export
- [ ] Zero records dropped during migration — reconciliation count matches source
- [ ] All mandatory fields populated on 100% of migrated records
- [ ] Account balances reconcile within $0.01 tolerance
- [ ] Migration audit log generated and reviewed by Data Steward
- [ ] Duplicate records flagged and resolved before load

**Story Points:** 13
**Priority:** Must Have
**Status:** Done ✅

---

### Epic EP-004: Real-Time Reporting

---

**US-304 | Sales Manager Real-Time Pipeline Dashboard**

> **As a** Sales Manager,
> **I want** a live dashboard showing my team's lead pipeline, conversion rates, and response times,
> **So that** I can make informed decisions every day without waiting for a Friday email report.

**Acceptance Criteria:**
- [ ] Dashboard loads within 3 seconds on any device
- [ ] Shows: total leads, conversion rate, average response time, leads by status
- [ ] Filters available for: date range, rep name, territory, product type
- [ ] Data refreshes automatically every 15 minutes
- [ ] Exportable to PDF and Excel formats
- [ ] Accessible on mobile devices

**Story Points:** 8
**Priority:** Must Have
**Status:** Done ✅

---

## Sprint 4 — Data Validation & Integration Testing
**Sprint Goal:** Validate migrated data integrity and complete integration testing
**Duration:** January 26 – February 6, 2026
**Team Capacity:** 38 story points

---

**US-401 | Post-Migration Data Quality Validation**

> **As a** Data Governance Lead,
> **I want** a full validation report comparing migrated data in Salesforce against the legacy source,
> **So that** I can confirm data integrity before UAT begins and sign off with confidence.

**Acceptance Criteria:**
- [ ] Record count in Salesforce matches source export count exactly
- [ ] All key fields (name, email, phone, account balance) validated field by field
- [ ] Any discrepancies flagged with severity rating: Critical, High, Medium, Low
- [ ] Validation report delivered to Data Governance Lead within 48 hours of migration load
- [ ] All Critical and High discrepancies resolved before UAT start

**Story Points:** 8
**Priority:** Must Have
**Status:** Done ✅

---

**US-402 | Role-Based Access Control Validation**

> **As a** Compliance Officer,
> **I want** to verify that each user role can only access data they are permitted to see,
> **So that** we comply with PIPEDA data privacy requirements and internal access policies.

**Acceptance Criteria:**
- [ ] Sales reps can view and edit their own leads only
- [ ] Sales managers can view all team leads, cannot edit other teams
- [ ] Admin can access all records but cannot delete without approval
- [ ] Compliance team has read-only access to all records
- [ ] Access control test cases executed and signed off by Compliance Officer

**Story Points:** 5
**Priority:** Must Have
**Status:** Done ✅

---

**US-403 | Automated Follow-Up Task Creation**

> **As a** Sales Rep,
> **I want** the system to automatically create a follow-up task when a lead is assigned to me,
> **So that** I never miss a follow-up and leads don't go cold.

**Acceptance Criteria:**
- [ ] Follow-up task created automatically within 5 minutes of lead assignment
- [ ] Default due date set to 24 hours after assignment
- [ ] Task appears in rep's JIRA task list and Salesforce task view
- [ ] Reminder notification sent 2 hours before task due date
- [ ] Overdue tasks escalated to sales manager automatically

**Story Points:** 5
**Priority:** Must Have
**Status:** Done ✅

---

## Sprint 5 — UAT & Go-Live Preparation
**Sprint Goal:** Execute full UAT, resolve all defects, obtain stakeholder sign-off
**Duration:** February 9 – February 20, 2026
**Team Capacity:** 35 story points

---

**US-501 | End-to-End Lead Lifecycle UAT**

> **As a** Product Owner,
> **I want** the full lead lifecycle tested by real business users in a UAT environment,
> **So that** we confirm the system works as expected before go-live and avoid post-launch disruption.

**Acceptance Criteria:**
- [ ] All 42 UAT test cases executed by business users
- [ ] Pass rate of 95% or above achieved before sign-off
- [ ] All Critical defects resolved before go-live
- [ ] All High defects either resolved or have approved workarounds
- [ ] UAT sign-off obtained from Product Owner, VP Sales, and Compliance Officer
- [ ] Go/No-Go decision documented in steering committee meeting minutes

**Story Points:** 13
**Priority:** Must Have
**Status:** Done ✅

---

**US-502 | User Training & Change Management**

> **As a** Sales Operations Manager,
> **I want** all 120 end users trained on the new Salesforce system before go-live,
> **So that** adoption is smooth and productivity is not impacted during the transition.

**Acceptance Criteria:**
- [ ] Training sessions delivered to all 120 users across 6 sessions
- [ ] Quick reference guide distributed to all users
- [ ] Training completion tracked — 100% completion before go-live
- [ ] Hypercare support team available for first 2 weeks post go-live
- [ ] Post-training survey score of 4/5 or above

**Story Points:** 8
**Priority:** Must Have
**Status:** Done ✅

---

## Sprint Velocity Summary

| Sprint | Planned Points | Completed Points | Velocity |
|---|---|---|---|
| Sprint 3 | 42 | 42 | 100% ✅ |
| Sprint 4 | 38 | 38 | 100% ✅ |
| Sprint 5 | 35 | 35 | 100% ✅ |
| **Total** | **115** | **115** | **100% ✅** |
