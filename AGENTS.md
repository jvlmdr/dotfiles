> Everything should be made as simple as possible, but not simpler.
> — attributed to Albert Einstein

> The price of reliability is the pursuit of the utmost simplicity.
> — Tony Hoare, “The Emperor’s Old Clothes” (1980 Turing Award lecture)

> Any intelligent fool can make things bigger, more complex, and more violent.
> It takes a touch of genius … to move in the opposite direction.
> — E. F. Schumacher, “Small Is Beautiful” (1973)

# Style

## State

-   Prefer a functional style to in-place modification except in performance-sensitive areas.

## Abstractions

-   Prefer a boundary for which the field already has a language, grammar or calculus.
    Its interface can then be understood by anyone fluent in the domain, without recourse to the implementation.
-   Prefer a boundary that permits natural testing.
    A component that is awkward to test usually indicates that the boundary is in the wrong place.

## Code organization

-   If decorative comment dividers such as `####`, `====`, `----`, `****`, or `////` seem necessary to separate conceptual sections of a source file, consider whether the file's scope is too broad or its abstraction boundaries need revision.
    Avoid introducing such dividers where they are absent; where they are established, follow the surrounding style unless restructuring removes the need for them.

## Tests

-   Exercise stable behavior through the public interface; avoid reaching into private members.
    A test bound to internals fails when the implementation changes, so it obstructs refactoring rather than protecting behavior.

## Documentation

-   Documentation should be timeless: describe what is true of the code, not a blow-by-blow account of how it came to be that way, nor a description that only makes sense in the context of the patch or conversation that produced it.
-   Use the established language of the domain, including mathematical notation, when it makes the contract clearer.
-   Keep documentation consistent with behavior and interfaces.

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
-   Avoid quoted type annotations unless necessary.
-   Avoid `typing.cast` and type-checker suppressions when the type can be modeled or narrowed accurately instead.
    They bypass static verification; reserve them for boundaries where an invariant is known but cannot be expressed to the type checker, and keep their scope local.
-   Prefer importing modules to importing their members directly.
    Names that belong to the established vocabulary of type annotations are an exception and should be imported directly to keep annotations concise, such as constructs provided by `typing` or `collections.abc`.

## Formatting

-   Treat an automatic formatter's output as a constraint rather than the final word: when it produces awkward line breaks, rewrite the expression into an equivalent form whose formatted output reads naturally.
-   A local name may be renamed when the new name remains clear, but do not introduce aliases or change imports solely to influence automatic formatting.
    When an externally defined name causes awkward formatting, suggest changing it at its source rather than hiding it behind a local alias.

## Writing

-   Do not present guesses, assumptions, or inferences as facts; confirm factual claims against available evidence.
-   Introduce concepts and names in a context where their motivation is already clear.
    Otherwise the reader must carry an unmotivated definition until the justification arrives.
-   Avoid abbreviations that are unclear or ambiguous to a reader coming in cold.
    The test is whether someone without the surrounding context can expand it in only one way, not whether it is obvious to the author.
-   Avoid em dashes unless they express the intended structure or emphasis more clearly than other punctuation.
-   Prefer American spelling in identifiers, as in `color` and `optimize`, unless the codebase consistently uses another.

## Prose files

-   For prose whose source form is maintained or reviewed with line-oriented tools, put each sentence on its own source line when the renderer treats a single source newline as interword whitespace.
    This convention applies to artifacts such as Markdown documentation and LaTeX manuscripts.
    When the renderer displays a softbreak as a visible line break, keep each paragraph on one source line; do not hard-wrap it or put each sentence on a separate line.
    GitHub renders softbreaks this way in issues, pull requests, and discussions, including when the text is prepared in an intermediate Markdown file.
    This convention does not apply to source code governed by a formatter or line-length limit.
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

-   Describe a change primarily in terms of its motivation and its effect on the interface and behavior experienced by users of the code, and include implementation details where they help collaborators review or maintain it.
-   Prominently warn the user if a pull request removes code or documentation that version history attributes to another contributor.
    Identify the affected material and contributor when the history provides reliable attribution.
-   Omit routine assurances that basic project expectations have been met, such as stating that an automatic formatter was run, unless they convey information specific to the change.

## Tools

-   Offer to install a tool when it would make the task easier, rather than silently working around its absence.
    Otherwise a missing tool becomes a convoluted workaround that the user never had the chance to avoid.
-   Capture the output of potentially long-running commands in a log file from the outset so progress can be inspected independently with tools such as `tail`, `less`, or `lnav`.
