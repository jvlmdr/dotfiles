# Sources

Evidence for each smell in [SKILL.md](SKILL.md), for maintainers: why it matters, what overrides it, and established names where one fits.
Quotations are the author's own words; brackets replace identifiers specific to the codebase they were said about.
SKILL.md deliberately does not link here, so agents running the skill do not load it.

## `churn`

A reviewer reads every changed line, so rewording still-true text, moving lines, respelling types or cleaning up nearby code adds to the diff and hides the real change: "Avoid unnecessary changes that just add to the diff"; "I only wanted to fix the problems that I introduced".
This holds even for code that deserves cleaning ("I'm tempted to clean this up but let's keep the changes as small as possible") and for other people's code ("I'd rather perhaps leave [it] alone since I didn't create it. Unless there are striking issues").
Override: a plainly wrong line inside code already being changed is fixed.

## `obscuring-helper`

A helper should be clearer than the code it replaces and hide only what the reader at the call site does not need: information hiding, in both directions.
No clearer: a one-line call as readable as the helper ("it's a one-line function that is very readable"), a literal as short as the call ("It's not even longer"), or a general helper over two cases that the explicit terms would state better ("That [helper] is horrible. Better to inline it I think?").
Hides what the reader needs: a write to lock-guarded state that belongs in view in the critical section ("whether they touch the sensitive state"), or one-use wrappers that keep the flags a `main` reads out of sight ("so succinct as to be spaghetti/ravioli like").
Override: keep a helper that is clearer than its body, such as one that names a mathematical object, a predicate or a resource scope, or that carries a check callers would otherwise write ("Maybe [the helper module] is good. It includes the type check").
Names: Lazy Element, Shallow Module, Conjoined Methods (smells); Inline Function (refactoring); information hiding (Parnas).

## `mixed-levels`

Setup detail at the top of a function, or a construction spelled out inline, keeps the reader from seeing its work at one level; extract it into a helper named for its purpose.
Override: an extraction that hides what the call site needs to know, as under `obscuring-helper`, goes back ("Hmm nah put it back").
Names: single level of abstraction (SLAP), Composed Method (principles); Extract Function (refactoring).

## `name-clutter`

Each class, enum or new name is one more thing a reader must learn and hold in mind ("name clutter"), so it must give back more than it costs.
Measure its value against its actual use: an enum asked only a yes/no question is a bool; a contract object used for one check is the field it holds; a normalization class applied to one fixed pair of statistics is a function and two constants ("Do we need to introduce a class? Can we just use constants?"; "Does [the contract object] earn its place?"; "Is this a bit overkill?").
Override: a type that maintains an invariant, represents a concept the code reasons with, or serves an established protocol gives back more than it costs.
Names: Lazy Element, Classitis (smells); Inline Class (refactoring); cognitive load (Ousterhout).

## `needless-complexity`

What the reader already knows costs no new reading: the library's recipe, the language's idiom, the shape a reference implementation uses ("No new name. Follow the idiomatic style"; "Their code is quite neat").
So prefer the established form (a library's own dtype parameter over a cast afterwards: "Did you use the safe and elegant way to do it?") and drop complexity the problem does not need, such as a loop padded to a fixed count with clamped indices and no-op branches where the bound is known (see `defensive-code`).
Override: the established form must be clearer here, which rules out a trick ("No, I think it's fine, not a trick") or a more functional form for its own sake ("only if it makes it more clear"); it must type-check; it must not cost real performance ("where it doesn't cost (much) performance"); and where usage varies, the codebase's dominant form is the idiom.
Asking whether there is a nicer way and keeping the code is a good outcome ("No, agreed that this way of doing it is fine.").
Names: Replace Inline Code with Function Call (refactoring); least astonishment (principle).

## `defensive-code`

A check tells the reader that its case can happen; when it cannot, the reader works out when it fires before finding that it never does ("Any other overly defensive code where readability should be favoured?").
So drop a tolerance, assert or re-check that the types or the construction already rule out ("Do we actually need tolerance here? Or is it overly defensive?", then "just not worry about it"; "I don't think we need to assert here? We can assume that the caller has type checking on").
Override: a check at a boundary where nothing rules the case out, such as data from `json.loads`, which is `Any`, stays ("Oh good point").
Names: defensive programming; define errors out of existence (Ousterhout); design by contract (Meyer).

## `speculative-generality`

Generality is paid for by every reader and every test, and a widened type spreads to every signature it reaches ("Why do we need to support None in the trees? This is horrid").
Do not add code for a case the uses do not have: "we shouldn't add any code to support it, or document it".
A wider input type is not more honest when the callers are typed: "We can assume that the caller has type checking on".
Removing a feature can be the fix for its bug ("I'm inclined to simplify it and avoid the risk of making this mistake").
Override: measure against the code's real uses, which may lie outside the code in view; an option with a track record is not speculative ("I would keep [that option], it has been useful for [a model]").
Names: Speculative Generality (smell); YAGNI, which applies to presumptive features only.

## `nonobvious-correctness`

"I want the code itself to be clearly correct, not rely on subtle effects."
State a condition in the form the reader checks it, not through a derived quantity ("It requires the reader to jump through steps in their head to check if the condition is correct"): a bound as an interval, a positive rather than a double negative, a statement rather than `return` of a call in a function that returns nothing.
Make the order and binding of effects explicit: bind a call's result before a later call whose timing matters ("Is this ambiguous about when [the clock] is called if [the other call] takes a while?"), do not rely on scheduler effects such as `asyncio.sleep(0)`, and do not let a pattern silently rebind an outer name.
Names: Nonobvious Code (smell).

## `long-condition`

A condition that spans several lines takes more reading than the code it guards: "This looks like code that a human just wouldn't write, e.g. the body being shorter than the if-clause"; "I don't like if statements with multi-line clauses".
The fix depends on the condition: compare the whole value with its expected form, match the structure once, or name the condition.
No established name fits.

## `two-sources-of-truth`

Each piece of knowledge has one owner, so a change happens in one place and a reader checks it once ("I think name it once"; "I hate the repetition"; "I cannot follow the logic of this code" where one decision was made in two places).
This includes code that reimplements what the codebase already provides ("Did we use pre-existing util functions or libraries for this?"), a condition or block repeated across callers (a transition predicate; one wait helper in place of many copies), and a clause repeated across sibling conditions, which belongs in one shared guard.
It also includes a check that another owner already enforces: the type checker, the callee, the server, or the construction of the value; validate at the boundary and trust the data inside.
The owner must actually enforce it: where a library ignores a mismatch, the check is not a copy (see `silent-failure`).
Code that only looks alike is not one piece of knowledge: merge copies only where they must change together, since sharing couples them ("duplication is far cheaper than the wrong abstraction", Sandi Metz).
Keep one caller's restriction out of a general function; it belongs to that caller ("I'm not sure if it's too restrictive to check this here").
Names: DRY; Barricade; Special-General Mixture (smell).

## `two-knobs`

One setting has one control: a flag duplicating a general override, fallback fields beside explicit ones ("definitely remove [the fallback fields]"), or a config field duplicating the library's own environment variable ("I don't like it when programs overwrite CUDA_VISIBLE_DEVICES env var in python"; "Otherwise we have no way to disable it with the flag, right?").
Keep the library's own mechanism and remove the copy.

## `silent-failure`

Keep or add a check where, without it, a failure would go unnoticed or surface as a less useful error: a library that ignores mismatches ("Maybe we should check shape too?"), or an error that should list everything missing ("I think it's useful to have the full listing").
Names: "Errors should never pass silently" (PEP 20).

## `caller-obligation`

An obligation each caller must remember will be forgotten ("This feels risky. I preferred e.g. closing a pipe in Go").
Put it where it runs on every exit path, a context manager or `finally`, or choose a representation that removes the special case, such as a collection that is empty rather than absent ("Maybe it's a nicer invariant that it's always either full or none?").
Structure beats a guard against the wrong order ("I don't like having to be defensive about any accidental jax initialization").
Names: define special cases out of existence.
A method that should meet such an obligation and does not (a state change that never wakes a waiting worker) shows only across methods and is easy to miss; a concurrency review is the better check for it.

## `opaque-value`

Name a quantity the reader would otherwise work out ("Would this code be more legible if we introduced short names for the shape dims?"), but not a trivial literal ("I think "a" and "b" is ok").
A keyword names a bare literal argument ("I think axis= and dtype= is more clear."), unless it makes the formatter break the call ("Hmmm not if it overflows the line actually!").
Read ordinary Python data, such as tuples, lists and dicts passed between functions, by name rather than position; array indexing and shapes are not this smell.
When building data item by item, build one record per item and stack the fields afterwards, rather than appending to several lists in step ("Is there a way to clean up the big list of appends?").
Names: Explaining Variable.

## `sprawl`

Judge code as the formatter prints it, taking the formatter as a constraint rather than the final word ("[the formatter] causes a few ugly line breaks"; "This could be more beautiful").
Code can also be correctly formatted and still take more lines than it says ("Come on, tighten it up!!"; "I wonder if there's a way to make the code less long without removing any typing").
Rewrite into an equivalent form that formats cleanly, such as an intermediate with a real meaning or a plain loop, but "without removing any typing, without introducing stupid alias functions".
Override: in someone else's file, a small diff beats a nicer layout; a wrap that matches the file's existing wrapping can stay when the alternative is inconsistent with the file and grows the diff.
Known limits: a do-nothing `case` clause kept only for exhaustiveness, where a one-line comment says the same, and a call exploded one argument per line where building the argument first would fit it on one line, are easy to miss when the same code also has a correctness smell.

## `missing-docstring`, `poor-docstring`, `missing-comment`, `poor-comment`

A comment says what the code cannot show: why the code exists ("document its reason for existing (in the right place)"), and the mechanism and its consequence ("That comment is dumb. It should be technical.").
It says it plainly ("What are we trying to say here?"), and earns its place ("the comments all earn their place / are not vacuous").
A docstring tells the user what they need; a comment tells the implementer ("Should it be in the docstring (for reader/browser) or in the comments (for author/implementer)?").
Names: Explaining Comments, Delete Redundant Comments; Implementation Documentation Contaminates Interface (smell).
Whether documentation matches the implementation belongs to the PR checklist, not here.

## `slogan`, `aphorism`, `allusion`, `figure-of-speech`

A comment or docstring states plainly what the code does or requires and why ("That comment is dumb. It should be technical.").
For example, above a `notify()` in `close()`, "Closing is work too: an idle worker wakes to release resources and exit." becomes "Closing requires the worker thread to release its resources and exit, so wake it in case it is idle."
The content was right; the figurative form made the reader decode it.

## `code-order`

Order a file so that "someone reading through it sequentially doesn't get any surprises and need to jump around": important things first, and "other things before it only if necessary for definitions"; a helper used by one function directly below it, unless its meaning is critical to the code that follows; related code together; `main()` first or last, not in the middle ("main() can go at the end per convention"; "main() first is alright too").
Override: in an existing file, keep its order unless most of the file is changing; an order with a stated rationale, such as callers before callees or the file's existing grouping, can stay ("OK, sounds good!").
Names: Reading Order, Cohesion Order, Conceptual Affinity.

## `import-style`

Write imports at module scope ("There should be no imports that are inside functions!") and as the codebase already writes them: modules rather than their classes or functions, its aliases, absolute imports ("We don't use relative imports anywhere, and I'd rather not start now"), its sorter ("Use whatever import ordering occurs when we save in [the editor] (unless this causes churn)"); where usage varies, "just match the dominant style of the repo excluding [the project's experimental directory]".

## `weak-typing`

Annotate what inference cannot supply, including attributes that start as `None`; use `Self` rather than a quoted name ("Prefer Self to "Quotes""); drop annotations and unions that add nothing ("Is it necessary to use int | [an array type alias]?").
Narrow a type rather than suppress the error or add it to the type checker's baseline, and confine any suppression to the smallest scope.
Override: no typing machinery the code does not need ("I don't want it to get too complex. Let's make the simple ones"); a loose `Callable` or `dict[str, Any]` can stay where a `Protocol` or `TypedDict` would be the only precise alternative.
