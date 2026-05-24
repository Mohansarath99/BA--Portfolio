# Business Requirements Document
## On-Premise to Cloud CRM Migration — Home Equity Bank

**Document ID:** BRD-HEB-2025-001
**Version:** 2.1 — Final Approved
**Business Analyst:** Mohan Sarath Ayinabathini
**Project Sponsor:** VP Sales, Home Equity Bank
**Approved By:** Product Owner, IT Lead, Compliance Officer
**Approval Date:** October 15, 2025

---

## 1. Executive Summary

Home Equity Bank's legacy on-premise customer management system is no longer fit for purpose. Manual data entry, disconnected spreadsheets, and absence of real-time reporting are directly impacting sales productivity and lead conversion performance.

This document defines the business requirements for the full migration from the legacy on-premise system to a Salesforce cloud CRM platform. The migration is expected to reduce lead response time by 96%, improve data quality from 70% to 96%+, and increase lead conversion from 12% to approximately 20%.

---

## 2. Business Objectives

| ID | Objective | Measure of Success |
|---|---|---|
| OBJ-001 | Eliminate manual lead assignment | 100% of leads auto-assigned within 60 seconds |
| OBJ-002 | Improve data quality | Data quality score ≥ 95% post-migration |
| OBJ-003 | Enable real-time reporting | Management dashboards live within 2 weeks of go-live |
| OBJ-004 | Reduce lead response time | Average response time < 2 hours |
| OBJ-005 | Improve lead conversion | Conversion rate improvement ≥ 50% within 6 months |
| OBJ-006 | Achieve regulatory compliance | Zero compliance findings in first post-go-live audit |

---

## 3. Current State — What Is Broken

### Lead Management Process (AS-IS)

The current process relies entirely on manual effort:

1. Marketing generates leads from campaigns and emails them to an admin
2. Admin manually reviews and forwards leads to sales reps via email
3. Sales reps manually enter lead data into personal Excel spreadsheets
4. Follow-up timing is left to individual rep judgment — no reminders
5. Managers request weekly status updates via email chains
6. Admin manually compiles a report from rep emails every Friday

**Pain Points Identified During Stakeholder Workshops:**

| Pain Point | Business Impact | Source |
|---|---|---|
| Manual data entry with no validation | ~30% error rate, rework cost | Sales Team Workshop |
| No rules-based lead assignment | Unequal distribution, missed leads | Sales Managers Interview |
| No real-time pipeline visibility | Decisions based on 5-day-old data | VP Sales Interview |
| Leads go cold due to no reminders | Lost revenue opportunities | Sales Reps Focus Group |
| 4 hours/week manual reporting | Resource waste, opportunity cost | Operations Review |
| No audit trail on lead interactions | Compliance risk | Compliance Officer Review |

---

## 4. Future State — What We Need

### Lead Management Process (TO-BE)

1. Web forms and campaigns auto-capture leads directly into Salesforce
2. System validates all mandatory fields at point of entry
3. Rules engine automatically assigns leads based on territory and product type
4. Sales rep receives instant in-app notification and email alert
5. Automated follow-up tasks and reminders created at assignment
6. Manager views real-time pipeline dashboard — no manual reporting needed
7. Full audit trail captured for every lead interaction

---

## 5. Business Requirements

### 5.1 Lead Management Requirements

| ID | Requirement | Priority | Source |
|---|---|---|---|
| BR-001 | System shall automatically capture leads from all web forms and campaign sources | Must Have | VP Sales |
| BR-002 | System shall validate all mandatory fields at lead creation — no incomplete records | Must Have | Data Governance |
| BR-003 | System shall auto-assign leads based on predefined territory and product rules | Must Have | Sales Managers |
| BR-004 | Sales rep shall receive notification within 60 seconds of lead assignment | Must Have | Sales Team |
| BR-005 | System shall auto-create follow-up tasks for all new leads | Must Have | Sales Managers |
| BR-006 | System shall flag duplicate leads based on email address matching | Must Have | Data Governance |
| BR-007 | Sales manager shall view real-time lead pipeline without manual intervention | Must Have | VP Sales |

### 5.2 Data Migration Requirements

| ID | Requirement | Priority | Source |
|---|---|---|---|
| BR-008 | All active customer records from legacy system shall be migrated to Salesforce | Must Have | IT Lead |
| BR-009 | Migrated records shall maintain full data integrity — zero data loss | Must Have | Compliance |
| BR-010 | All account balances shall reconcile within $0.01 tolerance post-migration | Must Have | Risk Team |
| BR-011 | Migration shall include full audit log of all changes made during cleansing | Must Have | Compliance |
| BR-012 | Inactive records (pre-2018) shall be archived, not migrated | Should Have | Data Governance |

### 5.3 Reporting Requirements

| ID | Requirement | Priority | Source |
|---|---|---|---|
| BR-013 | Real-time lead conversion dashboard available to all Sales Managers | Must Have | VP Sales |
| BR-014 | Automated monthly, weekly, and daily reports without manual intervention | Must Have | Operations |
| BR-015 | Role-based access — managers see team data, reps see own data only | Must Have | Compliance |
| BR-016 | Historical reporting available for last 24 months post-migration | Should Have | VP Sales |

---

## 6. Assumptions

- Legacy system data export will be provided by IT in CSV format by Week 3
- Salesforce licensing for 150 users will be procured before Sprint 1
- Business users will be available for UAT sessions in Sprint 5
- Data cleansing will be completed before migration load begins

---

## 7. Constraints

- Project must go live within 22 weeks of kick-off
- Budget limited to approved project allocation
- Cannot disrupt existing sales operations during migration
- Must comply with PIPEDA data privacy requirements

---

## 8. Risks

| Risk | Probability | Impact | Mitigation |
|---|---|---|---|
| Legacy data quality worse than expected | High | High | Dedicated data cleansing sprint planned |
| Stakeholder availability during UAT | Medium | High | UAT sessions scheduled 3 weeks in advance |
| Scope creep from additional requirements | Medium | Medium | Formal change request process enforced |
| Salesforce configuration delays | Low | High | IT lead engaged from Week 1 |

---

## 9. Sign-Off

| Role | Name | Status | Date |
|---|---|---|---|
| Business Sponsor | VP Sales | Approved | Oct 15, 2025 |
| Product Owner | | Approved | Oct 15, 2025 |
| IT Lead | | Approved | Oct 15, 2025 |
| Compliance Officer | | Approved | Oct 15, 2025 |
| Business Analyst | Mohan Sarath | Approved | Oct 15, 2025 |
