#!/usr/bin/env bash
# Smoke check for agent hygiene docs. No network, no dependencies.
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$root"

fail() {
  echo "verify: $*" >&2
  exit 1
}

require_file() {
  [[ -f "$1" ]] || fail "missing required file: $1"
}

require_heading() {
  local file="$1"
  local heading="$2"
  grep -q "^## ${heading}$" "$file" || fail "$file missing heading: ## ${heading}"
}

require_file AGENTS.md
require_file docs/PRD_TEMPLATE.md
require_file docs/WORKFLOW.md

require_heading AGENTS.md "Purpose"
require_heading AGENTS.md "Conventions"
require_heading AGENTS.md "Stack"
require_heading AGENTS.md "Verify"
require_heading AGENTS.md "Lessons"

require_heading docs/PRD_TEMPLATE.md "Problem"
require_heading docs/PRD_TEMPLATE.md "Goals"
require_heading docs/PRD_TEMPLATE.md "Non-goals"
require_heading docs/PRD_TEMPLATE.md "User flow"
require_heading docs/PRD_TEMPLATE.md "Acceptance tests"
require_heading docs/PRD_TEMPLATE.md "Risks"

grep -q 'docs/PRD_TEMPLATE.md' AGENTS.md || fail "AGENTS.md does not point at docs/PRD_TEMPLATE.md"
grep -q 'bash scripts/verify.sh' AGENTS.md || fail "AGENTS.md does not document: bash scripts/verify.sh"
grep -q 'No implementation until a PRD exists' docs/PRD_TEMPLATE.md \
  || fail "PRD template missing the no-implementation rule"

for step in "Read relevant code" "Write the PRD" "Plan steps" "Implement" "Run verify" "Update AGENTS.md"; do
  grep -q "$step" docs/WORKFLOW.md || fail "docs/WORKFLOW.md missing step: $step"
done

# Relative markdown links in the hygiene docs must resolve.
check_links() {
  local file="$1"
  local dir link path target
  dir="$(dirname "$file")"
  while IFS= read -r link; do
    [[ -z "$link" ]] && continue
    path="${link%%#*}"
    [[ -z "$path" ]] && continue
    case "$path" in
      http://*|https://*|mailto:*) continue ;;
    esac
    target="$dir/$path"
    [[ -e "$target" ]] || fail "$file broken link: $link"
  done < <(grep -oE '\[[^]]+\]\([^)]+\)' "$file" | sed -E 's/.*\(([^)]+)\).*/\1/' || true)
}

check_links AGENTS.md
check_links docs/PRD_TEMPLATE.md
check_links docs/WORKFLOW.md
if [[ -f README.md ]]; then
  check_links README.md
fi

echo "verify: ok"
