# Decisions

Directives the author identified while developing this skill, in their words, for maintainers.
SKILL.md deliberately does not link here, so agents running the skill do not load it.

- **A short list, not explanations.**
  "I would like this just to be a short list of things, not a series of explanations or definitions" (when starting this skill).
- **Questions, not commands.**
  "does the PR contain things it shouldn't? notes, drafts, churn" (rewording the first item; every item became a question).
- **One list, with a section for merging.**
  "I think we should also question whether this skill can be used before opening a PR as well as before merging a PR", then "Maybe not 2 headings.. but just a second heading for before merging".
- **Check the description with fresh readers.**
  "check the PR description with a subagent that checks for correctness and a subagent that optimizes for clarity and succinctness.. I have done something like that. This might later become a prose skill. Also, writing in such a way that the motivation is clear before you read about what was done".
- **Leave out what lives elsewhere.**
  Standing rules (commit only on the author's word, merge only with approval, no tidy-history rewrites, the reviewer bot's process) stay in AGENTS.md, project instructions and memory; description formatting stays in write-pr; code tidiness stays in whoever-smelt-it.
- **Items the author added beyond the transcripts.**
  "check soundness of concurrency where appropriate"; "did we include type-checking passing btw?"; "I would keep no large binary blobs. Also nothing committed out of place (e.g. at / of repo)"; "is there anything hidden by gitignore rules that should be included?"; "is this code unaware of existing things in the codebase that it should be using?", then "or library functions?"; "are any new/changed public interfaces presented clearly?"; and, kept from a rare case, "did they have something different in mind" (on the original authors of edited code), then "maybe pleasantly or unpleasantly surprised".
