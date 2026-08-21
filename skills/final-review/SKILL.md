---
name: final-review
description: Launch a fresh agent for an independent, read-only review of a branch or code change before merge or human handoff. Use when asked for a final, pre-merge, pre-PR, pre-handoff, readiness, or fresh-eyes review; do not use for narrow review questions, ordinary implementation checks, or merely because work is complete.
---

# Final Review

Obtain a genuinely independent assessment of whether a coherent change is ready for human review or merge.
An open pull request is not required.
The review pass is read-only and does not itself authorize fixes, commits, pushes, pull request changes, or merges.

## When to use it

Use this skill after the intended change is coherent and the user asks for a final review, a fresh set of eyes, or a readiness decision before opening, handing off, or merging it.
Do not invoke it merely because implementation is complete or because the user asks to open or create a pull request without also asking for a readiness review.
The review does not become an automatic review-and-fix loop.

## Establish the target

- Identify the repository, target branch or change, comparison base, and whether staged, unstaged, or untracked work belongs to the review.
- Use an explicit base when supplied; otherwise use an existing pull request's configured base or safely infer one, accounting for stacked branches.
- Review the committed diff from the merge base through the target together with any staged, unstaged, or untracked work established as in scope, and ask only when ambiguity would materially change the review.
- Keep the target and shared worktree stable while the review runs.

## Launch the reviewer

Spawn a subagent without inherited conversation turns by using `fork_turns: "none"`.

Give the reviewer a neutral, self-contained brief containing:

- the repository path, target, comparison base, and exact working-tree scope;
- the intended behavior and relevant requirements when they are not discoverable from durable repository or pull request artifacts;
- accepted decisions, constraints, non-goals, and requested areas of focus that are necessary to judge the change;
- an existing pull request reference and its current title and body when relevant; and
- existing validation evidence or logs that may answer factual questions without being rerun.

Independence means forming conclusions independently, not rediscovering facts already captured in durable artifacts.
Treat supplied summaries and results as evidence to verify when material, not as conclusions or substitutes for inspecting the complete diff.
Do not pass the authoring conversation wholesale or prime the reviewer with a desired verdict.
Ask the fresh agent to review from the perspective of a senior reviewer with expertise appropriate to the change.
Have it read the applicable `AGENTS.md` or `CLAUDE.md`, use the explicit `$review-agent` skill when available for its merge-base-aware defect review, apply the broader lenses below, remain read-only, and not delegate further.
If `$review-agent` is unavailable, have it perform the same defect-first pass directly rather than treating the missing skill as a blocker.
If a genuinely fresh agent cannot be launched, report that limitation instead of silently substituting self-review.

## Broaden the review

Treat these as selective lenses, not a checklist to narrate.
Adapt the depth and domain expertise to the actual diff, and omit categories with nothing material to say.
This readiness review is intentionally broader than defect discovery, but every reported concern should still be concrete and actionable.

- **Correctness and behavior:** Look adversarially for hidden or pernicious failures, especially at state, transformation, and integration boundaries that obvious tests may miss.
  Trace the relevant invariants and call paths far enough to determine whether the change completely and correctly implements its intended behavior without unintended compatibility or workflow changes.
- **Structure, operation, and simplicity:** Determine whether the code presents a clear and coherent model of operation.
  Establish, where relevant, where state lives, who owns and mutates it, how data and control flow, and how lifetimes, locking, synchronization, or concurrency are coordinated.
  Assess whether responsibilities, organization, file placement, boundaries, and dependencies are intuitive and whether the rationale for unavoidable complexity is discoverable.
  Identify significant simplifications without compressing the code into tricks or adding speculative abstractions.
- **Interface and repository fit:** Review important names, qualified names and import paths, signatures, interfaces, protocols, types, classes, and methods from the perspective of a user of the code.
  Check whether public interfaces behave as a user would reasonably expect from their names, signatures, types, defaults, and surrounding conventions.
  Flag consequential surprises, hidden side effects, sharp edges, or important semantics and constraints that are not evident at the point of use.
  Search enough surrounding code to find existing functionality that is duplicated, underused, or made confusing by the change.
- **Implementation expression:** Where relevant, assess whether the code follows the established idioms of its language, libraries, framework, and domain.
  Numerical and algorithmic code should express the mathematics clearly and preserve recognizable structure, terminology, and notation; review NumPy and JAX operations for clarity, correctness, and idiomatic use.
  Apply repository guidance to type annotations, including casts and type-checker suppressions, and consider natural re-expression when formatter output obscures the code without contorting it.
- **Tests and explanation:** Check whether tests protect consequential behavior through stable public interfaces, and flag redundant, low-value, weak, implementation-coupled, or overly prescriptive tests as well as material gaps.
  Check that affected documentation, docstrings, and comments are accurate, current rather than chronological, useful to users, and consistent with behavior and applicable repository instructions.
  For changed components, judge docstrings for sufficiency from a user's perspective, not merely accuracy: where relevant, they should make the component's purpose, contract, use, and place in the system evident, including consequential choices, constraints, or operational requirements.
  Flag missing or materially incomplete docstrings, including those that merely restate a declaration or narrate the implementation.
- **Diff and fresh-reader questions:** Check the mergeable diff for unrelated churn, accidental artifacts, or a scope that should be reduced or split.
  Identify consequential surprises and the obvious questions a user, maintainer, or reviewer would ask, then determine whether the code, documentation, or existing pull request answers them.
  When a pull request or changelog entry exists, verify its material claims against the implementation rather than line-editing its prose.

Inspect enough code outside the diff to understand the change and verify reuse, but keep findings scoped to problems introduced or materially exposed by the reviewed change.
Use supplied artifacts instead of repeating broad repository exploration when they already answer a factual question.
Prefer concrete improvements that the author would probably make over speculative concerns or cosmetic taste.
Stop once the complete diff and material concerns have been examined rather than pursuing speculative side paths.

## Return the result

Wait for the fresh reviewer to finish, verify that it examined the requested target and scope, then verify material findings against the cited code before presenting or acting on them.

- Present actionable findings first, ordered by severity, with precise file and line references, the triggering scenario, the impact, and the cleanest direction for a fix when one is evident.
- Distinguish demonstrated defects, consequential gaps, and actionable design problems from optional refinements or unresolved questions.
- Reuse supplied validation evidence and run only the smallest targeted test or probe needed to establish or disprove a concrete finding.
  Do not rerun or report routine test, lint, formatting, or type-checking success merely for confidence.
- If there are no substantive findings, say `No findings.` rather than inventing one.
- Finish with a concise readiness assessment that names the reviewed target and base, any blockers to handoff or merge, and material residual risks or test gaps.

The review itself does not authorize implementing its findings; follow any broader, explicit request to fix or re-review them as a separate phase.
