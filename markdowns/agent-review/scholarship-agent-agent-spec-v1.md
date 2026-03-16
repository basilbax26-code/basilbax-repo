# Scholarship Agent Agent Spec (v1)

## Source Topic
Scholarship Agent

## Research-1 Run Summary
- Input maturity: **medium**
- Research mode: direct web fetch from known sources
- Confidence: **medium**
- Confidence note: Web search discovery was unavailable in this environment, so source breadth is narrower than ideal. Recommendations below rely on a mix of official sources, established scholarship platforms, and practical workflow inference. **More information needed** for a fuller competitive landscape sweep.

## Mission
Help a family discover, rank, organize, and track scholarship opportunities for one student through a structured workflow that reduces missed deadlines and improves application follow-through.

## Primary User
- Parent or guardian coordinating scholarship research for a student
- College-bound high school student working with family support
- Small family workflow, not a large institutional counseling system in v1

## Problem
Scholarship opportunities are fragmented across local, state, school, nonprofit, employer, and national sources. Each scholarship has different eligibility rules, requirements, deadlines, and application burdens. Families often lose time to scattered searches, duplicate tracking, weak ranking, and missed deadlines.

## Research Findings

### Credible sources reviewed
1. **Federal Student Aid** (`official`) — federal financial-aid guidance and scholarship context
2. **CareerOneStop Scholarship Finder** (`official`) — searchable scholarship database with filters and deadline-oriented browsing
3. **College Board BigFuture Pay for College** (`official/vendor`) — FAFSA and college payment guidance; useful ecosystem signal
4. **Appily Scholarships** (`vendor`) — practical student-facing guidance emphasizing niche-fit searches and common application materials
5. **Bold.org Scholarships** (`vendor`) — active scholarship marketplace with broad inventory and visible deadlines/categories
6. **Going Merry shutdown notice** (`vendor`) — evidence that platform dependency risk is real; scholarship platforms can disappear
7. **Fastweb page/network result** (`vendor/unknown for current page reliability`) — indicates source instability and stale-link risk in discovery workflows
8. **Original user topic file** (`internal`) — defines needed workflow: discovery, submission support, tracking, deadlines, intake form, API-first/browser fallback, probability scoring

### Competing implementation patterns identified
1. **Scholarship marketplace / directory pattern**
   - Example signals: Bold.org, Appily, CareerOneStop
   - Strength: broad discovery
   - Weakness: noisy results, platform dependency, mixed quality
2. **Trusted-source aggregator + tracker pattern**
   - Search selected official/school/local/foundation sources and normalize results into a private tracker
   - Strength: higher trust and better family control
   - Weakness: slower source expansion
3. **Profile-driven ranking + checklist workflow pattern**
   - Intake profile drives matching, probability scoring, and per-scholarship action lists
   - Strength: highest practical utility for a family
   - Weakness: requires stronger data normalization and update logic

### Practical anti-patterns / risks observed
1. Over-relying on one scholarship platform
2. Treating all scholarships as equally worth applying to
3. Ignoring application burden when ranking opportunities
4. Failing to separate trusted sources from low-confidence listings
5. Not tracking deadlines and document readiness in one place
6. Assuming scholarship source APIs exist or are stable
7. Optimizing for quantity of matches instead of likely wins

## Chosen V1 Scope Rationale
The broad idea included discovery, submission, tracking, and deadlines. To keep v1 buildable, the agent should focus on:
- profile intake
- trusted-source discovery
- fit/probability ranking
- master tracker creation
- application checklist generation
- deadline/status tracking

V1 should **not** auto-submit applications or deeply automate browser filling. That is higher-risk, brittle, and unnecessary for proving value.

## In Scope
- Collect student profile information through an intake form
- Search trusted scholarship sources
- Normalize scholarship records into a common structure
- Rank scholarships by fit, expected value, and deadline urgency
- Generate per-scholarship summaries and action checklists
- Maintain one master tracker for deadlines and progress
- Flag missing documents and unresolved eligibility questions
- Support manual submission workflow

## Out of Scope
- Automatic application submission
- Autonomous browser form completion by default
- Essay writing that fabricates facts or achievements
- Legal/financial advice
- Guaranteeing eligibility or award probability
- Broad multi-student institutional deployment in v1

## Inputs
### Required
- One student intake profile
- Scholarship source data from approved websites/directories

### Recommended intake fields
- student name
- graduation year
- GPA / academic profile
- city/state
- school name
- intended major or interests
- extracurriculars / sports / volunteering
- awards / honors
- financial need indicators
- demographic/background factors the family is comfortable using
- target schools if known
- available documents (transcript, recommendations, essay drafts)

### Optional
- religious / employer / union / military affiliations
- preferred geographic limits
- application-time budget
- willingness to write essays vs no-essay preference

## Outputs
The agent should save or maintain:
1. **Master Scholarship Tracker**
   - scholarship name
   - source
   - URL
   - amount
   - deadline
   - eligibility summary
   - fit score
   - probability score
   - application burden
   - status
   - notes
2. **Per-scholarship summary**
   - why it matches
   - why it may not match
   - required materials
   - deadline
   - next action
3. **Application checklist**
   - documents required
   - essays required
   - recommendation letters
   - submission method
   - reminders / deadlines

## Storage
Recommended v1 storage:
- one student profile file
- one master tracker file or spreadsheet
- optional one file per scholarship only for shortlisted opportunities

Suggested paths:
- `notes/scholarships/student-profile.md`
- `notes/scholarships/master-tracker.md`

**More information needed:** exact preferred storage format (markdown tracker vs spreadsheet vs small database).

## Workflow
1. **Intake**
   - collect or load the student profile
   - identify high-impact missing fields
   - mark incomplete profile areas
2. **Source sweep**
   - search trusted scholarship sources first
   - collect local, state, school, and national opportunities
   - record source quality tag per item
3. **Normalization**
   - standardize deadlines, amount, eligibility, and application requirements
   - dedupe repeated opportunities across sources
4. **Ranking**
   - compute fit score and probability score
   - factor deadline urgency and application burden
   - push strongest opportunities to the top
5. **Checklist generation**
   - create required-task lists for each prioritized scholarship
   - identify missing documents or unanswered questions
6. **Tracking**
   - update status
   - surface approaching deadlines
   - flag stalled applications

## Decision Rules
- Prefer **trusted and current** sources over larger but noisier sources
- If a scholarship is high-value but data is incomplete, keep it with a review flag instead of dropping it immediately
- Prefer likely wins over broad low-fit opportunities
- Penalize scholarships with high burden and low fit
- If a source offers an API, use it; if not, browser actions may be considered later, not in v1 by default
- Never submit or autofill external forms without explicit human approval
- Use `More information needed` when source quality or eligibility interpretation is unclear

## Ranking Model (V1)
Suggested initial weighting:
- **35% fit score** — match to academics, interests, eligibility, location, background
- **20% probability score** — estimated chance of success based on fit + competitiveness proxy
- **20% deadline urgency** — nearer deadlines rise in priority if realistic to complete
- **15% scholarship amount / expected value**
- **10% application burden** — essay complexity, documents, recommendation requirements

## Probability Scoring Guidance
Probability should not mean certainty; it should mean **relative expected win likelihood**.

Possible inputs:
- niche specificity match
- clear eligibility match
- local or organization-specific opportunity
- application burden vs student readiness
- scholarship amount vs expected competitiveness

**More information needed:** historic acceptance/winner-rate data will be sparse, so the early model will be heuristic rather than statistical.

## Memory / State
Track over time:
- student profile
- source list used
- scholarship tracker state
- status per application
- document readiness
- reminders / deadlines
- manual notes from family decisions

## Tools / Integrations
### Minimum
- web fetch / browser access
- markdown or spreadsheet write access
- URL dedupe
- date parsing
- source-quality tagging

### Optional later
- scholarship-source APIs
- browser automation for sites without APIs
- reminder/calendar integration
- document parser for transcripts and essays

## Human Approval Boundaries
Require approval for:
- any external submission
- any account creation or login on scholarship sites
- any browser action that enters personal data
- any email sending or recommendation-request workflow
- deletion or destructive modification of trackers

## Risks / Failure Modes
1. Hallucinated eligibility claims from weak sources
2. Ranking that overvalues amount and undervalues realistic fit
3. Source rot, stale deadlines, or broken listings
4. Privacy leakage of student personal information
5. Duplicate scholarship records across directories
6. Over-automation in submission workflows
7. Weak trust model when a platform shuts down or changes policies

## Mitigations
- tag sources as `official`, `vendor`, `community`, or `unknown`
- prioritize official/school/foundation sources where possible
- use visible `More information needed` markers
- keep submission manual in v1
- centralize tracking and dedupe by scholarship name + sponsor + deadline + URL
- periodically re-check deadlines before action

## Success Criteria
- file/tracker structure supports end-to-end scholarship workflow for one student
- strongest scholarships are surfaced without major reinterpretation
- deadlines and missing materials are visible
- duplicate/manual chaos is reduced
- ranking is useful enough that a parent would trust the top of the queue

## Smallest Useful V1
- intake form for one student
- approved-source discovery workflow
- normalized master scholarship tracker
- fit/probability scoring
- deadline and status tracking
- checklist generation for shortlisted scholarships

## Later Versions
- **Phase 2:** reminders, calendar sync, richer source expansion, improved scoring
- **Phase 3:** optional browser-assisted application support, document management, family dashboard
- **Future ideas:** benchmark scholarship source quality, track historical wins, reusable essay component management

## Source Quality Notes
- Federal Student Aid — `official`
- CareerOneStop — `official`
- College Board BigFuture — `official/vendor`
- Appily — `vendor`
- Bold.org — `vendor`
- Going Merry shutdown page — `vendor`
- Fastweb current page path result — `unknown` for reliable current use in this run

## More Information Needed
- Which exact scholarship sites are preferred for v1
- Preferred storage/output format
- Preferred reminder mechanism
- Whether local school/counselor sources can be integrated manually first
- Whether the workflow should prioritize no-essay scholarships or highest-fit scholarships regardless of burden

## Free-Tier Provider Capability Matrix
| model | supports_web_search | max_context_class | cost_tier | rate_limit_risk | notes |
|---|---|---|---|---|---|
| gemini-2.0-flash | optional/tool-dependent | medium | free | medium | Fast and cost-effective for synthesis |
| claude-sonnet-4-5 | optional/tool-dependent | high | free/limited | medium-high | Strong writing/spec quality |
| gpt-4o-mini | optional/tool-dependent | medium | free/low | medium | Good general-purpose baseline |
