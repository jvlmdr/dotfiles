---
name: whoever-smelt-it
description: Find what needs tidying: what makes code uglier than it needs to be. Use only when explicitly invoked.
disable-model-invocation: true
---

# Whoever Smelt It

Find what needs tidying, including but not limited to the smells below, in the sense of Beck's tidyings, Fowler's code smells and Ousterhout's red flags.
Report each finding with what triage needs, by default:
- **where:** file and line;
- **smell:** a slug from the list below, or your own;
- **kind:** readability, risk, bug, etc.;
- **severity:** minor, moderate, major, etc.;
- **worth fixing:** whether a fix would be easy and leave the code better: the code may be justified, and a fix may smell worse.

Smells:
- `churn`: unneeded or unrelated changes in a diff;
- `obscuring-helper`: a helper no clearer than the code it replaces, or that hides what the call site needs to know;
- `mixed-levels`: a function that mixes levels of abstraction;
- `name-clutter`: a class, enum or other definition that adds mental load for little value;
- `needless-complexity`: code that is unidiomatic or more complex than its language or library calls for, or that reimplements what the library already does more clearly;
- `defensive-code`: a check or guard against a case that cannot occur, which tells the reader it can;
- `speculative-generality`: parameters, types or cases the code's uses do not need;
- `nonobvious-correctness`: code whose correctness is not evident on reading, such as a condition stated indirectly or a subtle effect it relies on;
- `long-condition`: an `if`, `elif` or `while` condition that spans several lines;
- `two-sources-of-truth`: a decision, value, rule or procedure stated in more than one place where its copies must stay consistent;
- `two-knobs`: a setting with more than one control, such as a parameter, flag or config field that duplicates another or an environment variable;
- `silent-failure`: an error the code would let pass unnoticed;
- `caller-obligation`: something every caller or code path must remember that the structure could guarantee instead;
- `opaque-value`: a value the reader must decode, or ordinary Python data read by position where names would say what each part is;
- `sprawl`: code spread over more lines than it needs, or that reads awkwardly as the formatter prints it;
- `missing-docstring`, `poor-docstring`, `missing-comment`, `poor-comment`: docstrings are for users and comments are for maintainers; documentation missing where its reader needs it, or that does not plainly tell them what the code alone cannot;
- `slogan`, `aphorism`, `allusion`, `figure-of-speech`: in a docstring or comment, where a plain technical statement belongs;
- `code-order`: an order that buries what matters most, makes the reader jump around, or is unidiomatic for the language;
- `import-style`: a form the codebase does not use, such as a class or function imported where it imports the module;
- `weak-typing`: a missing (where inference cannot supply it) or needlessly loose type annotation, or a suppression wider than it needs.
