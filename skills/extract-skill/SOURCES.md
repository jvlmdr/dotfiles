# Sources

Evidence for each rule in [SKILL.md](SKILL.md), for maintainers; the write-skill sources cover drafting and testing.
SKILL.md deliberately does not link here, so agents running the skill do not load it.
Most of these studies measure task success, not adherence to a person's style.

## Evidence comes from corrections

- Preferences inferred from a user's edits matched the true ones about half the time; writing them down did 4–5× better.
  Gao et al., "Aligning LLM Agents by Learning Latent Preference from User Edits" (PRELUDE/CIPHER), NeurIPS 2024, [arXiv 2404.15269](https://arxiv.org/abs/2404.15269).
- People cannot fully state their criteria before grading outputs; criteria form while grading.
  Shankar et al., "Who Validates the Validators?" (EvalGen), [arXiv 2404.12272](https://arxiv.org/abs/2404.12272).

## Collect

- Skills a model wrote for itself before attempting the task gave no gain; skills derived from experience did.
  SkillsBench, [arXiv 2602.12670](https://arxiv.org/abs/2602.12670); Wang et al., "Agent Workflow Memory", [arXiv 2409.07429](https://arxiv.org/abs/2409.07429).

## Test

- Calibrate a judge against one expert's pass/fail labels and critiques on a held-out split.
  Hamel Husain, ["Creating a LLM-as-a-Judge That Drives Business Results"](https://hamel.dev/blog/posts/llm-judge/).
