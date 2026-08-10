# Style

## State

-   Prefer a functional style to in-place modification except in performance-sensitive areas.

## Abstractions

-   Prefer a boundary for which the field already has a language, grammar or calculus.
    Its interface can then be understood by anyone fluent in the domain, without recourse to the implementation.
-   Prefer a boundary that permits natural testing.
    A component that is awkward to test usually indicates that the boundary is in the wrong place.

## Tests

-   Exercise stable behaviour through the public interface; avoid reaching into private members.
    A test bound to internals fails when the implementation changes, so it obstructs refactoring rather than protecting behaviour.

## Documentation

-   Documentation should be timeless: describe what is true of the code, not a blow-by-blow account of how it came to be that way, nor a description that only makes sense in the context of the patch or conversation that produced it.
-   Use the established language of the domain, including mathematical notation, when it makes the contract clearer.
-   Keep documentation consistent with behaviour and interfaces.

### Comments

-   Do not add comments that merely restate the code.

### Docstrings

-   Describe a component for someone using it rather than reading it: as relevant, what it does, why it exists, how to use it, and how it fits into the codebase.
-   Do not merely restate its declaration or narrate its implementation.
    Include implementation details when they affect the contract or guide its use.

## Python

-   Avoid `__post_init__` in Python, except where it is already in use.
    It derives fields by mutating the instance rather than computing them up front; on a frozen dataclass it cannot even assign to them directly.
-   Prefer the modern form of a construct where the project's Python version supports it, such as PEP 695 type parameters, PEP 698 `@override`, or `itertools.batched`.
    Follow the older form where the codebase uses it consistently.
-   Do not add `from __future__` imports that the project's Python version does not require.

## Formatting

-   Treat an automatic formatter's output as a constraint rather than the final word: when it produces awkward line breaks, rewrite the expression into an equivalent form whose formatted output reads naturally.
-   A local name may be renamed when the new name remains clear, but do not introduce aliases or change imports solely to influence automatic formatting.
    When an externally defined name causes awkward formatting, suggest changing it at its source rather than hiding it behind a local alias.

## Writing

-   Introduce concepts and names in a context where their motivation is already clear.
    Otherwise the reader must carry an unmotivated definition until the justification arrives.
-   Avoid abbreviations that are unclear or ambiguous to a reader coming in cold.
    The test is whether someone without the surrounding context can expand it in only one way, not whether it is obvious to the author.
-   Prefer American spelling in identifiers, as in `color` and `optimize`, unless the codebase consistently uses another.

## Markdown

-   Do not line-wrap text; use one sentence per line.
    This keeps diffs readable: editing a sentence touches one line instead of reflowing the whole paragraph.
    It also simplifies editing, since a sentence can be moved or deleted with line-wise operations.

# Workflow

## Reuse

-   Look for code in the project related to the task before writing any.
    A parallel implementation of something that already exists leaves two definitions to keep in step.
-   When new or changed code serves a similar purpose to existing code, determine why both should exist and how their responsibilities differ.
    If the distinction is not convincing, raise it with the user rather than treating the design as settled.

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
