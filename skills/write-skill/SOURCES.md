# Sources

Evidence for each rule in [SKILL.md](SKILL.md), for maintainers.
SKILL.md deliberately does not link here, so agents running the skill do not load it.
Most of these studies measure task success, not adherence to a person's style.

## Draft

- Explain the why behind each instruction rather than adding rigid MUSTs; capitalised ALWAYS or NEVER is a yellow flag.
  Anthropic, [skill-creator](https://github.com/anthropics/skills/tree/main/skills/skill-creator).
- Assume the model already knows the domain and add only what it lacks; match specificity to fragility ("degrees of freedom"); use consistent terminology; keep reference material one level deep (progressive disclosure).
  Anthropic, [Skill authoring best practices](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices).
- State intent and its reason precisely and leave the method open, so the executor can adapt when the plan meets cases it did not foresee ("commander's intent", mission command).
  U.S. Army, [ADP 6-0, *Mission Command*](https://irp.fas.org/doddir/army/adp6_0.pdf), 2019: the commander's intent "helps subordinate and supporting commanders act to achieve the commander's desired results without further orders".
- "The purpose of abstraction is not to be vague, but to create a new semantic level in which one can be absolutely precise."
  Dijkstra, ["The Humble Programmer"](https://www.cs.utexas.edu/~EWD/transcriptions/EWD03xx/EWD340.html), 1972.
- Repository context files did not improve task success and raised cost by over 20%; agents do follow the instructions in them.
  Gloaguen et al., "Evaluating AGENTS.md", [arXiv 2602.11988](https://arxiv.org/abs/2602.11988).
- Every individually helpful rule was a prohibition and every harmful one a positive directive (Claude Code, Opus 4.6, 5,000+ runs).
  Zhang et al., "Guardrails Beat Guidance", [arXiv 2604.11088](https://arxiv.org/abs/2604.11088).
- Focused skills, at most about three active, beat comprehensive bundles.
  SkillsBench, [arXiv 2602.12670](https://arxiv.org/abs/2602.12670).
- All-rules-satisfied accuracy on code-style instructions collapses as rules are added (0.96 to 0.01 from one to six rules for Claude 3.5 Sonnet).
  Harada et al., ManyIFEval/StyleMBPP, [arXiv 2509.21051](https://arxiv.org/abs/2509.21051).
- Use a few diverse, canonical examples and avoid overfitting to the development cases.
  Anthropic, [Skill authoring best practices](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices).

## Test

- Read the transcripts, not only the outputs; generalize from feedback rather than adding fiddly, overfitted rules.
  Anthropic, [skill-creator](https://github.com/anthropics/skills/tree/main/skills/skill-creator).
- Evaluate skills in pairs, with and without the skill, under identical conditions.
  SkillsBench, [arXiv 2602.12670](https://arxiv.org/abs/2602.12670).
