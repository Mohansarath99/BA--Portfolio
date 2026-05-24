# Business Requirements Document
## CRM Migration — Home Equity Bank

**Doc ID:** BRD-HEB-001
**Version:** 1.4
**BA:** Mohan Sarath Ayinabathini
**Status:** Approved — October 22, 2025
**Last Updated:** November 3, 2025 (v1.4 — scope clarification on access control)

> **Note:** Version 1.3 was rejected at the first review because the access control requirements weren't specific enough. The Compliance team flagged this and we had to go back and run an additional workshop before v1.4 was signed off. Lesson learned — involve Compliance earlier in the process.

---

## 1. Why We're Doing This

The short version: the current system isn't working.

Sales reps are managing leads in personal spreadsheets. Managers don't know what's in the pipeline until Friday when someone manually compiles a report. Leads are getting lost because there's no follow-up tracking. And the data quality in the legacy system is bad enough that we've had cases where the same customer appears three or four times with slightly different information.

We've been losing ground to competitors who have better visibility into their sales funnel. The VP of Sales escalated this to leadership in Q2 2025, and the decision was made to migrate to Salesforce by end of Q1 2026.

---

## 2. What We're Trying to Achieve

| Objective | How We'll Know It Worked |
|---|---|
| Fix the lead assignment problem | Leads auto-assigned within 60 seconds, no manual forwarding |
| Clean up the data | Data quality score above 93% post-migration |
| Give managers real visibility | Live dashboards, no more Friday email reports |
| Speed up lead response | Average response time under 4 hours (stretch goal: under 2 hours) |
| Reduce manual reporting | At least 3 hours/week saved per manager |

I want to be upfront — the response time target is aggressive. The current average is 48–72 hours. Getting to under 4 hours is realistic with automation. Under 2 hours is possible but depends heavily on rep adoption of the new system.

---

## 3. Scope

### In Scope
- Migration of active customer records from the legacy system to Salesforce
- Automated lead capture from web forms and campaign tools
- Rules-based lead assignment by territory and product type
- Follow-up task automation and reminders
- Role-based access control (4 user roles: Rep, Manager, Admin, Compliance)
- Real-time dashboards for Sales Managers
- UAT coordination and go-live support

### Out of Scope
The following came up in workshops but were pushed to Phase 2 after scope discussion with the project sponsor:
- Mobile app development
- Third-party data feed integrations
- AI-based lead scoring
- Pre-2018 inactive record migration (to be archived separately)

---

## 4. Stakeholders

| Name / Role | Department | What They Care About |
|---|---|---|
| VP Sales (Project Sponsor) | Sales | Speed, conversion rate, pipeline visibility |
| Product Owner | Technology | Delivery timeline, backlog prioritization |
| IT Lead | Technology | System stability, integration design |
| Data Governance Lead | Risk & Compliance | Data quality, audit trails, PIPEDA compliance |
| Sales Managers (x3) | Sales | Dashboard visibility, team reporting |
| Compliance Officer | Risk & Compliance | Access controls, audit logging |
| End Users (~115 reps) | Sales & Operations | Ease of use, minimal disruption |

Getting alignment across Sales and Compliance was the hardest part of this phase. They had genuinely different priorities and I had to facilitate two additional workshops to get to a version of the access control model everyone could live with.

---

## 5. Business Requirements

### Lead Management

| ID | Requirement | Priority | Notes |
|---|---|---|---|
| BR-001 | All leads from web forms auto-captured in Salesforce | Must Have | Currently done manually via email |
| BR-002 | Mandatory fields enforced at lead creation | Must Have | Name, email, phone, product type |
| BR-003 | Leads auto-assigned based on territory and product rules | Must Have | Rules to be defined with Sales Managers in Sprint 1 |
| BR-004 | Rep notified within 60 seconds of assignment | Must Have | Email + in-app |
| BR-005 | Follow-up task auto-created at assignment | Must Have | Default due date 24 hours |
| BR-006 | Duplicate leads flagged on email match | Must Have | Rep prompted to review, not auto-merged |
| BR-007 | Unmatched leads routed to manager queue | Should Have | Fallback when no rule matches |

### Data Migration

| ID | Requirement | Priority | Notes |
|---|---|---|---|
| BR-008 | All active records migrated from legacy system | Must Have | ~48,900 records based on initial profile |
| BR-009 | Zero records lost in migration | Must Have | Pre and post counts must match |
| BR-010 | Account balances reconcile within $0.01 | Must Have | Finance sign-off required |
| BR-011 | Full audit log of migration changes | Must Have | Compliance requirement |
| BR-012 | Duplicate records resolved before load | Must Have | Not after — learned this the hard way on a previous project |

### Reporting

| ID | Requirement | Priority | Notes |
|---|---|---|---|
| BR-013 | Real-time lead pipeline dashboard for managers | Must Have | |
| BR-014 | Automated weekly and monthly reports | Must Have | Replace manual Friday report |
| BR-015 | Role-based data access — reps see own data only | Must Have | Compliance non-negotiable |
| BR-016 | Export to Excel from all dashboards | Should Have | Managers asked for this specifically |

---

## 6. Assumptions and Constraints

**Assumptions:**
- IT will provide legacy data export in CSV format by end of Week 3
- Salesforce licenses for ~120 users procured before Sprint 1 starts
- Business users will commit to UAT sessions in Sprint 5 (this was a risk — see below)
- Data cleansing will be completed before migration load (we built a sprint for this)

**Constraints:**
- Go-live target is end of February 2026
- Cannot disrupt active sales operations during migration
- Must comply with PIPEDA

**Risks I flagged at this stage:**
- Source data quality was unknown at BRD sign-off — we'd only profiled a 5% sample
- UAT stakeholder availability was uncertain given Q4 budget cycle
- Access control model was still being negotiated at time of sign-off (v1.3 rejection)

---

## 7. Sign-Off

| Role | Status | Date |
|---|---|---|
| VP Sales | Approved | Oct 22, 2025 |
| Product Owner | Approved | Oct 22, 2025 |
| IT Lead | Approved | Oct 22, 2025 |
| Compliance Officer | Approved — with conditions on BR-015 | Oct 22, 2025 |
| Data Governance Lead | Approved | Oct 22, 2025 |
| Business Analyst | Mohan Sarath | Oct 22, 2025 |

*Compliance approval was conditional on the access control detail being expanded in the FRD. This was completed and confirmed in v1.4.*
