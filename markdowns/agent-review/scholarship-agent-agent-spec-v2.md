# Scholarship Agent Agent Spec (v2)

## Source Topic
Scholarship Agent

## Research-1 Run Summary
- Input maturity: **medium**
- Research mode: live web discovery + targeted page fetch
- Confidence: **medium-high**
- Confidence note: Discovery search is now working, which improved source breadth and comparative landscape coverage. Confidence is still not “high” because scholarship ecosystems are noisy, some vendor pages change quickly, and API/browser capabilities vary by source.

## Mission
Help a family discover, rank, organize, and track scholarship opportunities for one student through a structured workflow that reduces missed deadlines, improves application follow-through, and prioritizes likely wins over broad low-value searching.

## Primary User
- Parent or guardian coordinating scholarship research for a student
- College-bound student working with family support
- Small family workflow, not a counselor-at-scale platform in v1

## Problem
Scholarship opportunities are fragmented across official databases, school/counselor channels, local foundations, employer/community organizations, and commercial scholarship platforms. Each opportunity has different eligibility rules, deadlines, requirements, and application burdens. Families lose time to scattered searching, stale listings, duplicate opportunities, weak ranking, and poor deadline management.

## Research Findings

### Credible sources reviewed
1. **Federal Student Aid** (`official`) — central federal aid context; supports the importance of FAFSA for need-based aid and broader college funding workflow
2. **CareerOneStop Scholarship Finder** (`official`) — searchable scholarship database with deadline-oriented browsing and clear warning that sponsors may change criteria/deadlines
3. **College Board BigFuture / scholarship ecosystem** (`official/vendor`) — broad scholarship/payment guidance and college-planning context
4. **Scholarships.com** (`vendor`) — widely used scholarship directory and matching platform
5. **Fastweb** (`vendor`) — scholarship matching platform with reported vetting/research approach in discovery sources
6. **Appily** (`vendor`) — practical guidance emphasizing niche-fit scholarship searches and common materials like essays/transcripts
7. **Bold.org** (`vendor`) — active scholarship marketplace with visible categories, deadlines, and broad inventory
8. **Scholarship-focused best-practice aggregations** (`community/vendor mix`) — recurring recommendations around transcripts, recommendation letters, FAFSA, essay prep, and master checklists
9. **Going Merry shutdown signal** (`vendor`) — evidence that platform dependency risk is real; scholarship workflow should not rely on a single provider

### Competing implementations / patterns identified
1. **Large scholarship directory / matching platform**
   - Examples: Scholarships.com, Fastweb, Bold.org, Appily
   - Strength: broad discovery
   - Weakness: noise, duplicates, stale opportunities, platform dependency
2. **Official / trusted-source-first scholarship discovery**
   - Examples: CareerOneStop, College Board ecosystem, school and foundation channels
   - Strength: trust and legitimacy
   - Weakness: less personalization and less centralization
3. **Private ranking + tracker workflow layered on top of public sources**
   - Intake profile + source sweep + scoring + checklist + deadline tracker
   - Strength: highest practical family utility
   - Weakness: requires normalization and maintenance effort

### Repeating practical patterns found
- Strong scholarship workflows use **profile-based matching**, not generic browsing
- Niche scholarships often provide better odds than broad national ones
- Master trackers/checklists are repeatedly recommended to manage applications
- Common materials recur: transcripts, essays/personal statements, recommendation letters, GPA verification, FAFSA for need-based awards
- Source quality and anti-scam filtering matter as much as search breadth

## Chosen V1 Scope Rationale
The original idea included discovery, submission, tracking, and deadlines. A buildable v1 should narrow to:
- structured student intake
- trusted-source scholarship discovery
- normalization into one tracker
- fit + probability ranking
- checklist generation
- deadline/status tracking

V1 should **not** auto-submit applications or depend on brittle browser automation. That adds operational risk before the core ranking/tracking workflow is proven.

## In Scope
- intake form for one student
- source discovery across trusted official/vendor sources
- normalized scholarship record creation
- source-quality tagging
- fit scoring and probability scoring
- deadline tracking
- per-scholarship checklists
- manual submission support workflow
- dedupe across multiple listings

## Out of Scope
- automatic scholarship submission
- autonomous browser form filling by default
- essay ghostwriting that fabricates facts
- legal/financial advice
- guarantee of award outcomes
- scaling to many students/institutions in v1

## Inputs
### Required
- one student intake profile
- scholarship data collected from approved sources

### Intake fields for v1
- student name
- graduation year
- GPA / academic profile
- school name
- city/state
- intended major or interests
- extracurriculars / sports / leadership / service
- awards / honors
- financial need indicators
- demographic/background factors the family chooses to include
- target schools if known
- current document readiness:
  - transcript available?
  - recommendation contacts available?
  - essay draft available?
  - FAFSA status?

### Optional
- geographic preferences
- no-essay preference
- minimum award amount preference
- willingness to complete high-burden applications
- family affiliations (employer, union, military, church, civic groups)

## Outputs
### 1. Master Scholarship Tracker
Fields should include:
- scholarship name
- sponsor / organization
- source URL
- source quality tag (`official`, `vendor`, `community`, `unknown`)
- amount
- deadline
- location scope
- eligibility summary
- fit score
- probability score
- application burden score
- status
- notes

### 2. Per-scholarship summary
- why it fits
- why it may not fit
- required materials
- deadline
- review notes
- next action

### 3. Application checklist
- transcript needed?
- essay needed?
- recommendation letter needed?
- FAFSA/need documentation needed?
- submission method
- due date
- missing items

## Storage
Recommended v1 storage:
- one student profile file
- one master tracker
- optional one file per shortlisted scholarship only

Suggested paths:
- `notes/scholarships/student-profile.md`
- `notes/scholarships/master-tracker.md`

**More information needed:** whether the preferred working format is markdown, spreadsheet, or lightweight database.

## Workflow
1. **Load or create student profile**
   - collect intake data
   - identify critical missing fields
2. **Source discovery**
   - search official and trusted vendor sources first
   - include local/state/school/community opportunities where possible
3. **Normalization + dedupe**
   - standardize amount, deadline, eligibility, sponsor, and requirements
   - merge duplicates across multiple directories
4. **Scoring**
   - compute fit score
   - compute heuristic probability score
   - compute burden score
   - boost urgent but realistic opportunities
5. **Checklist generation**
   - create action items and missing document flags
6. **Tracking**
   - update status and deadlines
   - surface near-term priorities
   - mark uncertain eligibility with review flags

## Decision Rules
- Prefer official and high-trust sources for core facts
- Keep vendor/community sources, but tag them clearly and downgrade confidence when they conflict with official guidance
- If a scholarship strongly matches but some requirements are unclear, keep it and mark `More information needed`
- Prefer likely wins over broad prestigious opportunities with weak fit
- Penalize high-burden, low-fit scholarships
- Treat platform convenience as secondary to legitimacy and fit
- If an API exists, prefer it; otherwise use browser/manual collection later as needed
- Never submit or autofill external forms without explicit approval

## Ranking Model (V1)
Suggested weighting:
- **35% fit score** — academic, geographic, major, extracurricular, eligibility match
- **20% probability score** — estimated chance of success relative to competitiveness and niche fit
- **20% deadline urgency** — realistic urgency, not just nearest date
- **15% award value** — size and practical usefulness
- **10% application burden** — essays, recommendations, extra requirements

## Probability Scoring Guidance
Probability should be heuristic in v1, not marketed as certainty.

Good signs:
- niche/local/community scholarship
- clear eligibility match
- student aligns closely with target criteria
- manageable burden with existing documents ready
- less nationally crowded opportunity

Bad signs:
- unclear legitimacy
- broad sweepstakes-style or low-trust lead-gen feel
- highly competitive national opportunity with weak fit
- high burden with low likely return

**More information needed:** reliable historical win-rate data is usually unavailable, so probability remains a best-effort ranking feature.

## Memory / State
Track over time:
- student profile
- scholarship tracker records
- source list used
- manual notes and decisions
- document readiness
- deadlines and reminders
- application status

## Tools / Integrations
### Minimum
- web search
- web fetch / browser access
- markdown or spreadsheet write access
- URL dedupe
- date parsing
- source-quality tagging

### Optional later
- scholarship-source APIs
- browser automation for no-API sources
- reminder/calendar integration
- document parsing
- email drafting for recommendation requests

## Human Approval Boundaries
Require approval for:
- any submission to a scholarship platform
- any personal-data entry in browser flows
- any account creation/login
- outbound emails/messages
- deletion or destructive modification of tracking records
- any claim that could be interpreted as legal/financial certainty

## Risks / Failure Modes
1. Hallucinated eligibility claims from weak sources
2. Stale deadlines or changed criteria
3. Duplicate records from multiple platforms
4. Overweighting scholarship amount over realistic odds
5. Privacy leakage of student/family data
6. Over-automation of submission workflows
7. Dependency on a platform that changes policy or shuts down

## Mitigations
- visible source-quality tags
- official/trusted-source preference
- recurring deadline re-check before action
- central dedupe logic
- explicit `More information needed` markers
- manual submission boundary in v1
- tracker-based workflow instead of single-platform dependency

## Success Criteria
- the agent creates a clear, usable scholarship pipeline for one student
- top-ranked opportunities are plausible and actionable
- deadlines and missing materials are visible
- duplicate/manual chaos is reduced
- a parent can use the outputs without major reinterpretation

## Smallest Useful V1
- intake form for one student
- trusted-source scholarship discovery
- normalized tracker
- fit/probability scoring
- checklist generation
- deadline and status tracking

## Later Versions
- **Phase 2:** reminders, calendar sync, better local-source ingestion, stronger scoring
- **Phase 3:** optional browser-assisted application workflows, document management, family dashboard
- **Future ideas:** scholarship-source benchmarking, essay component library, historical tracker analytics

## Source Quality Notes
- Federal Student Aid — `official`
- CareerOneStop — `official`
- College Board BigFuture — `official/vendor`
- Scholarships.com — `vendor`
- Fastweb — `vendor`
- Appily — `vendor`
- Bold.org — `vendor`
- Going Merry shutdown notice — `vendor`
- best-practice scholarship checklist/guide content — `community` or `vendor` depending on source

## More Information Needed
- preferred storage format for real operation
- preferred reminder channel
- whether to prioritize no-essay scholarships or highest-fit scholarships overall
- preferred first source set for v1
- whether school counselor/local foundation workflows should be manually seeded first

## Free-Tier Provider Capability Matrix
| model | supports_web_search | max_context_class | cost_tier | rate_limit_risk | notes |
|---|---|---|---|---|---|
| gemini-2.0-flash | optional/tool-dependent | medium | free | medium | Fast and cost-effective for synthesis |
| claude-sonnet-4-5 | optional/tool-dependent | high | free/limited | medium-high | Strong writing/spec quality |
| gpt-4o-mini | optional/tool-dependent | medium | free/low | medium | Good general-purpose baseline |
