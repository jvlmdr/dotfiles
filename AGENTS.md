# Style

## State

-   Prefer a functional style to in-place modification except in performance-sensitive areas.

## Abstractions

-   Prefer a boundary for which the field already has a language, grammar or calculus.
    Its interface can then be understood by anyone fluent in the domain, without recourse to the implementation.
-   Prefer a boundary that permits natural testing.
    A component that is awkward to test usually indicates that the boundary is in the wrong place.

## Comments

-   Comments should be timeless: describe what is true of the code, not a blow-by-blow account of how it came to be that way, nor a description that only makes sense in the context of the patch or conversation that produced it.
-   Do not add comments that provide no more value than the code itself.

## Python

-   Never use `__post_init__` in Python (except where it's already in use).

## Writing

-   Introduce concepts and names in a context where their motivation is already clear.
    Otherwise the reader must carry an unmotivated definition until the justification arrives.
-   Avoid abbreviations that are unclear or ambiguous to a reader coming in cold.
    The test is whether someone without the surrounding context can expand it in only one way, not whether it is obvious to the author.

## Markdown

-   Do not line-wrap text; use one sentence per line.
    This keeps diffs readable: editing a sentence touches one line instead of reflowing the whole paragraph.
    It also simplifies editing, since a sentence can be moved or deleted with line-wise operations.

## Git

-   Avoid force-pushing for routine work; push follow-up commits instead.
    Assume PRs are squash-merged, so intermediate commits never land on main; keeping them costs nothing and lets reviewers see what changed since their last pass.
    Force-push only when a rebase actually requires it.
