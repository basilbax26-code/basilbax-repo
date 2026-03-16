# Fastweb Retest Notes

## Test Goal
See how the scholarship workflow should handle Fastweb for a mock student profile.

## Test Profile Used
- State: Colorado
- School: MSU Denver
- Class standing: Junior
- GPA: 3.4
- Background: Hispanic male
- Intended field: Doctor of Physical Therapy pathway

## What Fastweb exposed publicly
Fastweb's public site clearly states that:
- it is a free scholarship search platform
- it uses a student profile to generate personalized scholarship matches
- it emphasizes a vetted scholarship database
- it recommends organizing scholarship applications and required materials carefully

This confirms Fastweb is useful both as:
1. a scholarship discovery source
2. a workflow-pattern source for application readiness and checklist structure

## What discovery search surfaced
Fastweb discovery queries surfaced:
- physical therapy scholarship directory pages
- Hispanic scholarship directory pages
- University of Colorado physical therapy scholarship pages hosted or indexed through Fastweb
- Fastweb checklist and organization content for scholarship applications

## Practical handling rules for Fastweb
### Use Fastweb for
- broad scholarship discovery
- category exploration (Hispanic, physical therapy, pre-physical therapy, etc.)
- public scholarship/checklist guidance
- candidate lead generation for later verification

### Do not treat Fastweb as final authority for
- exact current deadlines
- final eligibility interpretation
- sponsor-side submission rules

### Agent behavior
- Pull candidate scholarships from Fastweb.
- Tag Fastweb as `vendor` source quality.
- Verify high-interest scholarships on the sponsor or institution page before ranking them too highly.
- Keep Fastweb-driven matches in the tracker, but add a verification step before action.

## Observed candidate directions from Fastweb-focused testing
### Stronger direct/adjacent matches
- Hispanic scholarship directories
- physical therapy scholarship directories
- pre-physical therapy major scholarship directories
- University of Colorado physical therapy scholarships

### Likely outcome
For this specific mock student, Fastweb appears more useful as a **discovery accelerator** than as the final source of truth.
The strongest next-step matches still appear to be:
- institutional scholarships (MSU Denver)
- Colorado/Latino scholarships
- broader Hispanic scholarship programs
- later-stage PT-specific scholarships depending on program stage

## Suggested workflow role for Fastweb in v1
1. Search Fastweb categories/directories based on the intake profile.
2. Add plausible matches to the tracker.
3. Verify each serious candidate on the sponsor page.
4. Only then apply fit/probability scoring with higher confidence.

## Confidence
- Medium
- Why not higher: this retest used public discovery and search-indexed Fastweb pages, not an authenticated in-account personalized scholarship dashboard.

## More information needed
- Whether the Fastweb account profile is fully filled out
- Whether logged-in matching reveals substantially better scholarships for this student
- Whether Fastweb exports, saves, or organizes applications in a way worth integrating into the workflow
