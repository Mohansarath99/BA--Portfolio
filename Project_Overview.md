# Project Overview — On-Premise to Cloud CRM Migration
**Business Analyst:** Mohan Sarath Ayinabathini
**Client:** Home Equity Bank, Toronto
**Project Start:** September 2025
**Go-Live:** March 2026
**Status:** Completed

---

## 1. Business Problem

Home Equity Bank's legacy on-premise customer database had been in operation for over 12 years. The system suffered from:

- 30% data entry error rate due to fully manual processes
- No real-time reporting visibility for management
- Lead response times averaging 48–72 hours
- Siloed data across 6 different spreadsheets and systems
- No automated lead assignment or follow-up workflows
- Increasing compliance risk due to outdated data governance

The bank's leadership identified this as a critical blocker to growth and initiated a full migration to Salesforce cloud CRM.

---

## 2. My Role as Business Analyst

I was brought in as the Senior BA to lead the full requirements lifecycle for this migration. My responsibilities covered:

- Stakeholder identification and engagement across Sales, IT, Risk, Compliance, and Operations
- Business requirements elicitation through workshops, interviews, and JAD sessions
- Current state documentation and gap analysis
- Functional and technical requirements definition
- Data mapping between legacy system and Salesforce schema
- User story creation and backlog management across 5 sprints
- UAT planning, execution coordination, and sign-off management
- Post go-live support and defect resolution

---

## 3. Project Scope

### In Scope
- Migration of 50,000+ active customer records from legacy on-premise database to Salesforce
- Automated lead capture, assignment, and follow-up workflows
- Real-time Power BI reporting dashboards for Sales and Management
- Role-based access control and data security configuration
- Full UAT execution with business stakeholder sign-off
- Training and change management for 120+ end users

### Out of Scope
- Historical inactive records (pre-2018)
- Mobile application development
- Third-party vendor integrations (Phase 2)

---

## 4. Stakeholder Register

| Stakeholder | Role | Department | Engagement |
|---|---|---|---|
| VP Sales | Project Sponsor | Sales | Weekly steering committee |
| Product Owner | Backlog Owner | Technology | Daily standups |
| IT Lead | Technical Lead | Technology | Sprint planning & reviews |
| Data Governance Lead | Data Steward | Risk & Compliance | Bi-weekly data reviews |
| Sales Managers (x4) | Business Users | Sales | UAT & training sessions |
| Compliance Officer | Regulatory Oversight | Risk | Milestone reviews |
| End Users (120+) | System Users | Sales & Operations | Training |

---

## 5. Project Timeline

| Phase | Activities | Duration |
|---|---|---|
| Initiation | Stakeholder mapping, project charter, scope definition | Week 1–2 |
| Requirements | BRD, FRD, JAD sessions, gap analysis | Week 3–6 |
| Design | Data mapping, solution design, architecture review | Week 7–9 |
| Sprint 1–2 | Lead capture and assignment automation | Week 10–13 |
| Sprint 3–4 | Data migration and validation | Week 14–17 |
| Sprint 5 | UAT, defect resolution, go-live preparation | Week 18–20 |
| Go-Live | Production deployment, hypercare support | Week 21–22 |

---

## 6. Project Outcomes

| Metric | Before | After | Improvement |
|---|---|---|---|
| Lead response time | 48–72 hours | < 2 hours | 96% faster |
| Data entry error rate | ~30% | < 4% | 87% reduction |
| Lead conversion rate | ~12% | ~19.4% | 62% improvement |
| Manual reporting time | 4 hrs/week | 0 hrs/week | 100% automated |
| Data quality score | ~70% | 96.2% | 37% improvement |
| UAT defect escape rate | N/A | < 3% | First-time quality |

---

## 7. Key Challenges and How I Solved Them

**Challenge 1: Data quality issues in legacy system**
The source data had 15,000+ records with missing or invalid fields. I worked with the Data Governance team to define cleansing rules, ran SQL validation scripts to identify issues, and coordinated a dedicated data cleansing sprint before migration.

**Challenge 2: Stakeholder alignment across 6 departments**
Sales, IT, Risk, Compliance, and Operations had conflicting priorities. I facilitated structured JAD sessions with a pre-defined agenda and decision log, ensuring every stakeholder's requirements were captured and conflicts resolved before sign-off.

**Challenge 3: UAT participation from busy business users**
Business users were reluctant to commit time for UAT. I designed test cases in plain business language (no technical jargon), scheduled focused 2-hour UAT sessions with clear objectives, and provided real-time defect tracking visibility to keep stakeholders engaged.
