# Specialist Review Examples

Choose and adapt assignments to the questions the change raises, combining or splitting them when useful.
Specialists can contribute to both design and correctness; use a focused pass when expertise or extra attention would add value beyond the core review.
These examples are open-ended and do not each require a separate agent.
Other questions may call for security, privacy, persistence, compatibility, or different expertise.

## Code expression and presentation

Consider how the code looks and reads: naming, grouping, symmetry, balance, and the shape produced by the formatter.
Suggest natural rewrites that make the principal logic easier to take in and give related parts appropriate space.
Improving how code looks is a legitimate review goal, even when behavior is already correct.
Exercise taste in judging the result within its surrounding code and project style.

## Mathematical and algorithmic code

Examine whether the formulation reveals the underlying mathematical structure, uses recognizable algorithms, and expresses array operations clearly and idiomatically.
Check the governing invariants and numerical behavior, including shapes, dtypes, transformations, randomness, precision, and conditioning where relevant.
Use a representative equivalence, error, or reference comparison to establish consequential claims.

## Library and framework expertise

Bring expertise in the relevant ecosystem, such as JAX/NNX, NumPy/Zarr, or Docker, to assess idiomatic interfaces and durable solutions.
Consider whether established capabilities or conventions offer a better formulation.
Check interactions and material guarantees against the project's actual versions and authoritative sources, including storage or deployment behavior when relevant.

## Concurrency and lifetime

Trace ownership and execution through creation, use, failure, cancellation, completion, cleanup, and restart where applicable.
Establish ordering and visibility guarantees before considering adverse interleavings, races, stale work, leaks, or double completion.
For queued or externally invoked work, account for deadlines, retries, and ownership after caller abandonment.
Verify framework guarantees and use timelines when they help establish a finding or explain uncertainty.

## Experiments and statistical conclusions

Identify the question an experiment or analysis is meant to answer and the assumptions that make its comparisons meaningful.
Check whether the data, grouping or pairing, statistical methods, and treatment of uncertainty support a valid answer to that question.
Verify that reported conclusions follow from the relevant evidence and communicate its practical meaning and limitations.

## Performance and resources

Identify the dominant operations, realistic data sizes, and constrained resources before judging an optimization or regression.
Verify consequential latency, throughput, memory, accelerator, or I/O claims under representative and comparable conditions.
