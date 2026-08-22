---
name: final-review
description: Coordinate independent, read-only reviewers for a branch or code change before merge or human handoff. Use when asked for a final, pre-merge, pre-PR, pre-handoff, readiness, or fresh-eyes review; do not use for narrow review questions, ordinary implementation checks, or merely because work is complete.
---

# Final Review

Obtain an independent, revision-specific assessment of whether a coherent change is ready for human review or merge.
An open pull request is not required.
The review is read-only and does not itself authorize fixes, commits, pushes, pull request changes, comment resolution, or merges.

## When to use it

Use this skill after the intended change is coherent and the user asks for a final review, a fresh set of eyes, or a readiness decision before opening, handing off, or merging it.
Do not invoke it merely because implementation is complete or because the user asks to open or create a pull request without also asking for a readiness review.
The review does not become an automatic review-and-fix loop.

## Establish a stable target

- Identify the repository, target branch or change, comparison base, and whether staged, unstaged, or untracked work belongs to the review.
- Use an explicit base when supplied; otherwise use an existing pull request's configured base or safely infer one, accounting for stacked branches.
- Review the committed diff from the merge base through the target together with any established working-tree scope.
- Record the resolved base and target object IDs and, when working-tree changes are in scope, a fingerprint covering their status and contents.
- Keep the target and shared worktree stable during review.
  If any review input changes, re-establish the target and specialist routing, discard stale conclusions, and rerun the applicable reviewers.
- If live pull request state is inaccessible from the current environment, report that limitation rather than inferring checks, approvals, or remote authentication state from local evidence.

Ask only when ambiguity about the target would materially change the review.

## Prepare a neutral brief

Give every reviewer the same factual foundation:

- the repository path, target, comparison base, and exact working-tree scope;
- the intended behavior and relevant requirements when they are not discoverable from durable repository or pull request artifacts;
- hard requirements, explicit non-goals, and requested areas of focus that constrain the review;
- relevant design choices and rationale, labeled as claims open to challenge unless the user explicitly excluded them from review;
- an existing pull request reference and its current title and body when relevant; and
- existing validation evidence or logs, including the revision to which they apply, that may answer factual questions without being rerun.

Do not pass the authoring conversation wholesale or prime a reviewer with a desired verdict.
Treat supplied summaries and results as evidence to verify when material, not as conclusions or substitutes for inspecting the complete diff.

## Select independent reviewers

Use fresh subagents with `fork_turns: "none"`.
Tell each reviewer to remain read-only, inspect the complete change by the end of its assigned procedure, read every applicable `AGENTS.md` or `CLAUDE.md`, and not delegate further.
Reviewers may inspect any surrounding code needed to understand cross-boundary effects, but findings must concern problems introduced or materially exposed by the reviewed change.
Do not shard the diff by file or show reviewers one another's conclusions.
Run independent reviews in parallel when capacity permits.
If capacity is limited, run reviewers in batches rather than omitting one.
If a genuinely fresh reviewer cannot be launched, report that limitation instead of silently substituting self-review.
Use supplied evidence instead of repeating exploration or broad validation that it already settles, and stop after the complete diff and assigned material risks have been examined.

Before launching reviewers, tell the user the planned number of distinct reviewer agents and their roles, including any specialists already evident from the change.
Count phases and follow-up turns within one role as one reviewer.
Treat the routing below as the default for a full readiness review.
Honor an explicit user request for a reviewer count or role.
If that request omits default coverage, name the omitted lenses and describe the result as a limited review rather than a full readiness review.
Announce any specialist added after the risk map and explain why it is needed.

For changes limited to explanatory prose or demonstrably nonbehavioral metadata, the default is one fresh prose-and-claims reader.
Have that reviewer apply the repository's prose instructions, verify factual and behavioral claims against current sources, distinguish current behavior from proposed or deferred design, check names and links, and report consequential problems rather than rewriting to taste.
Treat instructions, prompts, manifests, packaging, schemas, policy, CI, and configuration as behavioral unless their inertness is established.
For a full initial review of code, tests, or other behavior-affecting artifacts, launch both core reviewers below.
Scale their depth to the change rather than collapsing their distinct responsibilities into one pass.

### Design and expression reviewer

This reviewer asks whether the change presents a coherent, economical model of the system from its place in the repository down to the code and documentation through which a reader encounters it.
It owns interface clarity, high-level structure, project fit, reuse, code smells, implementation expression, and explanatory quality.
Ownership directs depth rather than suppressing a material issue discovered through another lens; the coordinating agent will deduplicate overlap.

Run this reviewer in two phases.

In the surface phase, give it the affected paths and exposed symbols, but direct it not to inspect the substantive diff or implementation bodies.
In Python, have it inspect package and module placement, public types and their relationships, signatures, annotations, defaults, meaningful decorators, and docstrings; elsewhere have it inspect the corresponding declarations, formats, commands, configuration, documentation, or examples that form the boundary.
Before continuing, require a short written note recording its provisional model of the concepts and responsibilities, their composition and principal use, relevant state or identity, promised constraints, invariants and failures, and consequential questions about correct use.
Treat internal callers, operators, and maintainers as users where they consume the boundary, and treat facts supplied in the shared brief as evaluation criteria rather than as facts visible from the interface.
If the surface cannot meaningfully be separated from implementation, require the reviewer to say why instead of silently skipping the phase.
The test is whether an intended user can form the right working model without reading implementation details.

After the surface note is returned, send a follow-up task to the same reviewer authorizing the implementation phase.
Have it inspect the complete diff, implementation bodies, relevant call sites, tests, documentation, and surrounding code, then compare the implementation with its recorded model.
It should then determine:

- whether the provisional model is accurate and whether remaining ambiguity is consequential;
- whether responsibilities, boundaries, dependencies, state, file placement, and the relationship to existing project functionality form a coherent design, including whether overlapping implementations or duplicated knowledge have a convincing distinction;
- whether the change introduces entanglement, lost locality, over-decomposition, mixed responsibilities, hidden dependencies or effects, needless state or configuration, speculative generality, shotgun change, dead mechanisms, or an abstraction whose cost exceeds its value;
- whether, under applicable repository instructions, implementation expression, names, interfaces, documentation, docstrings, comments, and tests make essential behavior and established structure apparent and exercise it through stable boundaries.

Apply explicit repository instructions first, deliberate local conventions where those instructions are silent, and external idiom only as evidence rather than authority.
Report a design concern only when it creates a concrete reasoning or change cost and there is a plausible improvement.
Do not report formatting preferences, smell labels without consequences, or speculative rewrites.

### Technical generalist and risk mapper

This reviewer owns the baseline defect-first review of behavior, contracts, complete call paths, integration, compatibility, failure handling, and behavioral test coverage.
Have it use the explicit `$review-agent` skill when available, then extend that pass with the risk map below.
If `$review-agent` is unavailable, have it perform the same merge-base-aware, defect-first review directly.

Extend the defect-first pass by tracing invariants, transformations, state transitions, and call paths across component and integration boundaries; inspecting errors, caller-visible cleanup, compatibility and operational changes; checking consequential behavior through shipped paths; verifying material claims; and checking the mergeable diff for unrelated churn, artifacts, debugging residue, or scope problems.
Continue through the complete diff after finding the first issue.

In addition to findings, require a concise risk map naming material surfaces whose readiness cannot be judged confidently without a distinct reasoning method or expertise, why that risk is present, the relevant paths or call chains, available guarantees or evidence, and the technical question still to resolve.
The risk map is advisory rather than a verdict, and its entries are questions rather than suspected findings.
An empty risk map must be the result of considering the specialist domains, not the absence of obvious keywords.

## Route specialist reviews

The coordinating agent owns routing and must apply the triggers independently of the technical generalist's risk map.
Launch an immediately evident specialist alongside the core reviewers; otherwise launch specialists after inspecting the risk map.
Reapply routing whenever any reviewer exposes a new material mechanism or risk.
Within a full readiness review, use the smallest set of distinct specialties that covers the material risks, but do not omit a required specialist merely because reviewers must run in batches.
If an explicit reviewer limit prevents a required specialist, name the omitted specialty and leave its material risk unresolved in the limited review.
When applicability is genuinely uncertain and the risk could change readiness, launch the specialist.

Launch a temporal and lifecycle specialist whenever correctness depends on order, overlap, duration, retry, cancellation, or lifetime.
This includes state publication or invalidation, resource ownership and cleanup, background work, callbacks, queues, locks, timeouts, retries, subprocesses, signals, shared mutable state, and start, stop, shutdown, or recovery behavior.
Do not trigger it merely because code uses `async` or mentions time, and do not omit it merely because concurrency is implicit in a framework, cache, callback, or resource lifecycle.

Other specialists may cover security and privacy, persistence and compatibility, numerical or scientific behavior, performance and resources, domain rules, protocols, external dependencies, framework semantics, UI and accessibility, or platform and delivery behavior.
This list is illustrative, and the generalist may recommend an unlisted specialty when the change calls for a distinct body of knowledge or reasoning method.
When selecting a specialist, read [specialist review methods](references/specialist-reviews.md) and adapt the relevant example to the risk rather than treating it as a universal checklist.

Give each specialist a fresh context containing the shared brief, its neutral risk question, and relevant raw evidence, but not another reviewer's conclusions.
Have it inspect the complete diff far enough to understand cross-boundary interactions, then deeply trace the applicable behavior rather than repeating the global design review.

Reviewers may consult authoritative primary sources when a material judgment depends on current, version-specific, niche, or unfamiliar behavior, after establishing the project's actual version.
If access is unavailable, report the uncertainty; repository instructions and deliberate project conventions take precedence, and external advice becomes a finding only when it has a concrete consequence here.

## Require useful reviewer output

Every reviewer should return only concrete, actionable concerns introduced or materially exposed by the change that the author would probably fix.
Return findings first, ordered by severity, with the changed line that introduces or exposes the concern, or the narrowest artifact reference when no meaningful line exists, followed by the triggering scenario, impact, supporting evidence, and cleanest fix direction when evident.
Use `P0` for a critical universal blocker, `P1` for an urgent defect, `P2` for an ordinary defect, and `P3` for a low-impact concern still worth fixing.
Distinguish demonstrated defects, consequential gaps, and actionable design problems from optional refinements or unresolved questions.
If the assigned lens has no substantive findings, say `No design findings.`, `No technical findings.`, or the corresponding lens-specific result rather than inventing one.

After findings, require a concise coverage note naming the target and scope, applicable instruction files, exposed surfaces or call paths and project precedents inspected, targeted validation or external sources used, and anything material left unverified.

The design reviewer's coverage note should identify the exposed surface, confirm that its provisional note preceded implementation review or explain why separation was impractical, and report an implementation mismatch only when consequential.
The technical generalist should append its specialist risk map.
A no-findings result from one lens is not an overall readiness verdict.

## Synthesize and close the review

Wait for every applicable reviewer and verify that each examined the requested target and completed its assigned lens.
Confirm that the base, target, and working-tree fingerprint still match the shared brief before synthesizing their results.
Close a material risk-map entry without a specialist only when evidence shows that it is inapplicable or already settled; otherwise launch the specialist or report the unresolved question as a readiness gap.
Verify material findings directly against the cited code and use only the smallest targeted test or probe needed to establish or disprove a concrete concern.
Do not rerun broad test, lint, formatting, or type-checking suites merely for confidence when existing evidence already answers the question.

Combine duplicate findings by root cause, retain the strongest triggering scenario and evidence, and calibrate severity centrally.
Resolve disagreement with evidence or a targeted probe rather than a vote.
Present one synthesized findings list rather than reviewer transcripts.
If there are no substantive findings across the applicable lenses, say `No findings.`
Finish with a concise readiness assessment naming the reviewed target and base, blockers to handoff or merge, and material residual risks or validation gaps.

The verdict applies only to the reviewed revision.
Any change intended to address a material finding requires fresh verification by the reviewer role that owns it, regardless of the fix's size.
Rerun the technical generalist when behavior or integration changes, every affected specialist, and design and expression when interfaces, abstractions, boundaries, documentation, or substantial implementation expression changes.
Reapply specialist routing to mechanisms introduced by the fix.
Each re-review must account for every prior material finding as closed, open, or superseded with evidence before reporting new findings.
Re-review the current complete target, not merely the follow-up commit, and treat prior findings as questions rather than claims that the fixes succeeded.

Immediately before declaring a pull request ready to merge, confirm that its head and mergeable diff still match the reviewed target and that current checks and approvals apply to that head.
Automated and human pull request feedback still requires explicit triage; an earlier author-side review does not replace it.
