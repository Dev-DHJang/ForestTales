#!/bin/sh
set -eu

ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT"

fail() {
  echo "verify-harness: FAIL: $*" >&2
  exit 1
}

check_file() {
  [ -f "$1" ] || fail "missing file: $1"
}

for path in \
  AGENTS.md \
  README.md \
  docs/01_product_vision.md \
  docs/02_game_design.md \
  docs/03_features_and_ux.md \
  docs/04_technical_architecture.md \
  docs/05_content_art_audio.md \
  docs/06_roadmap_and_acceptance.md \
  docs/07_ai_development_guide.md \
  docs/DECISIONS.md \
  docs/harness/forest-tales/team-spec.md \
  _workspace/harness-bootstrap/00_request.md \
  _workspace/harness-bootstrap/02_orchestrator.md \
  _workspace/harness-bootstrap/03_qa_r01.md \
  _workspace/harness-bootstrap/04_closeout.md
do
  check_file "$path"
done

ROLES="orchestrator product combat ui 2d-animation image-design audio mobile contracts multiplayer network qa version-control"
count=0
for role in $ROLES
do
  skill_dir=".agents/skills/forest-tales-$role"
  skill="$skill_dir/SKILL.md"
  check_file "$skill"
  count=$((count + 1))

  [ "$(sed -n '1p' "$skill")" = "---" ] ||
    fail "frontmatter must start on line 1: $skill"
  [ "$(sed -n '4p' "$skill")" = "---" ] ||
    fail "frontmatter must close on line 4: $skill"

  expected="forest-tales-$role"
  actual=$(sed -n 's/^name: //p' "$skill")
  [ "$actual" = "$expected" ] ||
    fail "skill name mismatch: expected $expected, got $actual"
  grep -q '^description: .\+' "$skill" ||
    fail "missing description: $skill"

  for heading in "## 사용 시점" "## 필수 입력" "## 작업 흐름" "## 산출물과 검증"
  do
    grep -qF "$heading" "$skill" ||
      fail "missing section '$heading': $skill"
  done

  grep -qF "$expected" docs/harness/forest-tales/team-spec.md ||
    fail "team spec does not list $expected"
done

[ "$count" -eq 13 ] || fail "expected 13 skills, checked $count"
actual_count=$(find .agents/skills -name SKILL.md -type f | wc -l | tr -d ' ')
[ "$actual_count" -eq 13 ] ||
  fail "unexpected role skill count: $actual_count"

for artifact in "00_request.md" "01_contract.md" "02_<role>.md" "03_qa_rNN.md" "02_version-control.md" "04_closeout.md"
do
  grep -qF "$artifact" docs/harness/forest-tales/team-spec.md ||
    fail "workspace contract missing $artifact"
done

for state in pass fix redo blocked
do
  grep -q "$state" docs/harness/forest-tales/team-spec.md ||
    fail "team spec missing QA state: $state"
done

grep -q 'Phase 7 이전 온라인 구현 요청' docs/harness/forest-tales/team-spec.md ||
  fail "team spec missing pre-Phase-7 online gate"
grep -q 'accepted 네트워크 ADR 전에는 사용하지 않는다' \
  .agents/skills/forest-tales-multiplayer/SKILL.md ||
  fail "multiplayer skill missing approval gate"
grep -q '온라인 계약은 Phase 7과 accepted 네트워크 ADR 전 확정하지 않는다' \
  .agents/skills/forest-tales-contracts/SKILL.md ||
  fail "contracts skill missing online gate"

forbidden='2\.5D|Node3D|CharacterBody3D|Area3D|CollisionShape3D|GLB|glTF|Z-plane|Z 평면|3D 모델링'
if grep -REn "$forbidden" AGENTS.md README.md docs .agents/skills
then
  fail "legacy rendering terms found"
fi

echo "verify-harness: PASS"
echo "- required root and product documents"
echo "- 13 role skills and frontmatter"
echo "- team routing, workspace evidence, QA states, and online gate"
echo "- legacy rendering term scan"
