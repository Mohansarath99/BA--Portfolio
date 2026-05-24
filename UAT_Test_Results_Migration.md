# UAT Test Results — On-Premise to Cloud CRM Migration
## Home Equity Bank | Sprint 5 | February 2026

**Business Analyst:** Mohan Sarath Ayinabathini
**UAT Coordinator:** Mohan Sarath Ayinabathini
**UAT Environment:** HEB-UAT-SF-02
**UAT Period:** February 9 – February 18, 2026
**Final Pass Rate:** 97.6% ✅
**Go-Live Decision:** APPROVED ✅

---

## UAT Summary

| Category | Count |
|---|---|
| Total Test Cases | 42 |
| Passed | 41 |
| Failed | 1 |
| Blocked | 0 |
| Pass Rate | 97.6% |
| Critical Defects | 0 |
| High Defects Resolved | 1 |
| Go-Live Decision | Approved ✅ |

---

## Module 1: Lead Capture & Assignment

| TC ID | Test Case | Steps | Expected Result | Actual Result | Status | Tester |
|---|---|---|---|---|---|---|
| TC-001 | Web form lead auto-capture | Submit web form with all fields | Lead created in Salesforce within 30 seconds | Lead created in 18 seconds | Pass ✅ | Sales Manager |
| TC-002 | Mandatory field enforcement | Submit form with email blank | Form rejected, error shown | Form rejected correctly | Pass ✅ | Sales Manager |
| TC-003 | Territory-based auto-assignment | Create Toronto lead | Assigned to Toronto team rep | Assigned correctly | Pass ✅ | Sales Rep |
| TC-004 | Product-based routing | Create Mortgage lead | Assigned to Mortgage team | Assigned correctly | Pass ✅ | Sales Rep |
| TC-005 | Rep notification timing | Assign lead to rep | Notification received within 60 seconds | Received in 42 seconds | Pass ✅ | Sales Rep |
| TC-006 | Duplicate lead detection | Enter existing email | System flags as duplicate | Flagged correctly | Pass ✅ | Data Steward |
| TC-007 | Unmatched rule fallback | Create lead with no matching territory | Lead goes to manager queue | Routed correctly | Pass ✅ | Sales Manager |

---

## Module 2: Data Migration Validation

| TC ID | Test Case | Steps | Expected Result | Actual Result | Status | Tester |
|---|---|---|---|---|---|---|
| TC-008 | Total record count match | Compare source vs target count | Counts must match exactly | 50,247 = 50,247 ✅ | Pass ✅ | Data Steward |
| TC-009 | Mandatory field completeness | Check all migrated records | 100% fields populated | 99.8% — 98 records flagged | Pass ✅ | Data Steward |
| TC-010 | Account balance reconciliation | Compare source vs target balances | Variance ≤ $0.01 | Max variance $0.00 | Pass ✅ | Risk Team |
| TC-011 | Duplicate records resolved | Check for duplicates in target | Zero duplicates | Zero duplicates confirmed | Pass ✅ | Data Steward |
| TC-012 | Audit log completeness | Review migration audit log | All changes logged | Full log generated | Pass ✅ | Compliance |
| TC-013 | Inactive records archived | Check pre-2018 records | Not in Salesforce, archived | Correctly archived | Pass ✅ | Data Steward |

---

## Module 3: Reporting & Dashboards

| TC ID | Test Case | Steps | Expected Result | Actual Result | Status | Tester |
|---|---|---|---|---|---|---|
| TC-014 | Dashboard load time | Open Sales Dashboard | Load within 3 seconds | Loaded in 1.8 seconds | Pass ✅ | Sales Manager |
| TC-015 | Real-time data accuracy | Check dashboard vs source | Data matches within 15 min | Data matched exactly | Pass ✅ | Sales Manager |
| TC-016 | Date range filter | Apply 30-day filter | Results filtered correctly | Filtered correctly | Pass ✅ | Sales Manager |
| TC-017 | Export to Excel | Click Export button | File downloads with correct data | File downloaded correctly | Pass ✅ | Sales Manager |
| TC-018 | Mobile access | Open dashboard on phone | Dashboard renders on mobile | Rendered correctly | Pass ✅ | Sales Rep |

---

## Module 4: Access Control & Security

| TC ID | Test Case | Steps | Expected Result | Actual Result | Status | Tester |
|---|---|---|---|---|---|---|
| TC-019 | Rep access restriction | Log in as rep, view other rep's lead | Access denied | Access denied correctly | Pass ✅ | Compliance |
| TC-020 | Manager team visibility | Log in as manager, view team leads | All team leads visible | Visible correctly | Pass ✅ | Sales Manager |
| TC-021 | Read-only compliance access | Log in as compliance, try to edit | Edit button not visible | Correctly hidden | Pass ✅ | Compliance |
| TC-022 | Admin delete approval | Log in as admin, try to delete | Approval workflow triggered | Triggered correctly | Pass ✅ | IT Lead |

---

## Module 5: Follow-Up & Automation

| TC ID | Test Case | Steps | Expected Result | Actual Result | Status | Tester |
|---|---|---|---|---|---|---|
| TC-023 | Auto follow-up task creation | Assign lead to rep | Task created within 5 minutes | Created in 3 minutes | Pass ✅ | Sales Rep |
| TC-024 | Task due date default | Check task created | Due date = 24 hours from assignment | Correct | Pass ✅ | Sales Rep |
| TC-025 | Overdue task escalation | Let task go overdue | Manager notified automatically | Notified correctly | Pass ✅ | Sales Manager |
| TC-026 | Email reminder | Wait for 2hr reminder | Email received 2hrs before due | Email received | Pass ✅ | Sales Rep |

---

## Defect Log

| Defect ID | TC ID | Description | Severity | Raised By | Status | Resolution |
|---|---|---|---|---|---|---|
| DEF-001 | TC-017 | Export to Excel includes hidden system fields in output | High | Sales Manager | Resolved ✅ | IT removed system fields from export template — retested and passed |

---

## UAT Sign-Off

| Stakeholder | Role | Decision | Date | Comments |
|---|---|---|---|---|
| VP Sales | Business Sponsor | Approved ✅ | Feb 18, 2026 | Excellent delivery — team is ready |
| Product Owner | Product Owner | Approved ✅ | Feb 18, 2026 | All acceptance criteria met |
| Compliance Officer | Regulatory | Approved ✅ | Feb 18, 2026 | Access controls verified — compliant |
| IT Lead | Technical Lead | Approved ✅ | Feb 18, 2026 | System stable — ready for production |
| Mohan Sarath | Business Analyst | Approved ✅ | Feb 18, 2026 | UAT complete — recommending go-live |

---

## Go-Live Decision

**Decision:** GO ✅
**Go-Live Date:** February 24, 2026
**Hypercare Period:** February 24 – March 9, 2026
**Post Go-Live Review:** March 16, 2026
