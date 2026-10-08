# Sources

Evidence for the names and claims in [SKILL.md](SKILL.md), for maintainers.
SKILL.md deliberately does not link here, so agents running the skill do not load it.

- Test smells and principles named in SKILL.md (Use the Front Door First, Minimize Test Overlap, Communicate Intent, Keep Test Logic out of Production Code, Overspecified Software, Fragile Test, General Fixture, Erratic Test).
  Meszaros, *xUnit Test Patterns: Refactoring Test Code*, Addison-Wesley, 2007; definitions checked against the book's companion site, [xunitpatterns.com](http://xunitpatterns.com/).
- Single Concept per Test (preferred there over "One Assert per Test").
  Martin, *Clean Code*, Prentice Hall, 2008, ch. 9.
- The original test-smell list.
  van Deursen, Moonen, van den Bergh & Kok, "Refactoring Test Code", XP 2001, pp. 92–95 (CWI report SEN-R0119).
- DAMP, not DRY; testing through public APIs.
  Winters, Manshreck & Wright (eds.), *Software Engineering at Google*, O'Reilly, 2020, ch. 12, [free online](https://abseil.io/resources/swe-book); Google Testing Blog, ["Tests Too DRY? Make Them DAMP!"](https://testing.googleblog.com/2019/12/testing-on-toilet-tests-too-dry-make.html), 2019.
- Asynchronous waiting is the most common cause of flaky tests (201 fixes in 51 projects).
  Luo, Hariri, Eloussi & Marinov, "An Empirical Analysis of Flaky Tests", FSE 2014, [doi:10.1145/2635868.2635920](https://doi.org/10.1145/2635868.2635920).
- Never use bare sleeps to wait for asynchronous results (practitioner essay, not peer reviewed).
  Fowler, "Eradicating Non-Determinism in Tests", 2011.
