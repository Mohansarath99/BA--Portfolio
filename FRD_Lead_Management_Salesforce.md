# Functional Requirements Document (FRD)
## Lead Management — Salesforce Implementation
# Functional Requirements Document (FRD)

## Lead Management — Salesforce Implementation

**Project:** CRM Migration — Home Equity Bank
**BA:** Mohan Sarath Ayinabathini
**Version:** 1.0
**Status:** Final

---

## 1. Overview

This document defines the functional requirements for the Lead Management module within Salesforce. It translates the approved business requirements into system-level behavior, workflows, and data handling logic.

The goal is to automate lead capture, assignment, follow-up, and tracking to eliminate manual processes and improve response time and conversion rates.

---

## 2. Scope

### In Scope

* Web form lead capture
* Lead creation in Salesforce
* Territory-based assignment rules
* Product-based routing (Mortgage / HELOC)
* Notification and follow-up automation
* Duplicate detection
* Fallback routing logic
* Audit logging

### Out of Scope

* AI lead scoring (Phase 2)
* Third-party integrations beyond web forms
* Mobile-specific UI enhancements

---

## 3. System Overview

Leads originate from external web forms and are submitted via API into Salesforce.

Processing flow:

1. User submits web form
2. Validation executed
3. Lead created in Salesforce
4. Assignment rules triggered
5. Notification + follow-up task generated
6. Lead available for reporting/dashboard

---

## 4. Functional Requirements

### 4.1 Lead Capture

* System shall accept lead data from website forms via API

* Lead record must be created within **45 seconds**

* Mandatory fields:

  * First Name
  * Last Name
  * Email
  * Phone
  * Product Interest

* If mandatory fields are missing:

  * Submission rejected
  * User receives error message

* If Salesforce API is unavailable:

  * Request queued
  * Retry logic applied
  * No data loss permitted

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

* Duplicate check triggered on **email**
* If duplicate found:

  * System flags the record
  * Lead still created (non-blocking)
  * Flag visible to sales rep

---

### 4.4 Lead Assignment Rules

#### Territory-Based Routing

* Based on postal code:

  * Toronto Core
  * GTA
  * Ontario-Wide
  * National

#### Product-Based Routing

* Mortgage → Mortgage Team
* HELOC → HELOC Team

#### Fallback Logic

* If no rule match:

  * Route to Manager Queue
* If PO Box / invalid postal code:

  * Route to Manager Queue

#### Performance Requirement

* Assignment must complete within **60 seconds**

---

### 4.5 Notifications

* On assignment:

  * Email notification sent to rep
  * In-app notification triggered

* SLA:

  * Notification delivered within 60 seconds

---

### 4.6 Follow-Up Automation

* Task auto-created upon assignment
* Default due date: **24 hours**
* Reminder email: **2 hours before due time**

---

### 4.7 Audit Logging

System must log:

* Lead creation timestamp
* Assignment timestamp
* Assigned user
* Source of lead

---

### 4.8 Error Handling

| Scenario           | System Behavior        |
| ------------------ | ---------------------- |
| API failure        | Queue and retry        |
| Missing fields     | Reject submission      |
| Assignment failure | Route to manager queue |
| Notification delay | Retry notification     |

---

## 5. Reporting Impact

The following data must be available for dashboards:

* Total leads
* Assigned vs unassigned leads
* Conversion rate
* Response time
* Lead source distribution
* Territory-based performance

---

## 6. Assumptions

* Salesforce licenses available for all users
* API integration between web forms and Salesforce is stable
* Postal code mapping provided by business
* Data cleansing completed before go-live

---

## 7. Constraints

* Must comply with PIPEDA
* Cannot impact ongoing sales operations
* SLA targets must be met under peak load

---

## 8. Acceptance Criteria (Summary)

* Lead created within 45 seconds ✅
* Assignment within 60 seconds ✅
* No data loss during API failure ✅
* Duplicate detection working (non-blocking) ✅
* Notifications triggered correctly ✅
* Fallback routing functioning ✅

---

## 9. Traceability

| BRD ID | FRD Section         |
| ------ | ------------------- |
| BR-001 | Lead Capture        |
| BR-003 | Assignment Rules    |
| BR-004 | Notifications       |
| BR-005 | Follow-Up           |
| BR-006 | Duplicate Detection |
| BR-007 | Fallback Routing    |

---

## 10. Sign-Off

| Role             | Status     |
| ---------------- | ---------- |
| Business Analyst | Approved ✅ |
| Product Owner    | Approved ✅ |
| IT Lead          | Approved ✅ |
| Compliance       | Approved ✅ |

---

(Project content as provided earlier...)
