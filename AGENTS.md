# Ethos

Programming is the construction and preservation of understanding: what the problem is, how the system solves it, and why the solution works.

-   **Finding the right formulation is part of solving the problem.**
    A better model can reveal familiar structure, unify special cases, and make machinery unnecessary.

-   **Good boundaries reduce what must be understood together.**
    What can be understood apart need not be carried together; what must be understood together should not be scattered.

-   **Correctness should be visible in the structure.**
    Local invariants, explicit assumptions, and clear control flow help us follow and check the reasoning.
    That clarity gives us firmer grounds for confidence in the system.

-   **Abstractions should follow the structure of the problem.**
    An interface should express the concepts, operations, and laws its users reason with.
    Generality should clarify the problem at hand; speculative generality can add unnecessary complexity.

-   **Complexity has a lasting cost in understanding.**
    Concepts, cases, assumptions, and their relationships all shape how easy a system is to understand.
    The strongest simplifications eliminate conceptual complexity, not merely lines of code.


# Style

## State

-   Prefer a functional style to in-place modification except in performance-sensitive areas.

## Abstractions

-   Prefer boundaries expressed in the domain’s established vocabulary, notation, and rules of composition.
    A practitioner fluent in the domain should be able to understand the interface without knowing its implementation.
-   “The ideal abstraction is as simple as possible, revealing everything the users need, while shielding them from implementation complexity.”
    — Conal Elliott, “Denotational Design with Type Class Morphisms” (2009)
-   Design and evaluate an abstraction from the perspective of the person using it.
    Keep in mind a minimal example that demonstrates how the interface is used.
-   Prefer a function for a single operation with no state or identity.
    Use a class when instances represent a domain concept, maintain an invariant, or participate in an established protocol.
-   Reduce dependencies between components; make those that remain explicit and easy to understand.
-   Where performance matters, let dominant operations and access patterns shape the abstraction’s interface and data layout.
-   Prefer a boundary that permits natural testing.
    A component that is awkward to test usually indicates that the boundary is in the wrong place.

## Naming

-   When naming an operation or event with a verb, identify its grammatical subject and object.
    Make explicit which entity acts and which is acted upon unless the surrounding interface establishes those roles unambiguously.
-   Avoid jargon and abbreviations that are unclear or ambiguous to a reader coming in cold.
    The test is whether a reader with the expected domain knowledge can identify the intended meaning without project-specific context, not whether it is obvious to the author.
-   Avoid nonstandard terms and nonstandard uses of established terms.
    If either is unavoidable, explain the intended meaning clearly where users first encounter it.

## Algorithms

-   Present the essential logic of a computation so it can be taken in as a whole.
    Its structure should show the principal operations and decisions, and how they relate, before the reader follows their details.
-   Implement established programming and mathematical algorithms so they are recognizable to a reader familiar with them.
    Preserve their conventional structure, terminology, notation, and steps unless a concrete constraint requires otherwise.

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
-   When several related components must be understood together, provide one clear overview of how they fit together and are intended to be used.
    Put it at the natural entry point, usually the module docstring or the docstring of the principal class, rather than scattering it across individual members.
-   Do not merely restate its declaration or narrate its implementation.
    Include implementation details when they affect the contract or guide its use.

## Python

-   Keep sibling clauses close enough that the control structure remains apparent as a whole.
    A long clause body makes their relationship difficult to parse even when nesting is only one level deep.
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
-   Evaluate Python names as they will normally appear at use sites, including any qualification supplied by imports.
    Judge a name together with the context readers normally see, rather than in isolation or against a fully qualified path they do not use.

## Formatting

-   Treat an automatic formatter's output as a constraint rather than the final word: when it produces awkward line breaks, rewrite the expression into an equivalent form whose formatted output reads naturally.
-   A local name may be renamed when the new name remains clear, but do not introduce aliases or change imports solely to influence automatic formatting.
    When an externally defined name causes awkward formatting, suggest changing it at its source rather than hiding it behind a local alias.

## Writing

-   Do not present guesses, assumptions, or inferences as facts; confirm factual claims against available evidence.
-   Introduce concepts and names in a context where their motivation is already clear.
    Otherwise the reader must carry an unmotivated definition until the justification arrives.
-   Avoid em dashes unless they express the intended structure or emphasis more clearly than other punctuation.
-   Prefer American spelling in identifiers, as in `color` and `optimize`, unless the codebase consistently uses another.
-   Refer to other contributors by their GitHub handles.

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

-   When working with stacked pull requests on GitHub, use the `gh stack` commands to create and manage the stack.
-   Describe a change primarily in terms of its motivation and its effect on the interface and behavior experienced by users of the code, and include implementation details where they help collaborators review or maintain it.
-   Prominently warn the user if a pull request removes code or documentation that version history attributes to another contributor.
    Identify the affected material and contributor when the history provides reliable attribution.
-   Omit routine assurances that basic project expectations have been met, such as stating that an automatic formatter was run, unless they convey information specific to the change.

## Tools

-   Offer to install a tool when it would make the task easier, rather than silently working around its absence.
    Otherwise a missing tool becomes a convoluted workaround that the user never had the chance to avoid.
-   Capture potentially long-running command output in a log from the outset so progress can be inspected independently.
