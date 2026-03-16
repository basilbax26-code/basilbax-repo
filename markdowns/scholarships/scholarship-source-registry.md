# Scholarship Source Registry

Purpose: canonical source registry for rigorous scholarship searches.

## Field definitions
- **source_name**: human-readable label
- **url**: canonical starting URL
- **category**: `official`, `directory`, `institutional`, `community`, `context`, `portal`, `exclude`
- **geography**: `national`, `colorado`, `denver-metro`, `school-specific`, or `unknown`
- **access_type**: `public`, `login-required`, `portal-dependent`, `unknown`
- **source_quality**: `high`, `medium`, `low`, `unknown`
- **search_value**: `high`, `medium`, `low`
- **credential_status**: `not-needed`, `needed-later`, `unknown`, `do-not-create-yet`
- **notes**: operational notes for future scholarship-agent runs
- **last_reviewed**: `2026-03-15`

---

## Active Registry

| source_name | url | category | geography | access_type | source_quality | search_value | credential_status | notes | last_reviewed |
|---|---|---|---|---|---|---|---|---|---|
| Anthony ONeal Scholarships | https://www.anthonyoneal.com/scholarships | directory | national | public | medium | medium | not-needed | Broad scholarship content/discovery source; validate sponsor pages directly before action. | 2026-03-15 |
| BigFuture Scholarship Match | https://bigfuture.collegeboard.org/scholarship-match | directory | national | public/login-may-help | high | high | needed-later | Strong discovery source; College Board ecosystem is useful for scholarship and aid context. | 2026-03-15 |
| Fastweb | https://www.fastweb.com/ | directory | national | public/login-may-help | medium-high | high | needed-later | Major scholarship directory; account may improve matching and saved searches. | 2026-03-15 |
| Cappex First-Generation Scholarships | https://www.cappex.com/scholarships/first-generation | directory | national | public | medium | medium | not-needed | Useful targeted category source, especially when first-generation status applies. | 2026-03-15 |
| Common App | https://www.commonapp.org/ | context | national | public/login-may-help | high | low | not-needed | Useful for college application context; not a primary scholarship registry. | 2026-03-15 |
| U.S. Dept. of Education State Contacts | https://www2.ed.gov/about/contacts/state/index.html | official | national | public | high | low | not-needed | Useful for state contact mapping and official education navigation. | 2026-03-15 |
| Colorado Dept. of Education Contacts | https://www2.ed.gov/about/contacts/state/co.html | official | colorado | public | high | low-medium | not-needed | Useful for Colorado state-level education contact/reference context. | 2026-03-15 |
| FAFSA / Federal Student Aid | https://studentaid.ed.gov/sa/fafsa | official | national | public/login-for-filing | high | medium | not-needed | Critical for aid workflow and need-based scholarship context, but not a scholarship directory itself. | 2026-03-15 |
| Denver Scholarship Foundation Directory PDFs | https://denverscholarship.org/students-alumni/scholarship-directory/download-pdfs/ | institutional | denver-metro | public | high | high | not-needed | Strong Colorado/Denver scholarship seed source. | 2026-03-15 |
| DSF Institutional Scholarships | https://denverscholarship.org/students-alumni/scholarship-directory/download-pdfs/dsf-scholarship-directory-institutional-scholarships/ | institutional | denver-metro | public | high | high | not-needed | Strong institutional scholarship seed source for Denver students. | 2026-03-15 |
| Coca-Cola Scholars Foundation | https://www.coca-colascholarsfoundation.org/ | institutional | national | public | high | medium-high | not-needed | Major branded scholarship foundation; likely high competition. | 2026-03-15 |
| Red Rocks Community College Foundation Scholarships | https://www.rrcc.edu/foundation/scholarship-programs | institutional | colorado | public | high | medium | not-needed | Strong Colorado institutional source; useful if transfer/community-college pathways apply. | 2026-03-15 |
| Kit Faragher Foundation Scholarship | http://www.kitfaragherfoundation.org/Scholarship.html | community | colorado | public | medium | medium | not-needed | Small foundation-style source; verify freshness and deadlines carefully. | 2026-03-15 |
| Grand Lodge of Colorado Scholarships | https://grandlodgeofcolorado.org/philanthropy/scholarships | community | colorado | public | medium-high | medium | not-needed | Good community/foundation-style Colorado source. | 2026-03-15 |
| College Board Opportunity Scholarships | https://opportunity.collegeboard.org/about/apply | institutional | national | public/login-may-help | high | medium | needed-later | Useful College Board opportunity source; may depend on profile/account state. | 2026-03-15 |
| CCCS Foundation Scholarships | https://www.cccs.edu/cccs-foundation/scholarships/ | institutional | colorado | public | high | medium-high | not-needed | Strong Colorado system-level scholarship source. | 2026-03-15 |
| Jeffco Schools Foundation Scholarships | https://www.jeffcoschoolsfoundation.org/scholarships.html | community | colorado | public | high | medium-high | not-needed | Valuable local Colorado scholarship source. | 2026-03-15 |
| Northey Foundation | https://northeyfoundation.org/overview | community | colorado | public | medium | medium | not-needed | Foundation source worth checking in Colorado/local workflows. | 2026-03-15 |
| Joe Francis Scholarship Apply | https://www.joefrancis.com/apply | community | unknown | public | medium | medium | not-needed | Candidate scholarship source; validate geography and fit. | 2026-03-15 |
| Anthony ONeal Specific Scholarship Page | https://www.anthonyoneal.com/scholarships/34347 | directory | national | public | medium | low-medium | not-needed | Single scholarship page; useful as direct lead, less useful as broad registry anchor. | 2026-03-15 |
| Naviance Scholarship Record 115319 | https://student.naviance.com/colleges/scholarships/115319 | portal | school-specific | portal-dependent | medium | medium | needed-later | Likely student-portal dependent; may require school-linked login. | 2026-03-15 |
| Naviance Scholarship Record 2330471 | https://student.naviance.com/colleges/scholarships/2330471 | portal | school-specific | portal-dependent | medium | medium | needed-later | Likely student-portal dependent; may require school-linked login. | 2026-03-15 |
| Naviance Scholarship Record 2582158 | https://student.naviance.com/colleges/scholarships/2582158 | portal | school-specific | portal-dependent | medium | medium | needed-later | Likely student-portal dependent; may require school-linked login. | 2026-03-15 |
| Naviance Scholarship Record 2402128 | https://student.naviance.com/colleges/scholarships/2402128 | portal | school-specific | portal-dependent | medium | medium | needed-later | Likely student-portal dependent; may require school-linked login. | 2026-03-15 |
| SMS Scholarships Naviance Widget | https://smscholarships.com/naviance/nwidget.cfm?page=2FASA | portal | school-specific | portal-dependent | unknown | medium | needed-later | Likely Naviance-adjacent/partner widget; verify access and legitimacy during use. | 2026-03-15 |

---

## Excluded / Do Not Use as Search Seeds

| source_name | url | reason |
|---|---|---|
| Clever OAuth Flow | https://clever.com/oauth/authorize?channel=clever&client_id=4c63c1cf623dce82caac&confirmed=true&redirect_uri=https%3A%2F%2Fclever.com%2Fin%2Fauth_callback&response_type=code&state=96dda79302064c3b499f1852b237eba246f1830318d846f207715417707f8403&district_id=573f84ce403fe40100000fb7 | OAuth/login flow, not a scholarship source |
| Lincoln Academy + Coca-Cola malformed URL | https://www.lincolnacademy.net/domain/99https://www.coca-colascholarsfoundation.org/ | malformed combined URL |
| Naviance High Schools Product Page | https://www.naviance.com/solutions/high-schools | product page, not scholarship inventory |

---

## Credential Strategy Notes
- Do **not** create external accounts automatically.
- Add credentials only when a source clearly benefits from login-based saved matching, history, or deeper access.
- Likely login candidates for future testing:
  - Fastweb
  - BigFuture / College Board
  - possibly Naviance, if a valid school-linked student account exists
- Before creating any account, decide:
  - whose identity will own it
  - whether it is a real student account or a test account
  - what personal data is acceptable to store there

## Next Registry Expansion
Recommended new columns later:
- `last_successful_search`
- `supports_filters`
- `supports_saved_profile`
- `supports_export`
- `api_available`
- `browser_required`
- `colorado_relevance_score`
- `hispanic_relevance_score`
- `healthcare_relevance_score`
