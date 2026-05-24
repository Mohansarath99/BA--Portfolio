# UAT Test Results — CRM Migration
## Home Equity Bank | Sprint 5 | Feb–Mar 2026

**BA / UAT Coordinator:** Mohan Sarath Ayinabathini
**UAT Environment:** HEB-UAT-SF-02
**UAT Period:** Feb 17 – Mar 4, 2026 (ran 3 weeks due to stakeholder scheduling)
**Final Pass Rate:** 93.2%
**Go-Live Decision:** Approved — March 6, 2026

---

## Summary

| | Count |
|---|---|
| Total test cases executed | 44 |
| Passed | 41 |
| Failed | 3 |
| Blocked | 0 |
| Defects raised | 6 |
| Defects resolved before go-live | 4 |
| Defects deferred to Sprint 6 | 2 |
| Go-Live decision | Approved ✅ |

The 93.2% pass rate was above our 90% threshold. The 2 deferred defects were both low priority — one was a cosmetic UI issue and the other was a report formatting preference. Both had documented workarounds approved by the Product Owner.

---

## Module 1: Lead Capture & Assignment

| TC ID | Test Case | Expected | Actual | Status | Notes |
|---|---|---|---|---|---|
| TC-001 | Web form submission creates lead | Lead created within 45 sec | Created in 22 sec | Pass ✅ | |
| TC-002 | Incomplete form rejected | Error message shown | Shown correctly | Pass ✅ | |
| TC-003 | Toronto postal code routes to Toronto team | Assigned to Toronto rep | Assigned correctly | Pass ✅ | |
| TC-004 | HELOC product routes to HELOC team | Assigned to HELOC rep | Assigned correctly | Pass ✅ | |
| TC-005 | Rep receives notification within 60 sec | Email + in-app alert | Received in 38 sec | Pass ✅ | |
| TC-006 | Duplicate email flagged | Flag shown, not blocked | Flagged correctly | Pass ✅ | |
| TC-007 | PO Box address fallback routing | Goes to manager queue | Went to wrong queue initially | Fail ❌ | DEF-001 — see defect log |
| TC-008 | Unmatched territory fallback | Goes to manager queue | Routed correctly | Pass ✅ | |

---

## Module 2: Data Migration Validation

| TC ID | Test Case | Expected | Actual | Status | Notes |
|---|---|---|---|---|---|
| TC-009 | Total record count source vs target | Counts match | 48,847 = 48,847 | Pass ✅ | Excludes 53 records removed during cleansing |
| TC-010 | Mandatory field completeness | 100% populated | 99.7% — 147 flagged | Pass ✅ | Flagged records reviewed and accepted by Data Steward |
| TC-011 | Account balance reconciliation | Variance ≤ $0.01 | Max variance $0.003 | Pass ✅ | |
| TC-012 | Duplicate records in target | Zero duplicates | Zero confirmed | Pass ✅ | |
| TC-013 | Pre-2018 records not in target | Archived only | Confirmed archived | Pass ✅ | |
| TC-014 | Audit log completeness | All changes logged | Full log present | Pass ✅ | |

---

## Module 3: Reporting & Dashboards

| TC ID | Test Case | Expected | Actual | Status | Notes |
|---|---|---|---|---|---|
| TC-015 | Dashboard load time | Under 4 seconds | 2.3 seconds | Pass ✅ | |
| TC-016 | Data accuracy vs Salesforce source | Match within 15 min | Matched exactly | Pass ✅ | |
| TC-017 | Date range filter — 30 days | Filtered results | Filtered correctly | Pass ✅ | |
| TC-018 | Territory filter | Filtered by territory | Filtered correctly | Pass ✅ | |
| TC-019 | Export to Excel | File downloads correctly | Downloaded with system fields included | Fail ❌ | DEF-002 |
| TC-020 | Manager sees team data only | Own team visible | Own team visible | Pass ✅ | |
| TC-021 | Mobile browser rendering | Dashboard usable on mobile | Partially broken on iOS Safari | Fail ❌ | DEF-003 — deferred |

---

## Module 4: Access Control

| TC ID | Test Case | Expected | Actual | Status | Notes |
|---|---|---|---|---|---|
| TC-022 | Rep cannot view other rep's lead | Access denied | Denied correctly | Pass ✅ | |
| TC-023 | Manager views full team | All team leads visible | Visible | Pass ✅ | |
| TC-024 | Compliance read-only | Edit not available | Correctly hidden | Pass ✅ | |
| TC-025 | Admin delete triggers approval | Workflow triggered | Triggered correctly | Pass ✅ | |

---

## Module 5: Follow-Up Automation

| TC ID | Test Case | Expected | Actual | Status | Notes |
|---|---|---|---|---|---|
| TC-026 | Follow-up task auto-created | Task within 5 min | Created in 4 min | Pass ✅ | |
| TC-027 | Task due date default | 24 hrs from assignment | Set correctly | Pass ✅ | |
| TC-028 | Reminder email 2hrs before due | Email received | Received — slight delay (~8 min late) | Pass ✅ | Acceptable per Product Owner |

---

## Defect Log

| ID | TC | Description | Severity | Status | Resolution |
|---|---|---|---|---|---|
| DEF-001 | TC-007 | Leads with PO Box addresses routing to incorrect queue — going to Toronto team instead of manager queue | High | Resolved ✅ | Assignment rule updated to catch PO Box format. Retested and passed Feb 25. |
| DEF-002 | TC-019 | Excel export includes 6 internal system fields not relevant to business users | Medium | Resolved ✅ | IT removed system fields from export template. Retested and passed Feb 27. |
| DEF-003 | TC-021 | Dashboard partially broken on iOS Safari — filter dropdown not rendering | Low | Deferred to Sprint 6 | Workaround: Use Chrome on mobile. Approved by Product Owner Feb 28. |
| DEF-004 | TC-019 | Export file name defaults to system timestamp — not user-friendly | Low | Deferred to Sprint 6 | Cosmetic. Default name changed manually by user. Accepted. |
| DEF-005 | TC-005 | In-app notification delayed by 4–6 minutes during peak load testing | Medium | Resolved ✅ | IT tuned notification queue batch size. Resolved Mar 1. |
| DEF-006 | TC-010 | 147 migrated records show blank middle name — field was mandatory in legacy but optional in Salesforce | Low | Resolved ✅ | Data Steward reviewed and accepted — middle name made optional in target. |

---

## UAT Sign-Off

| Stakeholder | Role | Decision | Date | Comments |
|---|---|---|---|---|
| VP Sales | Project Sponsor | Approved ✅ | Mar 6, 2026 | Happy with pipeline visibility improvement |
| Product Owner | PO | Approved ✅ | Mar 6, 2026 | DEF-003 and DEF-004 deferred with workarounds |
| IT Lead | Tech Lead | Approved ✅ | Mar 6, 2026 | System stable on all environments |
| Compliance Officer | Compliance | Approved ✅ | Mar 6, 2026 | Access controls validated |
| Mohan Sarath | BA | Approved ✅ | Mar 6, 2026 | Recommending go-live |

---

## Go-Live

**Decision:** GO ✅
**Go-Live Date:** March 10, 2026
**Hypercare:** March 10 – March 24, 2026
**Sprint 6 Start:** March 23, 2026 (deferred defects + Phase 2 scoping)

---

## Post Go-Live Notes (Week 1)

A few things came up in hypercare worth documenting:

- 3 reps accidentally closed leads instead of converting them on day 1. Fixed with a quick training reminder and a UI tooltip added by dev.
- The PO Box routing fix (DEF-001) held up fine — no routing issues reported.
- Load time on the dashboard spiked on March 11 (Monday morning rush). IT increased server capacity and it stabilized by noon.
- Overall adoption looked good — 89% of reps logged in on day 1.
