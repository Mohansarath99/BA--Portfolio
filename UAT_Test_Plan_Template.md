# UAT Test Plan Template

**Project Name:** [Project Name]  
**Prepared By:** Mohan Sarath Ayinabathini  
**Version:** 1.0  
**Date:** [Date]  

---

## 1. UAT Objectives

- Validate that the solution meets all defined business requirements
- Ensure the system performs as expected in a real-world business environment
- Obtain formal sign-off from key business stakeholders before go-live

---

## 2. Scope

### In Scope
- [ ] All Must Have functional requirements (FR-001 to FR-010)
- [ ] Core business workflows end-to-end
- [ ] Data validation and error handling
- [ ] User access and role-based permissions

### Out of Scope
- [ ] Performance/load testing (handled by IT)
- [ ] Penetration testing (handled by Security team)
- [ ] Nice-to-have features deferred to Phase 2

---

## 3. Test Environment

| Item | Details |
|---|---|
| Environment | UAT / Staging |
| URL | [UAT environment URL] |
| Test Data | Anonymized production data subset |
| Access | Provisioned by IT team by [date] |
| Browser | Chrome v120+, Edge v120+ |

---

## 4. UAT Test Cases

### Module: Lead Management

| TC ID | Test Case | Steps | Expected Result | Actual Result | Status | Tester |
|---|---|---|---|---|---|---|
| TC-001 | Lead auto-assignment | 1. Create new lead 2. Save record | Lead assigned to correct sales rep within 60 seconds | | ⬜ | |
| TC-002 | Email notification | 1. Assign lead 2. Check inbox | Sales rep receives email within 2 minutes | | ⬜ | |
| TC-003 | Duplicate detection | 1. Enter existing email 2. Save | System flags duplicate and prompts user | | ⬜ | |
| TC-004 | Mandatory field validation | 1. Leave email blank 2. Save | System prevents save, shows error message | | ⬜ | |
| TC-005 | Lead status update | 1. Open lead 2. Change status to Converted | Status updates, conversion date auto-populated | | ⬜ | |

### Module: Reporting Dashboard

| TC ID | Test Case | Steps | Expected Result | Actual Result | Status | Tester |
|---|---|---|---|---|---|---|
| TC-006 | Dashboard load | 1. Log in 2. Navigate to dashboard | Dashboard loads within 3 seconds | | ⬜ | |
| TC-007 | Data accuracy | 1. Check dashboard totals 2. Compare to source | Dashboard matches source data | | ⬜ | |
| TC-008 | Filter functionality | 1. Apply date filter 2. Apply status filter | Results filter correctly | | ⬜ | |
| TC-009 | Export to Excel | 1. Click Export 2. Open file | File downloads with correct data | | ⬜ | |
| TC-010 | Role-based access | 1. Log in as read-only user 2. Try to edit | Edit buttons not visible/accessible | | ⬜ | |

---

## 5. Defect Tracking

| Defect ID | TC ID | Description | Severity | Status | Assigned To | Resolution |
|---|---|---|---|---|---|---|
| DEF-001 | TC-002 | Email notification delayed >10 min | High | Open | Dev Team | |
| DEF-002 | TC-008 | Date filter returns incorrect results | Critical | In Progress | Dev Team | |

### Defect Severity Definitions

| Severity | Definition | SLA |
|---|---|---|
| Critical | System crash or core functionality broken | Fix within 24 hours |
| High | Major feature not working, workaround exists | Fix within 3 days |
| Medium | Minor feature issue, workaround available | Fix within 7 days |
| Low | Cosmetic issue, no business impact | Fix before next release |

---

## 6. UAT Entry & Exit Criteria

### Entry Criteria (UAT can begin when:)
- [ ] All Must Have features deployed to UAT environment
- [ ] Test data loaded and verified
- [ ] User access provisioned for all testers
- [ ] Test cases reviewed and approved by BA

### Exit Criteria (UAT is complete when:)
- [ ] 100% of test cases executed
- [ ] All Critical and High defects resolved
- [ ] Pass rate ≥ 95%
- [ ] Business stakeholder sign-off obtained

---

## 7. UAT Sign-Off

| Stakeholder | Role | Decision | Date | Comments |
|---|---|---|---|---|
| | Product Owner | ⬜ Approved / ⬜ Rejected | | |
| | Business Lead | ⬜ Approved / ⬜ Rejected | | |
| | End User Rep | ⬜ Approved / ⬜ Rejected | | |
| Mohan Sarath | Business Analyst | ⬜ Approved / ⬜ Rejected | | |

---

*UAT template based on real-world testing experience across Banking and Financial Services implementations.*
