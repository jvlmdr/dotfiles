# Decisions

Directives the author identified while developing this skill, in their words, for maintainers.
SKILL.md deliberately does not link here, so agents running the skill do not load it.

- **Frame it as tidying below the level of interfaces.**
  "Hmm.. is code smells the right word here..? I think code smells are usually due to poor structure, this is more like polish?" (on the first framing as a code-smell hunt; the skill now finds "what needs tidying", after Kent Beck's *Tidy First?*, while the name and "smells" for the list items were kept)
- **Treat the list as a checklist, not the limit.**
  "Btw I think we might want to write this in such a way that it also looks for other code smells? Not *just* the list?" (on a draft that only matched code against its items; the intro now says "including but not limited to")
- **Separate finding from judging.**
  "Should whether to change it be a separate step?" (when one step both found smells and ruled on them, judges dropped findings they would not change)
- **Weigh the fix as well as the code.**
  "This exposes a possible whack-a-mole pattern. A fix might create a smell" (on a fix that traded one smell for another; step 2 sketches the fix and asks whether it leaves the code better)
- **Speculate about the fix rather than rule on the code.**
  "Maybe more like speculate on whether it's easy to fix?" (on a step 2 worded as a verdict on whether the code is justified)
- **Make each finding self-contained.**
  "I'm thinking of feeding this to eat-the-elephant afterwards" (on the report format; each finding carries its location, smell, fix and verdict so it can be reviewed on its own)
- **Give each item a slug.**
  "Maybe we should give the items short-slug-name: at the start to set an example?" (on list items that findings could only cite by paraphrase)
- **Judge kind and severity separately.**
  "I just meant that you could have (type, severity) as two orthogonal judgements of a smell" (on the report format; each finding gets both)
- **Flag defensive code.**
  "Any other overly defensive code where readability should be favoured?" (on a fixed-count loop with clamped indices; in a replay test, reviewers found such checks but advised commenting them, and the item made deletion their default)
- **Docstrings are for users, comments are for maintainers.**
  "I like the division of 'docstrings are for users, comments are for maintainers'" (on merging the four documentation items into one line)
- **Keep figurative comments a separate item.**
  "That comment is dumb. It should be technical.", then "Yeah, slogan, figurative, aphorism, etc." (on an aphorism in a worker thread's shutdown path; the merged documentation line missed it in 3 of 3 runs, so slogans keep their own line and slugs)
- **Keep correctness out of the documentation line.**
  "I'm worried about including correctness here" (on whether the documentation line should check that comments are true; a judge cannot verify a claim without its evidence, so an unsupported size estimate was discarded as a case)
- **Put `main()` first or last, not in the middle.**
  "OK, I think main() first is alright too; as long as it's not in the middle?" (on an order rule that required `main()` last)
- **Leave `Any` against `object` to judgment.**
  "I haven't seen much `object` and it looks kind of ugly to me..." (on an item whose example preferred `object` over `Any`; the example was replaced, and neither form is preferred)
