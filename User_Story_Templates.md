# Agile Artifacts — User Story & Sprint Templates

**Prepared By:** Mohan Sarath Ayinabathini  
**Domain:** Banking & Financial Services | Agile/Scrum Delivery

---

## 1. User Story Template

### Format
> **As a** [type of user],  
> **I want** [some goal or feature],  
> **So that** [some reason or business value].

---

### Example User Stories — Banking Domain

---

**US-001 | Lead Assignment Automation**
> **As a** Sales Manager,  
> **I want** leads to be automatically assigned to the right sales rep based on territory rules,  
> **So that** follow-up time is reduced and lead conversion rates improve.

**Acceptance Criteria:**
- [ ] System assigns leads within 60 seconds of creation
- [ ] Assignment follows predefined territory mapping rules
- [ ] Sales rep receives email notification upon assignment
- [ ] Lead status updates to "Assigned" automatically
- [ ] Manager can view all assignments in real-time dashboard

**Priority:** Must Have  
**Story Points:** 5  
**Sprint:** Sprint 3

---

**US-002 | Risk Reporting Dashboard**
> **As a** Risk Manager,  
> **I want** an automated monthly risk report generated from live data,  
> **So that** I can make timely, data-driven decisions without manual data compilation.

**Acceptance Criteria:**
- [ ] Report auto-generates on the 1st of each month
- [ ] Includes all KPIs defined by Risk Management team
- [ ] Accessible to authorized users via secure login
- [ ] Exportable to PDF and Excel formats
- [ ] Historical reports available for last 24 months

**Priority:** Must Have  
**Story Points:** 8  
**Sprint:** Sprint 4

---

**US-003 | Customer Data Validation**
> **As a** Data Analyst,  
> **I want** incoming customer records to be automatically validated against predefined rules,  
> **So that** data quality issues are caught at entry point and not downstream.

**Acceptance Criteria:**
- [ ] Validation rules cover: mandatory fields, format checks, duplicate detection
- [ ] Invalid records are flagged and routed to data quality queue
- [ ] Validation results are logged for audit purposes
- [ ] Error rate dashboard available to Data Governance team
- [ ] System processes up to 10,000 records per hour

**Priority:** Must Have  
**Story Points:** 13  
**Sprint:** Sprint 5

---

**US-004 | UAT Sign-Off Portal**
> **As a** Business Stakeholder,  
> **I want** a centralized portal to review, comment, and approve UAT test results,  
> **So that** the sign-off process is streamlined and fully documented.

**Acceptance Criteria:**
- [ ] Stakeholders can log in with SSO credentials
- [ ] Test results visible with pass/fail status
- [ ] Comment and annotation capability on each test case
- [ ] Digital sign-off captured with timestamp and user ID
- [ ] Automated email sent to BA upon sign-off completion

**Priority:** Should Have  
**Story Points:** 5  
**Sprint:** Sprint 6

---

## 2. Epic Template

**Epic ID:** EP-001  
**Epic Name:** Lead Management Automation  
**Business Goal:** Automate end-to-end lead lifecycle to improve conversion rates by 25%  
**Owner:** Product Owner  
**Target Quarter:** Q3 2026  

| User Story ID | Description | Priority | Status |
|---|---|---|---|
| US-001 | Lead auto-assignment | Must Have | In Progress |
| US-002 | Lead status notifications | Must Have | To Do |
| US-003 | Lead conversion reporting | Should Have | To Do |
| US-004 | Lead duplicate detection | Must Have | To Do |

---

## 3. Sprint Planning Template

**Sprint Number:** Sprint 3  
**Sprint Goal:** Deliver lead assignment automation and notification features  
**Sprint Duration:** 2 weeks (May 26 – June 6, 2026)  
**Team Capacity:** 40 story points  

| Story ID | Description | Assignee | Points | Status |
|---|---|---|---|---|
| US-001 | Lead auto-assignment | Dev Team A | 5 | In Progress |
| US-002 | Email notifications | Dev Team B | 3 | To Do |
| US-003 | Territory mapping config | BA / Config | 2 | To Do |
| US-004 | Dashboard widget | Dev Team A | 5 | To Do |

**Definition of Done:**
- [ ] Code reviewed and approved
- [ ] Unit tests written and passing
- [ ] BA has verified against acceptance criteria
- [ ] Product Owner sign-off obtained
- [ ] Documentation updated

---

## 4. Backlog Grooming Checklist

Use this checklist before each sprint planning session:

- [ ] All user stories have clear acceptance criteria
- [ ] Stories are estimated in story points
- [ ] Dependencies are identified and flagged
- [ ] Priority is confirmed with Product Owner
- [ ] Technical feasibility reviewed with dev team
- [ ] Stories fit within sprint capacity
- [ ] Definition of Done agreed upon

---

*Templates based on real Agile delivery experience across Banking and Financial Services projects.*
