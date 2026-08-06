# Style

## State

-   Prefer a functional style to in-place modification except in performance-sensitive areas.

## Abstractions

-   Prefer a boundary for which the field already has a language, grammar or calculus.
    Its interface can then be understood by anyone fluent in the domain, without recourse to the implementation.
-   Prefer a boundary that permits natural testing.
    A component that is awkward to test usually indicates that the boundary is in the wrong place.

## Documentation

-   Comments should be timeless: describe what is true of the code, not a blow-by-blow account of how it came to be that way, nor a description that only makes sense in the context of the patch or conversation that produced it.
-   Do not add comments that provide no more value than the code itself.
-   Prefer documentation that says how something fits into the structure around it, rather than describing what it implements.
    The body is already there to be read; the role it plays in the whole is not.

## Python

-   Avoid `__post_init__` in Python, except where it is already in use.
    It derives fields by mutating the instance rather than computing them up front; on a frozen dataclass it cannot even assign to them directly.
-   Prefer the modern form of a construct where the project's Python version supports it, such as PEP 695 type parameters, PEP 698 `@override`, or `itertools.batched`.
    Follow the older form where the codebase uses it consistently.
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

## Reuse

-   Look for code in the project related to the task before writing any.
    A parallel implementation of something that already exists leaves two definitions to keep in step.

## Git

-   Bring upstream changes into a branch by rebasing, not by merging them in.
    Merging mixes other people's commits into the branch, so its history stops reading as only the change under review.
-   Do not force-push for the sake of a tidy history; push follow-up commits instead.
    Within a thread of work the intermediate history is useful: a reviewer can see what changed since their last pass.
    Assume PRs are squash-merged, so those commits never land on main and there is nothing to tidy.
    Force-pushing is acceptable where a rebase requires it.

## Pull requests

-   Include only what a reviewer needs in order to review the change.
    A statement that would hold for any PR, such as having run the formatter or the type checker being clean, says nothing about this one and adds length the reader must get past.

## Tools

-   Offer to install a tool when it would make the task easier, rather than silently working around its absence.
    Otherwise a missing tool becomes a convoluted workaround that the user never had the chance to avoid.
