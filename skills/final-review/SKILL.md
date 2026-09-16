---
name: final-review
description: Coordinate an independent, read-only readiness review of a branch or code change using complementary reviewers. Use only when explicitly invoked as `$final-review`.
---

# Final Review

Assess whether a coherent change is ready for human review or merge.
An open pull request is not required.
The review is read-only; any separately authorized fixes or remote changes belong in a subsequent phase.

## Establish the target and brief

Identify the repository, target, comparison base, and any staged, unstaged, or untracked work in scope.
Use an explicit base when supplied; otherwise use the pull request's base or infer one from the branch context, accounting for stacked branches.
Review the committed diff from the merge base together with the agreed working-tree changes.
Ask only when ambiguity would materially change the review.

Record the resolved base and target object IDs and, for working-tree changes, a fingerprint covering their status and contents.
Keep the target stable during review and check it again before synthesizing results.
If it changes, update the affected reviews as described under **Subsequent changes** before giving a verdict.

Give each reviewer a neutral brief containing:

- the repository path, recorded target, base, and working-tree scope;
- intended behavior, requirements, non-goals, and requested focus;
- relevant design rationale, presented as claims open to challenge; and
- relevant pull request text, durable artifacts, and validation evidence, identifying the revision to which results apply.

Do not pass the authoring conversation wholesale or prime reviewers with a desired verdict.
Use established facts to avoid rediscovery, while leaving reviewers free to verify material claims and challenge the design.

## Assign independent reviews

For an initial review of code or other behavior-affecting changes, use two fresh agents in the core design and correctness roles below.
Add a fresh test-auditing agent when requested or when the core reviews leave a consequential question about test quality or coverage.
For changes limited to explanatory prose or nonbehavioral metadata, one fresh reader checking clarity and factual claims is sufficient.
Instructions, configuration, and similar artifacts can change behavior; assess their effect when choosing coverage.

Use `fork_turns: "none"` and require reviewers to remain read-only, read applicable repository instructions, and not delegate further.
Both core reviewers should inspect the complete change and relevant surrounding code; divide responsibilities by perspective rather than by file.
Do not show reviewers one another's conclusions.
If independent agents are unavailable, report the limitation.

Tell the user the planned reviewer count and roles, including any specialists added later.
Run independent reviews in parallel where possible and in batches when necessary.
Scale depth to the change, honor explicit requests about reviewer count or focus, and identify any material coverage omitted as a result.

### Design and expression

First inspect the affected interfaces and documentation without reading the substantive diff or implementation bodies.
Use types, signatures, docstrings, and usage examples to understand what an intended user can infer.
Record a brief account of that model and any consequential questions before continuing to the implementation within the same task.
If interface and implementation cannot meaningfully be separated, explain why and adapt the pass.

Then inspect the implementation, callers, tests, and surrounding code, and ask:

- Do the interface and documentation communicate a coherent model, including how the parts fit together?
- Does the implementation support that model, with important constraints and behavior apparent to users and maintainers?
- Does the change fit the project and reuse existing functionality appropriately?
- Could its responsibilities, state, mechanisms, or tests be substantially simpler without weakening the contract?

Apply repository guidance to structure, names, implementation expression, documentation, and test quality.
Look for simpler formulations, unnecessary or implementation-coupled tests, and opportunities to improve the code's readability, elegance, and visual coherence.

### Correctness and integration

Review intended behavior, contracts, compatibility, failure handling, and behavioral test coverage.
Trace invariants and relevant call paths across component boundaries, including caller-visible cleanup and integration behavior.
Check for consequential test gaps, unintended behavior, and unrelated changes in the resulting diff.
Use `$review-agent` for the defect-first pass when available; otherwise perform that pass directly.

Identify material questions that would benefit from specialist review, explaining the question, why it matters, and the relevant paths and available evidence.

### Test auditing

First look at the public interfaces and record proposed test cases, without reading the implementation or existing tests.
Then examine the existing tests and compare them with the proposed cases.
Check that the tests follow the principles in AGENTS.md, looking for issues such as trivial or redundant tests, implementation coupling, excessive mocking or monkey-patching, disproportionate test machinery, and gaps in coverage of public behavior.

### Specialists

Choose additional reviewers according to the questions the change raises, including those identified by reviewers.
Launch evident specialists alongside the core reviewers, and add others when questions need additional expertise or focused attention.
Give each a concrete question, drawing on the [example specialist reviews](references/specialist-reviews.md) when useful.
Specialists contribute domain knowledge to both correctness and design judgment; a focused pass on code presentation can also be useful.
Choose, combine, or add specialties to suit the change; the examples are not an exhaustive list or a required roster.

Use a dedicated lifecycle reviewer when the change materially affects concurrency, operation ordering, cancellation, resource ownership, or lifetime.
Account for implicit concurrency and framework guarantees; the presence of `async` or ordinary resource use alone does not establish a need.

Give specialists the shared brief, their question, and relevant raw evidence without other reviewers' conclusions.
Have them inspect the complete diff far enough to understand interactions, then concentrate on the aspects of the change relevant to their question.
Material questions affecting readiness must be resolved with evidence or reported as gaps.

## Verify and synthesize

Each reviewer should return:

- concrete, actionable findings introduced or materially exposed by the change, ordered by severity, with a location, triggering scenario, consequence, evidence, and fix direction when evident;
- worthwhile suggestions for improving the reviewed change, when there are any; and
- the assessed scope, material limitations, and unresolved questions.

Distinguish defects and actionable design problems from aesthetic suggestions and unresolved questions.
Aesthetic improvements need not fix a defect; explain the proposed improvement and keep subjective preferences separate from blockers.
For findings, use `P0` for a critical universal blocker, `P1` for an urgent problem, `P2` for an ordinary issue worth fixing, and `P3` for a low-impact concern still worth fixing.
Say when there are no findings.
Include detailed supporting notes when they establish a finding or explain uncertainty.

Wait for the assigned reviewers, verify that their coverage matches the requested target, and confirm that the target is unchanged.
Check material findings directly against the cited code and resolve disagreements with evidence.
Reuse existing validation and run only targeted checks needed to settle a concrete question; do not repeat broad suites when existing evidence already answers it.
Consult authoritative sources when a judgment depends on unfamiliar or version-specific behavior, using the project's actual versions and reporting any material uncertainty.

Combine duplicate findings by root cause and present one synthesized list with consistent severity, followed by any worthwhile suggestions.
Finish with a concise readiness assessment identifying the reviewed target and base, blockers, and material gaps.
For a merge-readiness decision, confirm that the live pull request head, comparison base, and mergeable diff match the reviewed inputs; update affected reviews if they differ.
Verify that current checks, approvals, and feedback apply to the reviewed head and have been addressed as required.
Report inaccessible live state as a limitation rather than inferring it from local evidence.

## Subsequent changes

A review applies to its recorded revision and working-tree scope.
When these change, have the affected reviewers verify the changes and their interactions, including any fixes to their findings.
Account for prior findings as closed, open, or superseded with evidence, and determine whether earlier conclusions still hold.
Reuse prior coverage where its reasoning remains valid; repeat the full review when the changes invalidate the earlier design or coverage.
Add specialists when changes raise new questions needing their expertise and record the updated target and coverage before issuing a new verdict.
