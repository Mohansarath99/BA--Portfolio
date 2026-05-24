# Functional Requirements Document (FRD)

## Lead Management — Salesforce Implementation

**Project:** CRM Migration — Home Equity Bank
**BA:** Mohan Sarath Ayinabathini
**Version:** 1.0
**Status:** Final

---

## 1. Overview

This document captures the functional requirements for the Lead Management module implemented in Salesforce as part of the CRM migration initiative.

The objective of this module is to replace the existing manual lead handling process — where leads were distributed via email and tracked in spreadsheets — with an automated, rules-driven system for lead capture, assignment, and follow-up.

These requirements are based on stakeholder workshops conducted with Sales, IT, and Compliance teams and align with the approved Business Requirements Document (BRD).

---

## 2. Scope

### In Scope

* Web form lead capture and API integration
* Lead creation in Salesforce
* Territory-based and product-based assignment rules
* Notification and follow-up automation
* Duplicate detection and flagging
* Fallback routing logic for unmatched leads
* Audit logging for compliance and traceability

### Out of Scope

* AI-based lead scoring (Phase 2)
* Third-party integrations beyond web forms
* Mobile-specific UI enhancements

---

## 3. System Overview

Leads originate from external web forms and are submitted into Salesforce via API integration.

### Processing Flow:

1. User submits web form
2. System validates input data
3. Lead record created in Salesforce
4. Assignment rules executed
5. Notifications triggered
6. Follow-up task generated
7. Lead becomes available for reporting and dashboards

---

## 3.1 Key Design Considerations

* Data profiling identified ~18% data quality issues in the source system, influencing validation rules at entry
* Compliance (PIPEDA) required strict audit logging and role-based access controls
* Sales stakeholders required rapid lead turnaround (target < 60 seconds for assignment)
* Edge cases such as PO Box addresses required fallback routing to prevent lead loss
* System designed to ensure zero lead loss even during API failures

---

## 4. Functional Requirements

### 4.1 Lead Capture

* System shall accept lead data from website forms via API
* Lead record must be created within **45 seconds**

#### Mandatory Fields:

* First Name
* Last Name
* Email
* Phone
* Product Interest

#### Validation Rules:

* If mandatory fields are missing:

  * Submission is rejected
  * User receives a clear error message

#### API Failure Handling:

* If Salesforce API is unavailable:

  * Submission is queued
  * Retry logic is applied
  * No data loss is permitted

---

### 4.2 Lead Data Mapping

| Source Field     | Salesforce Field     |
| ---------------- | -------------------- |
| First Name       | Lead.FirstName       |
| Last Name        | Lead.LastName        |
| Email            | Lead.Email           |
| Phone            | Lead.Phone           |
| Product Interest | Lead.Product_Type__c |
| Form URL         | Lead.Source          |

---

### 4.3 Duplicate Detection

* Duplicate check triggered based on **email address**
* If duplicate detected:

  * Record is flagged
  * Lead creation is not blocked
  * Flag is visible to the assigned sales rep

---

### 4.4 Lead Assignment Rules

#### Territory-Based Routing

Based on postal code:

* Toronto Core
* GTA
* Ontario-Wide
* National

#### Product-Based Routing

* Mortgage → Mortgage Team
* HELOC → HELOC Team

#### Fallback Logic

* If no assignment rule matches:

  * Route lead to Manager Queue
* If invalid postal code or PO Box detected:

  * Route to Manager Queue

#### Performance Requirement

* Assignment must complete within **60 seconds of lead creation**

---

### 4.5 Notifications

* Upon assignment:

  * Email notification sent to assigned rep
  * In-app notification triggered

#### SLA:

* Notifications must be delivered within **60 seconds**

---

### 4.6 Follow-Up Automation

* Follow-up task automatically created upon assignment
* Default due date: **24 hours from assignment**
* Reminder email sent **2 hours before due time**

---

### 4.7 Audit Logging

System must log the following:

* Lead creation timestamp
* Assignment timestamp
* Assigned user
* Lead source
* Status changes (if applicable)

---

### 4.8 Error Handling

| Scenario                 | System Behavior              |
| ------------------------ | ---------------------------- |
| API failure              | Queue and retry submission   |
| Missing mandatory fields | Reject submission with error |
| Assignment failure       | Route to Manager Queue       |
| Notification delay       | Retry notification delivery  |

---

## 5. Reporting Impact

The system must support the following reporting metrics:

* Total leads created
* Assigned vs unassigned leads
* Conversion rate
* Average response time
* Lead source distribution
* Territory-based performance metrics

---

## 6. Assumptions

* Salesforce licenses provisioned for all users
* API integration between web forms and Salesforce is stable
* Postal code mapping provided by business stakeholders
* Data cleansing completed prior to migration load

---

## 7. Constraints

* Must comply with PIPEDA and internal compliance policies
* Cannot disrupt ongoing sales operations during migration
* SLA targets must be maintained under peak load conditions

---

## 8. Acceptance Criteria (Summary)

* Lead created within 45 seconds ✅
* Assignment completed within 60 seconds ✅
* No data loss during API failure ✅
* Duplicate detection functioning correctly (non-blocking) ✅
* Notifications triggered within SLA ✅
* Fallback routing working for edge cases ✅

---

## 9. Traceability

| BRD ID | FRD Section          |
| ------ | -------------------- |
| BR-001 | Lead Capture         |
| BR-003 | Assignment Rules     |
| BR-004 | Notifications        |
| BR-005 | Follow-Up Automation |
| BR-006 | Duplicate Detection  |
| BR-007 | Fallback Routing     |

---

## 10. Sign-Off

| Role               | Status     |
| ------------------ | ---------- |
| Business Analyst   | Approved ✅ |
| Product Owner      | Approved ✅ |
| IT Lead            | Approved ✅ |
| Compliance Officer | Approved ✅ |

---
