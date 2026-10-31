# AGENTS.md

Living rules for agents in this repo. After every correction from the human, add the durable lesson under [Lessons](#lessons). Do not delete old lessons.

## Purpose

Personal tool for Aaron Chan (@aaronchamp): extract alpha from X bookmarks, turn it into a playbook, and automate the parts that are safe to automate.

## Conventions

- Prefer read-only X API changes. Reads and analysis are the default.
- Never delete bookmarks.
- Never unlike posts.
- Never file bookmarks into folders without explicit approval. Filing reorders the main bookmark list.
- Do not invent or commit X API credentials, tokens, or other secrets.

## Stack

Unknown until app code lands. Keep this short and update it when a choice is real.

- Language: TBD
- Runtime: TBD
- X API client: TBD
- Storage: TBD

## Before coding

No implementation until a PRD exists for that feature. Copy [docs/PRD_TEMPLATE.md](docs/PRD_TEMPLATE.md) and follow [docs/WORKFLOW.md](docs/WORKFLOW.md).

## Verify

Agents must run `bash scripts/verify.sh` before claiming done. The command checks that the hygiene docs exist, that required sections are present, and that relative markdown links in those docs resolve. It must exit 0.

## Lessons

Durable corrections from the human. Add a dated bullet; leave prior bullets in place.

- (none yet)
