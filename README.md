# Mohan Sarath Ayinabathini
### Senior Business Analyst | Banking & Financial Services | Toronto, ON

📧 mohansarath99@outlook.com &nbsp;|&nbsp; 📍 Toronto, ON &nbsp;|&nbsp; 🔗 [LinkedIn](https://linkedin.com/in/mohansarath) &nbsp;|&nbsp; 💼 Open to opportunities

---

I'm a Senior Business Analyst with 5+ years of experience working across Banking, Financial Services, and Insurance. Most of my work has been in Agile delivery environments — writing requirements, running stakeholder workshops, coordinating UAT, and making sure what gets built actually matches what the business asked for.

I put this portfolio together to share some of the BA work I do day to day — requirements docs, user stories, SQL I use for data validation, and a project case study from a CRM migration I've been leading at Home Equity Bank. Nothing here is theoretical — these are artifacts from real work, cleaned up and shared for reference.

---

## 🎯 Animated Project Dashboard

> **Scroll through the interactive dashboard below — project outcomes, sprint velocity, timeline, stakeholder map, and process transformation all in one place.**

<div align="center">

<a href="https://mohansarath99.github.io/BA--Portfolio/portfolio_dashboard.html">
  <img src="https://img.shields.io/badge/View%20Full%20Animated%20Dashboard-185FA5?style=for-the-badge&logo=github&logoColor=white" alt="View Dashboard"/>
</a>

</div>

---

<!-- ANIMATED PORTFOLIO SECTION -->
<!-- The portfolio_dashboard.html file contains all animations -->
<!-- View it at: https://mohansarath99.github.io/BA--Portfolio/portfolio_dashboard.html -->

## 📊 Project Outcomes — CRM Migration · Home Equity Bank

| Metric | Before | After | Impact |
|---|---|---|---|
| Lead response time | 48–72 hours | < 3 hours | ~96% faster |
| Data entry error rate | ~30% | < 5% | ~87% reduction |
| Lead conversion rate | ~12% | ~17–18% | ~50% improvement |
| Manual reporting time | 4 hrs/week | 0 hrs/week | 100% automated |
| Data quality score | ~70% | 96.2% | +37% improvement |
| UAT pass rate | N/A | 93.2% | 4 defects resolved pre go-live |

---

## 🏃 Sprint Velocity

| Sprint | Planned | Delivered | Velocity | Notes |
|---|---|---|---|---|
| Sprint 3 | 44 pts | 37 pts | 84% | Extended 8 days — data quality scope increase |
| Sprint 4 | 41 pts | 38 pts | 93% | 1 story descoped by business |
| Sprint 5 | 32 pts | 29 pts | 91% | 3 stories moved to Sprint 6 — UAT scheduling |

> Sprint 3 was extended after we profiled the full source data and found ~18% of records had quality issues — much higher than the 8% estimated from our initial 5% sample. We added a dedicated cleansing sprint rather than migrate dirty data. Right call, but it pushed go-live by 2 weeks.

---

## 🗓️ Project Timeline

```
Sep 2025          Oct 2025          Jan 2026          Feb 2026          Mar 2026
    │                 │                 │                 │                 │
[Initiation] ──► [BRD + FRD] ──► [Sprint 3*] ──► [Sprint 4] ──► [Sprint 5] ──► [GO-LIVE Mar 10]
                               *Extended +8 days                  UAT 3 weeks    93.2% pass rate
```

| Phase | What I did | Outcome |
|---|---|---|
| Initiation | Stakeholder mapping, scope definition, project charter | 7 stakeholders identified, scope agreed |
| BRD + FRD | Requirements workshops, gap analysis, data mapping | BRD v1.4 signed off after 2 revisions |
| Sprint 3 | Data cleansing + migration load batch 1 | 31,000 records migrated cleanly |
| Sprint 4 | Migration completion, validation, dashboard build | All 48,847 records confirmed in Salesforce |
| Sprint 5 | UAT coordination, defect resolution, go-live prep | 93.2% pass rate, go-live approved Mar 6 |
| Go-live | Production deployment, hypercare | 89% rep adoption on day 1 |

---

## 👥 Stakeholder Map

```
                    ┌─────────────────────┐
          ┌────────►│   Mohan Sarath      │◄────────┐
          │         │   Senior BA         │         │
          │         └─────────────────────┘         │
          │           ▲    ▲    ▲    ▲              │
     ┌────┴────┐  ┌───┘  ┌─┘  └─┐  └───┐  ┌───────┴──────┐
     │ VP Sales│  │  PO  │      │  IT  │  │  Compliance  │
     │ Sponsor │  │      │      │ Lead │  │   Officer    │
     └─────────┘  └──────┘      └──────┘  └──────────────┘
                            ▲
                   ┌────────┴────────┐
                   │  Data Governance│
                   │  + ~115 Users   │
                   └─────────────────┘
```

**Key challenge:** Sales team wanted speed and simplicity. Compliance wanted audit trails and access controls. Took 2 additional JAD sessions to align both sides on the access control model before BRD sign-off.

---

## 🔄 Lead Management — AS-IS vs TO-BE

### AS-IS (Before)
```
Campaign → Admin emails rep (24hr delay) → Rep enters spreadsheet (~30% errors) 
→ Manager waits for Friday email → ~12% conversion rate
```

**Pain points identified in stakeholder workshops:**
- No rules-based lead assignment — reps getting wrong leads
- ~30% data entry error rate from manual spreadsheet entry
- Zero real-time visibility for management
- 4 hours/week wasted on manual reporting per manager
- Leads going cold — no follow-up reminders

### TO-BE (After Salesforce)
```
Web form → Auto-captured in Salesforce → Validated at entry (<5% errors)
→ Auto-assigned by territory rules (60 sec) → Rep notified instantly
→ Follow-up task auto-created → Live dashboard for managers → ~17-18% conversion
```

**What changed:**
- Lead response time: 48–72 hrs → under 3 hours
- Assignment: manual email → rules-based automation in 60 seconds  
- Reporting: Friday manual report → real-time Power BI dashboard
- Data quality: ~70% → 96.2% post-migration

---

## 📁 Project Documents

| Document | Phase | Description |
|---|---|---|
| [Project_Overview.md](./Project_Overview.md) | All phases | Full project background, challenges, and lessons learned |
| [BRD_CRM_Migration_HEB.md](./BRD_CRM_Migration_HEB.md) | Planning | Business requirements, stakeholder register, sign-off |
| [FRD_Lead_Management_Salesforce.md](./FRD_Lead_Management_Salesforce.md) | Design | Functional specs, data mapping, field validation rules |
| [User_Stories_Sprint3_to_5.md](./User_Stories_Sprint3_to_5.md) | Delivery | User stories, acceptance criteria, sprint notes |
| [UAT_Results_CRM_Migration.md](./UAT_Results_CRM_Migration.md) | Testing | Test cases, defect log, stakeholder sign-off |
| [SQL_Data_Validation_Migration.sql](./SQL_Data_Validation_Migration.sql) | Testing | SQL queries used for data profiling and validation |

---

## 🛠️ Skills & Tools

| Category | Skills |
|---|---|
| Requirements | BRD, FRD, User Stories, Use Cases, Acceptance Criteria, Data Mapping |
| Delivery | Agile/Scrum, Sprint Planning, Backlog Grooming, UAT Coordination |
| CRM & Tools | Salesforce Sales & Service Cloud, JIRA, Confluence, SharePoint |
| Data & Reporting | SQL, SSRS, Crystal Reports, Power BI, Advanced Excel |
| Analysis | Gap Analysis, AS-IS/TO-BE, Risk Analysis, SWOT, JAD Sessions |
| Domains | Banking, Financial Services, Insurance, E-Commerce |

---

## 💼 Career Timeline

| Period | Role | Company |
|---|---|---|
| Sep 2025 – Present | Senior Business Analyst | Home Equity Bank, Toronto |
| Sep 2022 – Aug 2024 | Business Analyst | Citi Group, Chicago |
| Nov 2021 – Aug 2022 | Business Analyst | AbbVie, New York |
| May 2020 – Oct 2021 | Business Analyst | Great-West Life, Regina |
| Sep 2019 – Apr 2020 | Business Analyst | Capital One, Virginia |

---

![Profile Views](https://komarev.com/ghpvc/?username=Mohansarath99&color=blue&style=flat)
![Top Languages](https://github-readme-stats.vercel.app/api/top-langs/?username=Mohansarath99&layout=compact&theme=default)
