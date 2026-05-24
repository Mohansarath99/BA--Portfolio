# Project Overview — CRM Migration
## Home Equity Bank | Senior BA | Sep 2025 – Present

---

## Background

When I joined Home Equity Bank in September 2025, the lead management process was almost entirely manual. Marketing would generate leads from campaigns, an admin would forward them by email to sales reps, and reps would track everything in personal spreadsheets. There was no central system, no assignment rules, and management had zero real-time visibility into pipeline.

The bank had been planning a Salesforce migration for about a year before I came in, but it kept getting deprioritized. My first few weeks were spent understanding why — turns out the main blocker was nobody had properly documented what the business actually needed. There was a rough scope document from a vendor kickoff meeting, but nothing that could actually drive development.

So we started from scratch on the requirements side.

---

## What I Was Responsible For

- Running stakeholder workshops with Sales, IT, Risk, Compliance, and Operations
- Writing the BRD and getting sign-off from 5 different stakeholders (harder than it sounds)
- Defining data mapping between the legacy system and Salesforce
- Writing user stories and managing the backlog in JIRA across 5 sprints
- Coordinating UAT with business users who had limited availability
- Tracking defects and working with developers to prioritize fixes before go-live

I was the only BA on the project for the first 3 months. A junior BA joined in Sprint 3 to help with documentation and test case writing.

---

## Scope

**What's included:**
- Migration of active customer records from the legacy on-premise database to Salesforce
- Automated lead capture, assignment, and follow-up workflows
- Real-time reporting dashboards for Sales Managers
- Role-based access configuration across 4 user types
- UAT and go-live support

**What's not included (pushed to Phase 2):**
- Mobile app integration
- Third-party data provider feeds
- Historical inactive records (pre-2018) — these were archived, not migrated
- Advanced AI-based lead scoring (vendor demo showed promise but wasn't ready)

---

## What Made This Project Harder Than Expected

**Data quality.** The legacy system had been running for over 10 years with no governance. When we profiled the source data, we found roughly 18% of records had at least one issue — missing fields, formatting inconsistencies, duplicates. We'd budgeted two weeks for data cleansing. It took four. That pushed Sprint 3 delivery out by nearly two weeks and required a scope conversation with the project sponsor.

**Stakeholder availability.** Getting five stakeholders to agree on requirements is never easy, especially when Sales and Compliance have different priorities. The Sales team wanted speed and simplicity. Compliance wanted audit trails and access controls. We spent more time than I'd have liked negotiating the access control model, but we got there.

**UAT participation.** Business users were willing but busy. We originally planned a two-week UAT window. We ended up running UAT in focused half-day sessions over three weeks instead, which worked better for the team but required more coordination from my side.

---

## Results So Far (As of April 2026 — Project Still in Hypercare)

Using the XYZ format to describe what we've achieved:

- **Reduced lead response time** from 48–72 hours to under 3 hours **by automating lead assignment and follow-up workflows** in Salesforce, replacing a manual email-based process
- **Improved lead conversion rate** from approximately 12% to around 17-18% (still tracking — it's early) **by ensuring every lead is assigned, followed up, and tracked in real time**
- **Reduced data entry error rate** from ~30% to under 5% **by enforcing field validation rules at the point of entry and running pre-migration data cleansing across ~48,900 records**
- **Eliminated ~4 hours/week of manual reporting per manager** by building automated Power BI dashboards **connected directly to live Salesforce data**
- **Achieved 93% UAT pass rate on first run** — we had 6 defects, resolved 4 before go-live, deferred 2 low-priority items to Sprint 6

---

## What I'd Do Differently

Honestly, I'd push harder for a data quality sprint at the very start — before we finalized the BRD. We made assumptions about source data that turned out to be wrong, and it cost us time mid-project. Running even a basic SQL profiling exercise in week one would have surfaced those issues earlier.

I'd also set clearer availability expectations with business stakeholders before UAT. We lost about 3 days waiting for sign-off because two stakeholders were in back-to-back budget reviews. Not the end of the world, but avoidable.

---

## Tech Used

Salesforce (Sales Cloud), SQL Server, Power BI, JIRA, Confluence, MS Visio, SharePoint, Excel, MS Teams
