# Workflow

PRD-first. Do these steps in order for every feature.

1. **Read relevant code.** Search the repo for the area you will change. If that area does not exist yet, say so.
2. **Write the PRD.** Copy [PRD_TEMPLATE.md](PRD_TEMPLATE.md) and fill problem, goals, non-goals, user flow, acceptance tests, and risks. Do not start implementation until that PRD exists.
3. **Plan steps.** List the files you will touch and the order of edits. Keep the plan short.
4. **Implement.** Match existing style. Prefer read-only X API changes. Never delete bookmarks, never unlike, and never file bookmarks into folders without explicit approval.
5. **Run verify.** Agents must run `bash scripts/verify.sh` before claiming done. Fix failures before you stop.
6. **Update AGENTS.md if corrected.** If the human corrects you, add the durable lesson to [AGENTS.md](../AGENTS.md) under Lessons.

Rules that apply on every step live in [AGENTS.md](../AGENTS.md).
