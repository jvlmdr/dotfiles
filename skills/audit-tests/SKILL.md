---
name: audit-tests
description: Audit the tests of a change or a suite: classify each test, find the missing ones, and propose what to do with each. Use only when explicitly invoked.
disable-model-invocation: true
---

# Audit Tests

An audit has two halves, and a request may need only one: judging the existing tests, each by whether it is a natural test, one a person would think to write; and finding the missing tests from the public interface.
Apply the `testing-principles` skill, and classify with [TAXONOMY.md](TAXONOMY.md), which adds what only an audit needs: the value axes, the smell tags and the outcomes.

- When the audit looks for missing tests, find them by black-box test design.
  Extract the public interface, its signatures and documentation, and give only that to an independent agent, rather than pointing it at files that hold the tests or the implementation; one that has read the tests tends to see only what they already cover.
  Compare the cases it proposes with the existing tests.
  It can run alongside any classification.
- When there are more tests than one reviewer can examine closely, split the classification across subagents such that each can examine every test in its share and related tests are seen together; reviewers tend to return a similar amount whatever their share, so the split also sets how much detail comes back.
  Give each the documentation of the code its tests exercise, since the spec axis is judged against it.
  Have each read the `testing-principles` skill and the taxonomy itself rather than a summary of them, since subagents see only their brief, and a summary keeps each rule's headline but drops the clauses that decide the hard cases.
- Keep each check in proportion to the decision it settles: reading or running a single test file settles most claims in seconds, while the whole suite, mutation testing or an experiment takes minutes, and longer still when it competes with other subagents for the machine.
  So while auditing, use targeted runs that answer a specific doubt; when applying approved changes, run the tests of each changed file.
- Treat a verdict that rests on history or on other tests, such as `vestigial` or `subsumed`, as a claim to check, since removals follow from it and a subagent may have judged it without seeing the tests in another's share.
- Change nothing until the user approves: report every test with its categories, tags and proposed outcome, briefly where it stays as it is, then the missing cases and the taxonomy's suite checks.
  When the findings are many, suggest that the user invoke `/eat-the-elephant` to settle them, since that skill runs only when the user starts it.
