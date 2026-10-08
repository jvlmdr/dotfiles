# Test audit taxonomy

A scheme for spotting tests a person would not think to write: tests that exist only for coverage, pin a choice nobody settled, only make sense in the context of one past change, or reach the behavior by an indirect or fragile route.
It applies the principles in `testing-principles` to existing tests, and adds what only an audit needs: the value axes, the smell tags and the outcomes.

## Categories

Each category carries a verdict.
In a test that runs several scenarios, apply the categories per scenario and the outcome per test.

**Importance**: what a user of the public interface loses if the assertion vanished.
- `core`: the main path of a documented promise.
- `edge`: a documented boundary or interleaving that a caller can produce.
- `incidental`: a documented rejection that no known producer can trigger, or a value that nothing consumes; worth at most one cheap case, never a matrix.

**Spec**, only where it applies: the asserted behavior is not a settled part of the design.
- `debatable`: the asserted choice was never settled.
- `vestigial`: written for a design since removed. Check the history with `git log -S` rather than inferring it from the name.
- `superseded-by <change>`: a planned change will make it obsolete.

**Layer**: `ok`, `-> <file>` when a lower layer shows the behavior through a public interface, or `-> library` when the behavior is a dependency's.
Keep the lowest-level test that states the behavior through a public interface; keep a higher-level copy only for orchestration that only it asserts.

## Tags

Smell tags carry a verdict; one is enough to justify an outcome other than `keep`.
- `vacuous`: asserts the absence of a mechanism that never existed.
- `weak-assert`: passes for a plausible wrong implementation or an unrelated failure (`returncode == 1`, `assert errors`).
- `indirect-assert`: infers the property from a downstream effect instead of asserting it where the code under test decides it. Assert the value returned or the state left behind instead, and the call made only where that call is the contract.
- `asserts-text`: matches message text, a log line or stderr, whoever wrote it; text breaks when the wording changes and can pass on an unrelated message that shares the substring. Prefer to avoid it: assert state, the exception type or a dedicated exception class instead, unless the text itself is the contract.
- `reaches-internals`: arranges or observes through private attributes, or breaks an abstraction through a mock, instead of the public interface; it breaks when the internals change although the behavior has not.
- `mirrors-impl`: transcribes the implementation's predicate or branch tree into the expected value.
- `repr-assert`: pins a representation as if it were the contract, such as an intermediate record nothing consumes.
- `defensive-guard`: fires an internal consistency check by faking the collaborator it guards against.
- `gc-choreography`: uses a finalizer or reference-count timing to stall a thread or pin where a `del` sits.
- `novel-abstraction`: introduces a structure of its own that a reader must learn before the test makes sense, such as a shared fixture of settings for every collaborator, or threads, executors and timers that stage an interleaving; worth it only where the behavior cannot be reached more directly.
- `patches-third-party`: monkeypatches a standard-library or dependency attribute.
- `subsumed`: has every assertion made by a named other test; `overlaps`: shares a script or a grid cell with another.
- `multi-scenario`: checks several behaviors, so its name cannot say which failed. Several arrange-act-assert sequences in one test are a common signal; one action with several results is fine. End-to-end, process and interleaving tests, and sequences whose order is the behavior, are exempt.

Neutral tags describe technique and cost.
- `fault-injection` vs `interleaving-hook`: patches a collaborator to raise vs to block.
- `patches-collaborator`: patches the project's own class; `env-patch`: sets environment variables for isolation.
- `liveness-assert`: checks with a weakref or deletion that a leak stays fixed; legitimate.
- `test-seam`: exercises a public function whose only production caller is the entry point.
- `process-boundary`: runs a subprocess or fake interpreter. Record its cost.
- `heavy-setup`: spends setup, multiplied by its cases, out of proportion to its assertion. Measure the cost rather than guess.
- `timing-bound`: asserts an upper bound on elapsed time.
- `incidental-value`: pins a constant that a redesign changes by editing one literal.
- `third-party-behavior`: observes a dependency's behavior alongside the project's. Say which half is ours.

## Outcomes

`keep` (optionally `+trim`, `+rename`, `+tighten`), `simplify`, `split`, `merge-into <survivor>`, `move-to <file>`, `rewrite <technique>`, `share-setup`, `delete`, `conditional-on <change>`, `document`, `decide`.
`share-setup`: move repeated setup into a plain helper, or into a fixture only if it is expensive or needs cleanup.
Allow `missing-test` rows: a classification alone cannot record a gap.

## Five questions

1. If this assertion disappeared, what would a caller lose? (importance)
2. Is the asserted behavior a settled part of the design (`superseded-by` if a known change will replace it)? (spec)
3. Is this the lowest layer where a public interface shows it? (layer)
4. How does the test reach the behavior, and does a smell tag apply? (tags)
5. Does a named other test already establish it? (subsumed or overlaps)

## Suite checks

Once per suite, list the tests CI never runs (skipped by a setting CI does not set), and ask whether that is intended.

A cited covering test is a claim to check, not evidence: read it and confirm that it asserts what the removed test did, at a layer that would see the same failure.
Mutate only when the user asks about a specific row: break the protected behavior and confirm that a remaining test fails.
