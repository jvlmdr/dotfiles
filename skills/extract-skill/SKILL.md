---
name: extract-skill
description: Extract a skill from past sessions where the user's judgement showed, then write it and test it on sessions it was not drafted from. Use only when explicitly invoked.
disable-model-invocation: true
---

# Extract Skills

The user's own statements of a principle are incomplete; the evidence is what they corrected and what they then accepted.

## Collect

- Find the sessions where the behaviour happened, and extract triples: the user's correction, the output before it, and the version they accepted.
  For code, take the before and after from the edit calls (`Edit`, `apply_patch`); for a format or a process, take the assistant messages they answered with approval.
- Search every store of transcripts the user has, and check that the extractor reads each log format: a format change or a retention cleanup drops whole sessions without an error.
- Keep every example: a theme needs its evidence more than a test needs a split, and the sessions that follow the draft test it on work it has never seen.
- Group the triples into themes by the lesson each teaches, not the symptom it shares, and show the user one theme at a time with the user's words for each triple; they know what each correction was about.
- Once the themes are settled, reread each source session beside its triples for misses and misreadings: an extraction pass loses context, such as a correction later reversed or a quote about something else.
- Do not draft from the user's messages alone, and do not draft from what a model would do without having seen it fail.

## Write

- Follow the write-skill skill; the replay below replaces its test.
- Show the user each line with the triples behind it; cut any line the triples do not support.

## Test

- Restore the state before a session the skill was not drafted from in a fresh clone, and run the task there with and without the skill, on the same model.
  The runs must not see the user's later corrections, whether in files, instructions or memory; check what each run loads.
- Score each run against the corrections the user actually made, for both recall and precision: which it found and missed, and what it proposed that they would not want, since a run that proposes everything finds every correction.
