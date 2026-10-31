# X bookmarks

Personal repo for extracting alpha from X bookmarks, turning it into a playbook, and automating the safe parts.

Agents: read [AGENTS.md](AGENTS.md) first, then [docs/WORKFLOW.md](docs/WORKFLOW.md). Fill [docs/PRD_TEMPLATE.md](docs/PRD_TEMPLATE.md) before writing code. Before claiming done, run:

```bash
bash scripts/verify.sh
```

GitHub Actions runs that same command on every push to `main` and on every pull request ([.github/workflows/verify.yml](.github/workflows/verify.yml)).
