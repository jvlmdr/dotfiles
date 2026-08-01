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

-   Avoid `__post_init__` in Python, except where it is already in use.
    It derives fields by mutating the instance rather than computing them up front; on a frozen dataclass it cannot even assign to them directly.
-   Do not add `from __future__` imports that the project's Python version does not require.

## Writing

-   Introduce concepts and names in a context where their motivation is already clear.
    Otherwise the reader must carry an unmotivated definition until the justification arrives.
-   Avoid abbreviations that are unclear or ambiguous to a reader coming in cold.
    The test is whether someone without the surrounding context can expand it in only one way, not whether it is obvious to the author.

## Markdown

-   Do not line-wrap text; use one sentence per line.
    This keeps diffs readable: editing a sentence touches one line instead of reflowing the whole paragraph.
    It also simplifies editing, since a sentence can be moved or deleted with line-wise operations.

# Workflow

## Git

-   Bring upstream changes into a branch by rebasing, not by merging them in.
    Merging mixes other people's commits into the branch, so its history stops reading as only the change under review.
-   Do not force-push for the sake of a tidy history; push follow-up commits instead.
    Within a thread of work the intermediate history is useful: a reviewer can see what changed since their last pass.
    Assume PRs are squash-merged, so those commits never land on main and there is nothing to tidy.
    Force-pushing is acceptable where a rebase requires it.

## Tools

-   Offer to install a tool when it would make the task easier, rather than silently working around its absence.
    Otherwise a missing tool becomes a convoluted workaround that the user never had the chance to avoid.
