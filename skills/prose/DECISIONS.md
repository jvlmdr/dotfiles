# Decisions

Directives the author identified while developing this skill, in their words, for maintainers.
SKILL.md deliberately does not link here, so agents running the skill do not load it.

- **Succinct points, no definitions.**
  "Can we reduce it to just a collection of succinct points? Avoid definitions etc" (on a draft whose points each carried a reason).
- **Worded close to the author's own voice.**
  "And show my words which led to this point. And think about how to get close to that", then "close in meaning/feeling/mood, not just edit distance" (each point was then drafted from the author's quotes).
- **Points must hold for every kind of text.**
  "This seems to assume there is always a TL;DR?", then "Likewise for the 'doc's question'" (points were generalized to comments and replies).
- **Identify the point before writing or revising.**
  "Maybe it should be 'identify the key point before writing or revising?'"
- **Two reviewers with different aims.**
  "check the PR description with a subagent that checks for correctness and a subagent that optimizes for clarity and succinctness"; earlier, "2 modes, 1 aiming for brevity / high-level and 1 aiming for factual correctness, with the former getting the last say"; then "not lazy? One for factual correctness and relevance?"
- **Do not launch subagents for every piece of text.**
  "Will this launch subagents every time an agent needs to write text?" (the check section was scoped to docs, PR descriptions and reports).
- **Slogans, not colons.**
  On an earlier complaint about the ": " style: "this is more like aphorisms or euphemeisms. Colons is general are fine".
- **Items the author added beyond the transcripts.**
  "Maybe also verb/noun clarity"; "avoid burying critical numbers in a block of text"; "Maybe just avoid walls of text, prefer bullet points for dense information"; "Maybe put docstrings and comments up near the audience".
- **Out of scope.**
  Usage examples (write-pr) and error or log messages (code, not prose) were left out: "is this prose?".
