---
name: prose
description: Write and revise technical prose: docs, docstrings, comments, PR descriptions, reports and chat replies. Use whenever producing or editing any of these.
---

# Prose

- What are we trying to convey? Identify the key point before writing or revising.
- Are we getting away from what matters here? Leave out incidental detail.
- Who is the reader, and what do they already know? Crystal clear to them, without too much explanation.
- What are their most obvious questions? Answer those.
- What does it imply for them? Say so.
- Docstrings are for users, comments are for maintainers.
- Where should this live? Where its reader will look for it.
- Posting to e.g. GitHub or Slack? Relevant and factual information only, at the length the venue expects.

- Will the motivation be clear at each step? The reader should never be left asking "why?"
- How does it read on a first pass? What matters most first, corner cases later.
- Don't let the evidence drown out the message.
- Could a reader stop after the first sentence or the top-level bullets and still have the answer?

- What's the key content, and where does it go? Draft the structure first, then bullets, then prose.
- Does each section come after what it depends on?
- Can the top-level points be read at a glance? Nest the detail.
- Does each heading name its topic?
- Let tables and images tell the story, with minimal prose.
- Is it clear what the table is getting at? Introduce it; keep cells short.

- Could it be read in another way?
- Is each term clear at the point it appears?
- Use the standard term where there is one; don't invent one.
- Would the reader know what a label means? Spell it out.
- Who does what to what? Is it clear for every verb?
- Do the clauses in a sentence parse easily on first reading? Split them if not.
- Plain, technical language. No figures of speech, slogans or euphemisms; nothing soft or vague.
- Avoid walls of text; prefer bullet points for dense information.
- Does it match the style around it?
- Code names in single backticks.

- Is it true? Check each claim against the code and the sources.
- Does it describe what is true now, not how we got here?
- Where did this number come from, and compared with what?
- Don't bury critical numbers in a block of text.
- Does it sound more certain, or more worrying, than the facts?

- Is the edit an improvement, or just a change?
- Will the edit lose anything that made it clear?

## Check docs, PR descriptions and reports

- Give it to a fresh reader: what are their questions? Is anything unclear, missing or irrelevant?
- Two subagents: one for factual correctness and relevance, one for brevity and clarity. Brevity and clarity get the final say, but not at the cost of correctness.
