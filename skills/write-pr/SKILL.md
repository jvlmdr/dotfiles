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

- Scale the depth to the change, giving users and reviewers a clear explanation without unnecessary detail.
  Treat the guidance below as conditional, not as a completeness checklist.
- Keep rendered paragraphs short and focused on one idea.
  Prefer bullets for distinct points and a small code example when either is easier to scan than continuous prose.
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

Use GitHub-flavored Markdown, including lists, tables, links, and code blocks when they clarify the description.
Keep each prose paragraph on one source line, separate paragraphs with blank lines, and do not hard-wrap prose.
