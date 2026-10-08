# Decisions

Directives the author identified while developing this skill, in their words, for maintainers.
SKILL.md deliberately does not link here, so agents running the skill do not load it.

- **The why, not the what.**
  "The key thing that I wanted to include in skill writing: the why not the what." (recalled while reviewing an early draft of this skill)
- **Not prescriptive.**
  "Another rule: not to be too *prescriptive*. Hard thresholds, specific templates, etc. We want to give the agent using the skill the latitude that they need to decide how to structure things." (after a draft proposed a fixed message template)
  "I don't want the recipe but I do want to catch those ones" (on a checklist item that needed to catch awkwardly formatted code; the item names the problem and its principle, not the rewrite)
  "'note the item it matches' is too restrictive (there may be other smells), same for the list of kinds" (on a report template; it became a sensible default to adapt, with open-ended fields)
- **Look for existing paradigms, frameworks and names.**
  "Maybe something like identify existing paradigms and language?" (while reviewing an early draft of this skill)
  A habit of the author's research phases: find the existing names and frameworks for an idea before describing it from scratch, and keep looking when the first answer is shallow.
  "Can you launch a sonnet agent/s to look up what this principle is called ... It's not just something basic like 'topic sentences' ... There must be terms for these concepts in the study of writing", then "Launch an opus agent to take a deeper look. That doesn't capture it." (on the principle that a reader should always see why each step is there)
  Names earn their place only when an agent reading them would act on them: "it feels like we're mixing good things, code smells, and refactor methods" (on the names gathered for each item of a checklist skill).
  Also "Is there a name for this?" (on skill wording that is precise but general), "Is this the canonical name in the literature??" (on a proposed name for a regularizer) and "Has this effect been observed? Does it have a name?" (on agents' output growing with the number of subagents).
- **Use names, not paraphrases.**
  "And maybe something about using the names not paraphrasing the ideas in the current context (when writing skills)?" (added while revising the previous rule)
- **Short, precise, general, with clear motivation.**
  "I feel like they need to be short, precise language, general terms, clear motivation" (asking for research on how to write skills that capture a session's mood); "vague but precise ... Precise language but broad terms/principles?" (asking whether guidelines for writing skills exist).
  "I don't want to be overly specific, I'd rather find the min-desc-len [skill] that captures it" (after a skill extracted from a triage session lost that session's focus); "Too much of this is specific to PRs." (on a draft whose wording came from pull-request triage)
- **Nothing inferred.**
  "I want you to be ruthless in editing this SKILL.md. Nothing inferred." (editing a skill drafted from a session transcript)
  "I don't remember saying that." (about a line the drafting agent had added)
- **Summarize linked material; don't just link it or reduce it to directives.**
  "We should neither (a) keep motivation.md as a pure link, nor (b) summarize a few concrete directives from it. We should give a high-level summary of the motivation with a link? Keeping the why and/or the critical strategy-names/paradigms?" (on how a skill should refer to its research file)
- **Store research rather than redo it.**
  "It sounds inefficient to do the research every time?" (on a draft that had the agent research how to motivate the user afresh in every session)
- **Words license actions.**
  "The 'verify' word previously led to an experiment on tests running thousands of tests and slowing to a halt." (on a draft that asked subagents to check each claim)
- **Ask what a line is trying to say.**
  "What are we trying to say?" (asked of each proposed line while reviewing this skill; it cut lines an agent would follow anyway, and replaced a tool-specific rule with the general one behind it)
- **Apply the guidelines to the skill itself.**
  "Can we apply our own skill guidelines [in] writing this skill?" (a review then found the skill described paradigms instead of naming them, and gave few reasons)
- **Unambiguous skill names.**
  "Do you think 'writing-skills' is too ambiguous? Could be read multiple ways?" (on this skill's first name, which also reads as "skill at writing")
- **Record the author's directives.**
  "I wonder if we should document my specific concerns/directives alongside these skills so that we have a durable point of reference for things that I thought of" (after several skills had been shaped by directives that lived only in the session); then "I don't want every decision, just the specific things that I identified"
- **A skill must work without its references.**
  "I think we can't guarantee that the references will be checked" (on a checklist item whose meaning depended on its REFERENCE.md section; every line in SKILL.md must do its job alone)
