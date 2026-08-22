# Specialist Review Methods

Use the applicable method as a starting point for a risk-specific review.
Adapt it to the actual question, combine related specialties when one coherent review can cover them deeply, and split them when they require distinct reasoning or evidence.
These are examples rather than an exhaustive checklist.

## Temporal and lifecycle

Reconstruct creation, start, use, failure, cancellation, completion, cleanup, and restart where applicable.
Identify owners, mutation sites, execution contexts, ordering and visibility guarantees, clock choice, deadline propagation, material normal and exceptional exits, and plausible adverse interleavings.
Only then judge races, stale work, leaks, double completion, reentrancy, idempotency, or timeout behavior.
Verify framework guarantees rather than inventing interleavings the framework excludes.

For externally invoked or queued work, give a compact per-operation account of admission and queueing, outer and inner deadlines, cancellation effects, retry and idempotency, and ownership after caller abandonment.
Summarize the ownership model and the material public-operation timelines or interleavings examined in the coverage note.

## Security and privacy

Establish trust, authority, identity, and data boundaries before tracing realistic misuse and failure paths.
Examine authentication, authorization, untrusted input, deserialization, secrets, privacy, and changes to exposed attack surface where relevant.

## Persistence and compatibility

Map the supported readers, writers, versions, formats, protocols, and storage environments.
Examine partial publication, interruption, recovery, rollback, fallback, and compatibility in both directions.
Use representative existing artifacts or real storage behavior when the contract depends on them; otherwise retain the missing evidence as a readiness gap.

## Numerical and scientific behavior

State the governing invariants, mathematical formulation, or reference behavior before inspecting implementation details.
Trace shapes, dtypes, devices, transformations, autodiff, randomness, precision, conditioning, and approximation where relevant.
Use the smallest representative equivalence, error, or reference comparison that can establish the consequential claim.

## Performance and resources

Identify the dominant operations, realistic data sizes, and constrained resources before judging an optimization or regression.
Verify consequential latency, throughput, memory, accelerator, or I/O claims under representative and comparable conditions rather than from intuition alone.

## Domain and ecosystem behavior

Identify the domain rule, protocol contract, external API guarantee, framework lifecycle, accessibility expectation, or delivery invariant that governs the change.
Verify version-specific behavior against the project's actual dependency or platform and authoritative primary sources when needed.
For build, packaging, deployment, or CI changes, trace trigger and path logic, permissions, artifacts, caching, release behavior, and relevant branch topology.
