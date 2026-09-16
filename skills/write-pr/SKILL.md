---
name: write-pr
description: Write or review pull request titles and descriptions, or create and update pull requests on GitHub. Use when asked for these actions, not merely because work may later become a pull request.
---

# Write Pull Requests

Produce a self-contained pull request title and description that explain the change to users of the code first, then give reviewers and maintainers the context that matters.

## Choose the action

- **Preview:** A request to draft, write, or propose a title or description returns the proposed text directly in the conversation, without creating a file or changing GitHub.
  A request to review a description returns findings and suggested prose.
- **Create:** A request to open or create a pull request creates a ready PR unless the user explicitly requests GitHub's draft state.
- **Update:** A request to revise or update an existing pull request changes only the requested fields on GitHub, including its draft state when requested.

Keep a preview distinct from a GitHub draft PR.
If the request is ambiguous between a preview and a remote change, clarify before changing GitHub.
Before applying an update, reread the live title and body, preserve unrelated intervening edits, and apply the requested revision to the current version.

## Understand the change

Use the current conversation, workspace, and established findings, giving explicit context precedence over inference.
Ask for missing context only when it cannot be recovered and would materially change the result.

- Read the applicable repository instructions and pull request template.
- For a new or substantially rewritten description, establish the actual comparison base and understand the diff and commit series as a whole.
  For a narrow prose edit, investigate the claims it affects and reuse established findings.
- Read related issues, pull requests, documentation, changelog material, and available behavioral or measurement evidence when they affect the explanation.
- For an existing pull request, read its current title, body, and relevant discussion before proposing a revision.
- Identify who uses the changed code or behavior and what they experience before deciding which implementation details matter.
- Confirm factual claims against available evidence and distinguish measured results from inference.

If the change is incomplete, describe only what the evidence supports and keep unresolved claims outside the proposed description.

## Write the title and description

Choose a concise title that names the changed behavior or capability.
Give a compact overview of the main use case, changed contract, and important design decisions.
Use roughly 150–250 words for a typical substantial change; small changes can be much shorter.
A draft over about 300 words needs another selection pass: retain extra detail only for distinct interface changes, migrations, or qualifications that would be misleading to omit.

- Begin with one or two unheaded sentences introducing the problem or capability and its effect for users of the code.
- For a substantial change, follow the introduction with subject-specific headings and bullets for distinct behaviors or guarantees.
  Organize sections by the behavior or design topic they explain, without labeling them by audience.
  Keep paragraphs short and focused on one idea; shortening a description should preserve useful navigation.
  A small change with a single point may need only the introductory paragraph.
- Explain the public interface before implementation detail, including interfaces consumed by other code in the repository.
  Show the main workflow and the conditions under which it works, including operating assumptions, breaking changes, and important failure or recovery semantics.
  Use the smallest clean usage example that makes the contract concrete, omitting unrelated setup.
  Leave secondary options, exhaustive type lists, and exceptional lifecycle cases in API documentation; link to it when useful.
- Include implementation details only when they explain an important design choice, constraint, tradeoff, or ownership boundary.
  Summarize a mechanism by its purpose and key invariant, leaving its steps and subordinate cases in the code or design documentation.
  Omit an implementation section when there is nothing useful to add.
- Call out migration, limitations, rollout, and follow-up work when they affect how the change can be used.
  Check compatibility advice against the old and new behavior, and make clear which cases a fallback actually supports.

Omit test counts, passing-check assurances, and coverage inventories, including paragraphs that restate behavior as a list of tests.
Include evidence when it materially substantiates or qualifies a claim: for example, a measured improvement, a reproduced failure that now succeeds, or a verification limitation that affects use.
Report the decisive result and its conditions once, near the claim; use a table when it makes several results easier to compare.
When testing is the purpose of the PR, explain the behavior being protected or the new testing capability.

Make the description understandable to a reader who did not see the originating conversation.
Remove conversational chronology, agent notes, and internal campaign labels unless they are necessary project context.
Follow applicable repository instructions for prose layout, contributor attribution, and warnings about removed material.

Before returning or applying the description, scan its introduction, headings, example, and bullets: can a reader identify how to use the change, where it applies, and why it is designed this way?
For each supporting detail, ask what would be lost if it were removed: keep it when omission would invite likely misuse or hide an important rationale, compatibility requirement, or qualification.
Merge related guarantees into compact points and cut repetition; a long bullet or list can be as dense as a paragraph.

## GitHub Markdown

Use GitHub-flavored Markdown, including lists, tables, links, and code blocks when they clarify the description.
Keep each prose paragraph on one source line, separate paragraphs with blank lines, and do not hard-wrap prose.

## Examples

These examples illustrate the expected structure and selection of detail.
Choose section subjects appropriate to the change.

### An interface used by other code

````markdown
Model-serving code can read selected archive members without extracting the whole model. `ModelWarehouse.read_model_files()` returns owned `bytes`, so callers have no temporary directory or open stream to manage.

## Read selected files

```python
files = warehouse.read_model_files(
    model_id, ("model.stablehlo", "model.safetensors")
)
```

- Returns a `dict[str, bytes]` containing only the requested regular files.
- Returns `None` when the model archive is unavailable.
- Raises `ValueError` when a requested member is missing, is not a regular file, or cannot be read.

## Archive ownership

The warehouse resolves the archive and closes all handles before returning; consumers remain responsible for interpreting model formats. Callers that need a directory continue to use `fetch_model()` and its extraction cache.
````

### A performance change with supporting evidence

````markdown
Waypoint IK runs faster for smaller workloads while preserving the optimizer interface and objective.

## Runtime

Paired measurements alternate the old and new compiled functions in one process on an RTX 5090, using 256 IK starts and 10 iterations:

| Waypoints | Before | After |
| ---: | ---: | ---: |
| 64 | 7.08 ms | 6.08 ms |
| 128 | 12.43 ms | 11.36 ms |
| 256 | 20.67 ms | 20.73 ms |

Runtime is effectively unchanged at 256 waypoints. Fresh-process measurements found no peak-VRAM increase.

## Residual reuse

- `jax.jacrev(..., has_aux=True)` returns the primal residual alongside its Jacobian, avoiding a second residual evaluation.
- A direct float32 comparison on random paths found maximum absolute differences below `1.5e-7` in residuals, Jacobians, normal matrices, and right-hand sides.
````
