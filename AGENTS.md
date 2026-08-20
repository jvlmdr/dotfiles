# Design ethos

> The price of reliability is the pursuit of the utmost simplicity.
> — C. A. R. Hoare, “The Emperor’s Old Clothes” (1980 Turing Award lecture)

> We can only hope to make reliable those things we can understand.
> — Rich Hickey, “Simple Made Easy” (2011)

> Fools ignore complexity.
> Pragmatists suffer it.
> Some can avoid it.
> Geniuses remove it.
> — Alan J. Perlis, “Epigrams on Programming” (1982)

> For a program to retain its quality it is mandatory that each modification is firmly grounded in the theory of it.
> — Peter Naur, “Programming as Theory Building” (1985)

> The computer revolution is a revolution in the way we think and in the way we express what we think.
> — *Structure and Interpretation of Computer Programs* by Harold Abelson and Gerald Jay Sussman with Julie Sussman

> As a result of all the above reasons it is our belief that the single biggest remaining cause of complexity in most contemporary large systems is [mutable] state, and the more we can do to limit and manage state, the better.
> — Ben Moseley and Peter Marks, “Out of the Tar Pit” (2006)

> The benefit provided by a module is its functionality.
> The cost of a module (in terms of system complexity) is its interface.
> — John Ousterhout, *A Philosophy of Software Design* (2018)

> The ideal abstraction is as simple as possible, revealing everything the users need, while shielding them from implementation complexity.
> — Conal Elliott, “Denotational Design with Type Class Morphisms” (2009)

> …premature optimization is the root of all evil.
> Yet we should not pass up our opportunities in that critical 3%.
> — Donald E. Knuth, “Structured Programming with go to Statements” (1974)

> I once heard a master programmer praised with the phrase, “He adds function by deleting code.”
> — Jon Bentley, “The Most Beautiful Code I Never Wrote” (2007)

Use code and abstractions to express and sharpen an understanding of the problem.
Keep concerns distinct rather than intertwined.
Simplicity is a means to an understandable and reliable system, not a synonym for ease, familiarity, brevity, or fewer parts.

# Style

## State

-   Prefer a functional style to in-place modification except in performance-sensitive areas.

## Abstractions

-   Prefer boundaries expressed in the domain’s established vocabulary, notation, and rules of composition.
    A practitioner fluent in the domain should be able to understand the interface without knowing its implementation.
-   Reduce dependencies between components; make those that remain explicit and easy to understand.
-   Where performance matters, let dominant operations and access patterns shape the abstraction’s interface and data layout.
-   Prefer a boundary that permits natural testing.
    A component that is awkward to test usually indicates that the boundary is in the wrong place.

## Code organization

-   If decorative comment dividers such as `####`, `====`, `----`, `****`, or `////` seem necessary to separate conceptual sections of a source file, consider whether the file's scope is too broad or its abstraction boundaries need revision.
    Avoid introducing such dividers where they are absent; where they are established, follow the surrounding style unless restructuring removes the need for them.

## Tests

-   Exercise stable behavior through the public interface; avoid reaching into private members.
    A test bound to internals fails when the implementation changes, so it obstructs refactoring rather than protecting behavior.

## Documentation

-   Documentation should describe the current design and durable rationale, not the chronology of the patch or conversation that produced it.
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

-   For prose maintained or reviewed with line-oriented tools, use one sentence per source line when a newline renders as whitespace, as in Markdown documentation and LaTeX; use one paragraph per line when it renders visibly, as in GitHub issues, pull requests, discussions, and Markdown prepared for them.
    This does not apply to formatter- or line-length-controlled source code.
    These conventions keep diffs and line-wise edits local without changing rendered text.

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
-   Capture potentially long-running command output in a log from the outset so progress can be inspected independently.
