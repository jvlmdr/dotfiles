---
name: write-skill
description: Write or revise a skill or agent instructions (SKILL.md, CLAUDE.md, AGENTS.md) so that they change what agents do. Use only when explicitly invoked.
disable-model-invocation: true
---

# Write Skills

Say why, not what, as in commander's intent: state the goal and the reasons behind it, and let the agent work out the behaviour, so that it can handle the cases the skill does not list.
Match the degrees of freedom to the cost of a mistake: prescribe a what only where a mistake would be costly, and give the reason there too.

- Write only what the model would not do by default; every line competes for its attention with the lines that matter.
- Look for existing paradigms, frameworks and names for the behaviour, and look further when what you find only half fits.
  In the skill, use the names rather than restating the ideas in the terms of the case at hand: a name brings what the agent already knows, while a paraphrase ties the skill to the case it came from.
  Use one term per concept throughout.
- Say what not to do rather than exhorting, and avoid capitalised absolutes, which agents apply beyond their intent.
- Do not prescribe structure: no hard thresholds, counts or templates. Say what the result must achieve and leave the agent latitude to decide how; a fixed number is read as binding, and a single example or template pulls the agent toward the cases it came from.
- Choose words for what an agent will do with them, the skill's name included: a word like "verify" can license a far heavier action than intended.
- Put reference material such as research, taxonomies and long examples in linked files, so it loads when needed and is not redone.
  In the skill, give the why the file supports and name its paradigms, and say what the file holds; agents often skip a bare link.
- Keep the user's own directives, in their words and with the context of each, in a DECISIONS.md beside the skill, unlinked like SOURCES.md, so their reasons survive later edits.
- Keep it short and general, with nothing specific to one project or change, so that it applies beyond the cases it came from.
- Add nothing the user has not said or approved, and show them each line; a drafting agent fills gaps with plausible lines the user never meant.

## Test

- Run a realistic task with and without the skill, in fresh contexts on the same model, since only the difference between the runs shows what the skill does; and read the transcripts, not only the outputs, since the output hides how the agent got there, such as whether it read a linked file.
- Fix a failure by generalizing the skill, not by adding a rule for that case; a rule per failure fits the cases you tested and nothing else.
