# Scholarship Agent

## Summary
Build an agent that helps find, submit, and track scholarship opportunities for the user's son across local, state, and national sources.

## Problem
Scholarship opportunities are scattered across many sources, each with different eligibility rules, deadlines, submission requirements, and tracking needs. Managing discovery, application progress, and deadlines manually is time-consuming and easy to miss.

## Proposed Automation
Create an agent that supports the full scholarship workflow: discovery, submission support, tracking, and deadline management. The system should search across local, state, and national scholarship sources, organize matching opportunities, track requirements and due dates, and support application progress over time.

An intake form will be needed to collect the student's profile and matching criteria.

Workflow notes:
- The workflow still needs to be designed.
- If a scholarship source offers an API, use the API.
- If no API exists, browser actions may be needed.
- The system should likely combine source discovery, eligibility filtering, deadline tracking, and application workflow support.
- Probability scoring is a useful priority layer so the best-fit scholarships appear first.

## Potential Users
- parents helping students apply for scholarships
- high school students
- college-bound students
- families managing multiple scholarship applications

## Monetization Ideas
- family subscription
- concierge scholarship search service
- school counselor support tool
- premium application tracking product

## Questions / Unknowns
- What information should the intake form collect?
- Which scholarship sites are most useful and trustworthy?
- Which common scholarship application questions should the intake form anticipate?
- Should the agent only discover scholarships, or also generate application checklists and reminders?
- What output format is best: spreadsheet, dashboard, or structured notes?
- How should the system rank the best-fit opportunities using probability scoring?

## References
- local scholarships
- state scholarships
- national scholarships
- school and counselor resources
- scholarship directories
- scholarship search websites

## Next Small Tasks
- define intake form fields
- review scholarship sites to identify common application questions
- define scholarship ranking criteria
- identify trusted scholarship sources
- define tracking workflow for deadlines and submission status
- decide API-first versus browser-action workflow by source

## Status
Clarifying
