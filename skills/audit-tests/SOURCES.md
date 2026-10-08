# Sources

Evidence for the rules in [SKILL.md](SKILL.md), for maintainers.
SKILL.md deliberately does not link here, so agents running the skill do not load it.

- Black-box test design: deriving test cases from a specification or interface without reference to the implementation.
  Myers, Sandler & Badgett, *The Art of Software Testing*, 3rd ed., Wiley, 2011, ch. 4.
- Mutation testing as the check that a remaining test would catch the behavior a removed test protected.
  Jia & Harman, "An Analysis and Survey of the Development of Mutation Testing", *IEEE Transactions on Software Engineering* 37(5), 2011, [doi:10.1109/TSE.2010.62](https://doi.org/10.1109/TSE.2010.62).

Incidents from audits that shaped this skill:
- In an audit of 59 tests, "covered elsewhere" was the main reason given for deletions and was wrong twice: one test was the only check of evicting two or more models, and another cited a library test that did not cover the case. Both were caught by checking the covering test.
- Verifier agents that ran the whole suite and mutation tests took 20 to 30 minutes each; checking by reading settled the same claims.
- A verifier agent used a GPU although its brief said not to.
