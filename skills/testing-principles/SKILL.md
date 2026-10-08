---
name: testing-principles
description: Principles for writing, changing and reviewing tests in any language, with the named test smells to avoid. Use when writing, changing or reviewing tests.
---

# Testing Principles

- Together, the tests should cover the behavior the public interface promises, each behavior once (Minimize Test Overlap): a gap leaves a promise unprotected, and a duplicate is upkeep that protects nothing new.
- Write tests the way a practitioner would by hand, so that each shows its case, the call under test and what it expects without the reader following detours (Communicate Intent; DAMP, not DRY): a helper that removes detail irrelevant to the case makes a test clearer, while one that hides the call or the check, or does more than its name says, obscures it.
  Write expected values out rather than recomputing them with the rule under test, which only checks the code against itself.
- Arrange and observe through the public interface (Use the Front Door First), and use mocks and patches only where the real collaborator is impractical: each one replaces behavior the test then no longer checks, and ties the test to how the code is built (the smell: Overspecified Software).
  Where a behavior is hard to arrange or observe that way, question whether the design is at fault, and change it only if the change also serves the code's callers; production code that exists only for tests is worse than leaving the behavior untested (Keep Test Logic out of Production Code).
- Do not write tests that settle behavior the design has not decided: whatever a test asserts is treated as decided, which blocks a later decision.
  Every test is kept up for as long as it exists, so it should protect something a caller relies on.
- Give each test one behavior and name it for that behavior, so that a failure says what broke (Single Concept per Test); combine steps only where their order is the behavior or the setup is an expensive end-to-end run.
- Observe outcomes as state and exception types, in process, rather than through message text, stderr or a subprocess, unless the text itself is the contract: those break when wording or the environment changes, and can pass on an unrelated failure (the smell: Fragile Test).
- Use fixtures for setup that is expensive or needs cleanup, and say why something is a fixture.
  Give each collaborator its own stand-in, set up in the test, rather than one shared object configured by name for all of them, so the test shows how the code is used (the smell: General Fixture).
- Keep a test's verdict independent of timing (the smell: Erratic Test): wait on the event itself rather than sleeping, give each wait a generous deadline that only matters when the test is failing, so a hang becomes a failure, and assert on durations only where time is the behavior under test.
- Keep tests and their supporting machinery in proportion to the behavior being verified.
