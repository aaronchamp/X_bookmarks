# PRD: Verify on GitHub Actions

Copy of [PRD_TEMPLATE.md](../PRD_TEMPLATE.md) for the CI check. No implementation of this feature until this file exists.

## Problem

Hygiene checks only run when an agent remembers to execute `bash scripts/verify.sh` locally. A push to `main` or a pull request can merge broken links or missing required headings with nothing failing in GitHub.

## Goals

- Run `bash scripts/verify.sh` on every push to `main`.
- Run `bash scripts/verify.sh` on every pull request.
- Keep the workflow minimal: `ubuntu-latest`, checkout, then the script.

## Non-goals

- Application code, X API calls, or extra CI jobs.
- Changing what `scripts/verify.sh` checks.
- Caching, matrices, secrets, deploy, or release automation.

## User flow

1. Someone pushes to `main` or opens or updates a pull request.
2. GitHub Actions starts the verify workflow on `ubuntu-latest`.
3. The job checks out the repo and runs `bash scripts/verify.sh`.
4. The check fails when the script exits non-zero, and passes when the script prints `verify: ok`.

## Acceptance tests

- [ ] `.github/workflows/verify.yml` exists.
- [ ] The workflow triggers on push to `main` and on `pull_request`.
- [ ] The job uses `ubuntu-latest`, checks out the repo, and runs `bash scripts/verify.sh`.
- [ ] `README.md` mentions that CI runs this check, and any new relative link resolves.
- [ ] `bash scripts/verify.sh` exits 0 in the repo after the change.
- [ ] The workflow file contains no credentials or tokens.

## Risks

- A typo in the workflow YAML fails the check until the file is fixed. The job has no other steps that could hide that failure.
- `actions/checkout` is pinned to the `v4` major tag. A later major is out of scope for this change.
- The script does not use the network or secrets, so pull requests from forks run the same local check.
