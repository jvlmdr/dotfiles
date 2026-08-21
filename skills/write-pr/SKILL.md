---
name: write-pr
description: Prepare, open, review, or revise pull requests from the current conversation, repository, and GitHub context. Use when asked to open or create a ready or GitHub draft pull request, or to preview, draft, improve, inspect, or update its title or description; do not use merely because work may later become a pull request.
---

# Write Pull Requests

Produce a self-contained pull request title and description that explain the change to users of the code first, then give reviewers and maintainers the context that matters.
Adapt the description to the change rather than filling a fixed template.

## When to use it

Use this skill at the pull request boundary, after the branch contains enough of the intended change for its behavior and evidence to be described accurately.
If it is invoked earlier, write only what the current evidence supports and keep unresolved claims outside the proposed description.

Use these terms consistently:

- A **preview** is proposed title and body text returned in the conversation without creating a file or changing GitHub.
- A **ready PR** is a remote GitHub pull request that is ready for review.
- A **GitHub draft PR** is a remote GitHub pull request created or marked with GitHub's draft state.

Never call a preview a draft PR.
Choose the action from the request:

- A request to draft, write, or propose a title or description produces a preview.
- A request to open or create a pull request creates a ready PR unless the user explicitly requests GitHub's draft state.
- A request to open or create a draft PR, open it as draft, or mark it as draft creates or updates a GitHub draft PR.
- To review a pull request description, report findings and suggest prose without changing GitHub unless the user also requests an update.
- To revise or update an existing pull request, read the live pull request and change only the requested fields.

If the phrase `draft PR` is ambiguous and acting on it could mutate GitHub, ask which meaning the user intends before making the remote change.

## Inputs

Treat the invoking agent's current conversation, workspace, and established findings as input.
Honor explicit context supplied with the invocation before context inferred from the repository.

Optional inputs include a pull request reference, base branch, intended audience, requested emphasis, and facts that are not recoverable from durable project artifacts.
When these are omitted, inspect them when they are safely discoverable and ask only when a missing choice would materially change the result.

## Understand the change

- Read the applicable repository instructions and pull request template.
- Establish the actual comparison base, then inspect the diff and commit series as a whole.
- Read related issues, pull requests, documentation, changelog material, and available behavioral or measurement evidence when they affect the explanation.
- For an existing pull request, read its current title, body, and relevant discussion before proposing a revision.
- Identify who uses the changed code or behavior and what they experience before deciding which implementation details matter.
- Confirm factual claims against available evidence and distinguish measured results from inference.

Do not make the caller restate context already available in the conversation or workspace.

## Write the title and description

- Choose a concise title that names the changed behavior or capability rather than the work process that produced it.
- Begin a substantial description with one or two unheaded paragraphs that introduce the problem or feature, summarize the solution, and explain its effect for users of the code.
  A small, cohesive change may need nothing more.
- Develop user-relevant behavior before implementation detail.
  Use sections only when they aid navigation, and name them for the subject they explain rather than using generic containers such as `Summary` or `Details`.
- Include the smallest clean usage example that makes a new or changed interface concrete.
  Omit setup and surrounding machinery that do not help the reader understand the contract.
- Put decision-relevant evidence near the claim it supports.
  Prefer a compact, self-describing table when several conditions or results must be compared, and give enough methodology and qualification to interpret the result without obscuring it.
- Include implementation details when they explain a non-obvious design choice, constraint, tradeoff, or maintenance boundary.
  Avoid a file-by-file inventory of the patch.
- Call out compatibility, migration, limitations, intentional omissions, rollout, and follow-up work when they affect how the change should be used or understood.
- Treat validation as evidence rather than a checklist.
  Include reproductions, behavior-specific regression checks, real-world exercises, or measurements that substantiate material claims, and omit routine assurances that tests, formatting, linting, or type checking pass unless the result is itself material.

Make the description understandable to a reader who did not see the originating conversation.
Remove conversational chronology, agent notes, and internal campaign labels unless they are necessary project context.
Follow applicable repository instructions for prose layout, contributor attribution, and warnings about removed material.

## GitHub Markdown

Assume the title and body will be rendered by GitHub as GitHub-flavored Markdown.
Keep each prose paragraph on one source line, separate paragraphs with blank lines, and do not hard-wrap prose.
Use ordinary Markdown lists, tables, links, inline code, and fenced code blocks when they clarify the description.
Do not rely on soft line breaks for paragraph structure or add forced line breaks for visual wrapping.

## Output and remote changes

For a preview, return the title and rendered-source body directly in the conversation rather than writing an intermediate file.
Use a temporary file or standard input only as implementation machinery when a GitHub command needs it, not as the delivered preview.

Update a pull request only when the user explicitly asks for the remote change.
Immediately before updating it, reread the live title and body, preserve intervening human edits and deliberate ordering, and change only the requested fields.
