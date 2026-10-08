# Sources

The author's questions at PR time that each item comes from, for maintainers.
SKILL.md deliberately does not link here, so agents running the skill do not load it.

- Contents: "Why does this PR modify the notebook? Is that well justified?"; "Can we remove the .md files from this PR?"; "Look for changes where we would *not* expect them!" (churn measured against the merge base, not commit by commit).
- Losses: "Did we lose our warmup?"; "Any other significant losses in the edits? Give it to a reviewer with fresh eyes".
- Names and signatures: "Review all of the names in this future PR"; "Show me the changes to the public API facing the rest of the codebase".
- Documentation: "Wait, are the wording edits correct in light of the technical study?"; "Do we need to correct any docs?"; "This matches the RFC, right?".
- Review skills: "Before you commit, can you run a /final-review".
- Hooks and type checking: "pre-commit failed"; "We don't need to run the full basedpyright every time?".
- Tests and the full system: "Nice. Test on GPU?"; "We probably need to test the full system somehow?"; "How confident are we that it works as intended? What's involved in deploying it and using it?".
- Generated files: "Can you have a background agent open a separate PR off main that just updates the baseline?".
- Privacy: "Is there anything in there that we wouldn't want to commit?"; "Anything we don't want to push?".
- Description: "Is the PR description up to date?"; "Fact check the description"; "Is the PR misleading?"; "Can we use /write-pr again? It is supposed to avoid walls of text"; "Keep the client example and API table for sure"; "Did (should) we mention anything about VRAM? Maybe in the description?".
- Decisions: "Any last debatable decisions in this PR that we should review together?"; "Anything else contentious?"; "Are these mostly uncontroversial?".
- Before merging: "Should we rebase on main btw?"; "There is a CI failure on the current PR"; "Any other issues from the reviews?"; "Consider the true issue at its root"; "Did you update the gh pr stack?"; "should any of these be in the preceding PR in the stack?"; "close them with a one-line comment" (on superseded PRs).
