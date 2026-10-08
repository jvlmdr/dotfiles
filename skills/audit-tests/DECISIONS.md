# Decisions

Directives the author identified while developing this skill, in their words, for maintainers.
SKILL.md deliberately does not link here, so agents running the skill do not load it.

- **Classify every test by why it might not belong, and recommend what to do about each.**
  "I feel like some of the tests are things that humans would never write. They might exist just to ensure coverage or just to assert a particular behavior that we changed but wasn't settled. Or they might reach into the internals just so that our current change has a test. ... My idea is to have you apply some kind of categorization to them. Like, core behavior / public interface, likely edge case, asserting debatable undecided spec, only makes sense in the context of this change, unlikely to matter, aggressive monkeypatching or mocking, unconventional technique. Maybe categories, maybe tags." (replying to the agent's offer to rebuild a skill from the session transcript); then "Then show me what it recommends doing about each?" (asking to launch a Sonnet audit while another change was on hold).
- **The standard is a natural test, not a careful one.**
  "where a 'careful' person would have written it: This loses some of the emphasis I wanted. I wanted 'natural' tests, like a human would *think* to write. 'Careful' puts the emphasis back on correctness" (on a draft of this skill's opening).
- **An audit has two halves, and a request may need only one.**
  "I just thought of something... we might not want to run both directions every time, i.e. proposing tests from the interface and auditing existing tests?" (on a draft of this skill's opening).
- **Propose test cases from the interface, in an independent agent that has not read the tests.**
  "I did like one idea from the final-review test audit: proposing test cases from the interface" (replying to a plan to edit final-review and fold the idea into the audit skill); "I think this should happen in an independent agent, and can occur in parallel, and we combine it in afterwards?" (during the decisions walkthrough, on group 2).
- **Keep checks in proportion.**
  "Also, the individual agents are taking way too long. Maybe because they're actually running tests?" (on verifier agents that ran the suite and mutation tests during a test audit); "I don't want to tell it to run the full suite!?!?" (on a draft that ended with a whole-suite run after applying changes).
- **Chunk the verification of an audit; one verifier for everything is not rigorous.**
  "I think that we do need some chunking to be rigorous. I don't know what the right size is though. I feel like complicated classes/functions/types get their own, small files are grouped with other files? And we group related files/classes/functions together? And still with Sonnet" (on a proposal to verify a whole tier of test removals with one agent).
- **The spec axis flags tests that pin unsettled behavior; it does not label every test.**
  "I think undoc might be a bit odd as a tag? Wouldn't lots of tests be undoc?", then "Maybe we've lost the meaning?" (on the spec axis's documented and undocumented categories, which went back to the original concern, "asserting debatable undecided spec").
- **Grow the taxonomy from what audits find.**
  "This sounds like another category/tag in our schema?" (on stderr-text assertions the taxonomy had no tag for).
- **Tags need not map to principles.**
  "And if a tag/category doesn't fit a principle, we shouldn't necessarily remove it (or add a principle) fyi" (while aligning the taxonomy with testing-principles).
- **Keep the taxonomy's own wording where it is clearer than an established name.**
  "I think I like the older version, it was super clear... I'm not sure if we are improving things here?"; "One of these sounds good and one sounds bad??" (on renaming tags to published smell names, where "Production Logic in Test" and "Test Logic in Production" read as opposites).
- **Message-text assertions remain a smell, to be avoided by preference.**
  "Hm.. I want to say that we should prefer to avoid it?", then "It is still a kind of smell" (after the agent proposed one flat smell tag, then a softened wording).
- **Suite-level properties are checked once, not tagged on every test.**
  "Maybe dead-in-CI should not be assessed here? Or as a separate check, not tagged on all" (on tests CI never runs, during the verb-mood review of the taxonomy).
- **Consistent grammar in the taxonomy.**
  "Can you check the mood of the verbs in the taxonomy?" (definitions became indicative descriptions of the test, with remedies as separate imperatives).

- **Tag the machinery a test builds, not the technique it picks.**
  "What are we trying to get at... tests that introduce a new complex structure?" (on a neutral tag pair, fixture knobs versus the test's own threads and timers, that classifiers cited to keep a fixture the author had rejected; it became one smell tag, `novel-abstraction`, named for what the reader must learn rather than for size, since "proportionate" was the excuse)
