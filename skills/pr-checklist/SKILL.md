---
name: pr-checklist
description: Check a branch before opening a pull request or before merging it. Use only when explicitly invoked.
disable-model-invocation: true
---

# PR Checklist

Answer each question for the branch, and report those that need action.

- Does the branch contain things it shouldn't (diff against the merge base)? notes, drafts, churn
- Are there any large binary blobs?
- Is anything committed in the wrong place? (e.g. the repo root)
- Is anything the change needs hidden by `.gitignore`?
- Has anything important been lost? Are removals justified?
- Does it miss existing code or library functions it should be using?
- Would the original authors of the changed code be pleasantly or unpleasantly surprised?
- Are the names and function signatures natural? Especially those which face the rest of the codebase
- Are the types precise? (no needless `Any`, `cast` or suppressions)
- Is any concurrency sound? (races, lock ordering, shutdown)
- Is the documentation consistent with the code? (docstrings, comments, markdown, external)
- Have the review skills been run? (`final-review`, `whoever-smelt-it`, `audit-tests`)
- Do all pre-commit hooks pass?
- Does type checking pass on the changed files?
- Do the changed tests pass, including GPU-only ones?
- Does it work in the full system, as it will be used?
- Are generated or baseline files untouched unless the PR is about them?
- Is anything private going into a public repo?
- Is the PR description up to date with the code?
- Is everything in the description true and relevant? (fresh subagent)
- Is it clear and succinct to a fresh reader? (fresh subagent)
- Does the motivation come before what was done?
- Are new or changed public interfaces presented clearly?
- Does the description mention behavior changes, limitations and known issues?
- Are there debatable or contentious decisions to review together?

## Before merging

- Do we need to rebase on current main?
- Is CI green on the head commit?
- Has every review finding been fixed at its root, or answered?
- Does anything need to move to, or be updated in, related PRs?
- Does this PR supersede others that should be closed?
