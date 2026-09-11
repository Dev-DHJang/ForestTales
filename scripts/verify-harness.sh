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
  docs/character-appearance-v01.json \
  docs/ui/non-combat-ui-v01.json \
  docs/ui/penpot-setup.md \
  tests/ui_design_contract.gd \
  assets/ui/.gdignore \
  assets/ui/asset-requirements.csv \
  .codex/config.toml.example \
  scripts/start-penpot-mcp.sh \
  docs/harness/forest-arena/team-spec.md \
  docs/harness/forest-arena/operating-index.md \
  _workspace/harness-bootstrap/00_request.md \
  _workspace/harness-bootstrap/02_orchestrator.md \
  _workspace/harness-bootstrap/03_qa_r01.md \
  _workspace/harness-bootstrap/04_closeout.md \
  _workspace/forest-arena-ui-foundation/00_request.md \
  _workspace/forest-arena-ui-foundation/01_contract.md \
  _workspace/forest-arena-ui-foundation/02_orchestrator.md \
  _workspace/forest-arena-ui-foundation/02_product.md \
  _workspace/forest-arena-ui-foundation/02_ui.md \
  _workspace/forest-arena-ui-foundation/02_image.md \
  _workspace/forest-arena-ui-foundation/02_mobile.md \
  _workspace/forest-arena-ui-foundation/02_version-control.md \
  _workspace/forest-arena-ui-foundation/03_qa_r01.md \
  _workspace/forest-arena-ui-foundation/04_closeout.md
do
  check_file "$path"
done

ROLES="orchestrator product combat ui godot-ui godot-resources 2d-animation character-design character-motion image-design audio mobile contracts multiplayer network qa version-control"
count=0
for role in $ROLES
do
  skill_dir=".agents/skills/forest-arena-$role"
  skill="$skill_dir/SKILL.md"
  check_file "$skill"
  count=$((count + 1))

  [ "$(sed -n '1p' "$skill")" = "---" ] ||
    fail "frontmatter must start on line 1: $skill"
  [ "$(sed -n '4p' "$skill")" = "---" ] ||
    fail "frontmatter must close on line 4: $skill"

  expected="forest-arena-$role"
  actual=$(sed -n 's/^name: //p' "$skill")
  [ "$actual" = "$expected" ] ||
    fail "skill name mismatch: expected $expected, got $actual"
  grep -q '^description: .\+' "$skill" ||
    fail "missing description: $skill"

  case "$role" in
    godot-ui|godot-resources)
      grep -qF 'docs/forest_arena/GODOT_SETUP.md' "$skill" ||
        fail "Godot skill missing setup reference: $skill"
      grep -qF 'ForestArenaResources' "$skill" ||
        fail "Godot skill missing resource Autoload reference: $skill"
      ;;
    *)
      for heading in "## 사용 시점" "## 필수 입력" "## 작업 흐름" "## 산출물과 검증"
      do
        grep -qF "$heading" "$skill" ||
          fail "missing section '$heading': $skill"
      done
      ;;
  esac

  grep -qF "$expected" docs/harness/forest-arena/team-spec.md ||
    fail "team spec does not list $expected"
done

[ "$count" -eq 17 ] || fail "expected 17 skills, checked $count"
actual_count=$(find .agents/skills -name SKILL.md -type f | wc -l | tr -d ' ')
[ "$actual_count" -eq 17 ] ||
  fail "unexpected role skill count: $actual_count"

for path in \
  docs/forest_arena/GODOT_SETUP.md \
  docs/forest_arena/RESOURCE_RULES.md \
  forest_arena/scripts/forest_arena_resource_manager.gd \
  forest_arena/data/resource_registry.json \
  forest_arena/data/quality_profiles.json \
  tools/forest_arena/verify_godot_resources.py \
  harness/forest_arena_godot/codex_apply_contract.json
do
  check_file "$path"
done

grep -qF 'ForestArenaResources="*res://forest_arena/scripts/forest_arena_resource_manager.gd"' project.godot ||
  fail "ForestArenaResources Autoload missing"
grep -qF 'forest-arena-godot-ui' docs/harness/forest-arena/team-spec.md ||
  fail "team spec missing Godot UI role"
grep -qF 'forest-arena-godot-resources' docs/harness/forest-arena/team-spec.md ||
  fail "team spec missing Godot resources role"
python3 tools/forest_arena/verify_godot_resources.py --project-root . ||
  fail "Godot resource registry verification failed"

grep -q '신규 전투 캐릭터 콘셉트' docs/harness/forest-arena/team-spec.md ||
  fail "team spec missing character-design route"
grep -q '사용자 승인 전 assets/character/ 등록 금지' docs/harness/forest-arena/team-spec.md ||
  fail "team spec missing character asset approval gate"
grep -qF '사용자의 명시적 승인 전에는 `assets/character/` 또는 그 manifest에 쓰지 않는다' \
  .agents/skills/forest-arena-character-design/SKILL.md ||
  fail "character-design skill missing approval gate"
grep -qF '외형 규칙의 우선순위와 변경' \
  .agents/skills/forest-arena-character-design/SKILL.md ||
  fail "character-design skill missing appearance precedence rules"
grep -qF '스킬의 작화 방향·프롬프트·기존 PNG·사용자 요청 중 어느 것도 이 계약의 필수·각도 한정·금지 규칙을 묵시적으로 완화하거나 대체하지 않는다' \
  .agents/skills/forest-arena-character-design/SKILL.md ||
  fail "character-design skill missing approved-appearance precedence gate"
grep -qF '사용자 승인이나 생성 모델의 결과는 시안 채택 승인일 뿐' \
  .agents/skills/forest-arena-character-design/SKILL.md ||
  fail "character-design skill conflates concept and contract approval"
for requirement in '성인 여부' '인간형/수인화 수준' '각도 한정 특징' '금지 신체 구조' '고정 의상 요소' '가변 의상 요소'
do
  grep -qF "$requirement" .agents/skills/forest-arena-character-design/references/concept-prompt-template.md ||
    fail "character-design prompt missing appearance input: $requirement"
done
grep -qF '명시적으로 허용되지 않은 귀·꼬리·모피·주둥이·동물형 손발·역관절 다리를 자동으로 추가하지 않는다' \
  .agents/skills/forest-arena-character-design/references/concept-prompt-template.md ||
  fail "character-design prompt missing explicit animal-feature gate"
for consumer in character-design character-motion image-design 2d-animation
do
  grep -qF 'docs/character-appearance-v01.json' ".agents/skills/forest-arena-$consumer/SKILL.md" ||
    fail "appearance contract consumer is missing: $consumer"
done
grep -qF '승인 캐릭터 외형 경계' docs/harness/forest-arena/team-spec.md ||
  fail "team spec missing approved appearance-contract route"
grep -qF '사용자 시안 승인만으로는 계약 변경 승인이 되지 않는다' \
  docs/harness/forest-arena/team-spec.md ||
  fail "team spec missing approved-character appearance change gate"
grep -q '캐릭터 idle·jump·run 모션' docs/harness/forest-arena/team-spec.md ||
  fail "team spec missing character-motion route"
grep -q '모션별 사용자 명시 승인 전에는 `assets/character/<character-id>/animation/runtime/` 또는 manifest에 쓰지 않는다' \
  docs/harness/forest-arena/team-spec.md ||
  fail "team spec missing character-motion approval gate"
grep -qF '승인되지 않은 모션은 런타임 파일을 생성하지 않는다' \
  .agents/skills/forest-arena-character-motion/SKILL.md ||
  fail "character-motion skill missing per-motion approval gate"
grep -qF './scripts/verify.sh' docs/harness/forest-arena/operating-index.md ||
  fail "operating index missing full verification command"
grep -qF 'character-motion-nabi' docs/harness/forest-arena/operating-index.md ||
  fail "operating index missing active workspace entry"

for artifact in "00_request.md" "01_contract.md" "02_<role>.md" "03_qa_rNN.md" "02_version-control.md" "04_closeout.md"
do
  grep -qF "$artifact" docs/harness/forest-arena/team-spec.md ||
    fail "workspace contract missing $artifact"
done

for state in pass fix redo blocked
do
  grep -q "$state" docs/harness/forest-arena/team-spec.md ||
    fail "team spec missing QA state: $state"
done

grep -q 'Phase 7 이전 온라인 구현 요청' docs/harness/forest-arena/team-spec.md ||
  fail "team spec missing pre-Phase-7 online gate"
grep -q 'accepted 네트워크 ADR 전에는 사용하지 않는다' \
  .agents/skills/forest-arena-multiplayer/SKILL.md ||
  fail "multiplayer skill missing approval gate"
grep -q '온라인 계약은 Phase 7과 accepted 네트워크 ADR 전 확정하지 않는다' \
  .agents/skills/forest-arena-contracts/SKILL.md ||
  fail "contracts skill missing online gate"

for path in \
  .agents/skills/forest-arena-ui/references/penpot-workflow.md \
  .agents/skills/forest-arena-ui/templates/penpot-master-prompt.md \
  .agents/skills/forest-arena-image-design/templates/ui-image-batch-prompt.md
do
  check_file "$path"
done

grep -q 'Penpot 비전투 UI 설계' docs/harness/forest-arena/team-spec.md ||
  fail "team spec missing Penpot UI route"
grep -qF 'product/contracts → ui/image-design → mobile/qa' docs/harness/forest-arena/team-spec.md ||
  fail "team spec missing Penpot pipeline"
grep -qF 'references/penpot-workflow.md' .agents/skills/forest-arena-ui/SKILL.md ||
  fail "UI skill missing Penpot reference"
grep -qF 'templates/penpot-master-prompt.md' .agents/skills/forest-arena-ui/SKILL.md ||
  fail "UI skill missing Penpot prompt template"
grep -qF 'templates/ui-image-batch-prompt.md' .agents/skills/forest-arena-image-design/SKILL.md ||
  fail "image-design skill missing UI batch prompt"
grep -qF 'http://localhost:4401/mcp' .codex/config.toml.example ||
  fail "Codex Penpot MCP example URL drift"
grep -qF 'npx -y @penpot/mcp@stable' scripts/start-penpot-mcp.sh ||
  fail "Penpot start command drift"
if find assets/ui -maxdepth 1 -type f \( -name '*.translation' -o -name '*.csv.import' \) | grep -q .
then
  fail "UI design CSV generated runtime translation artifacts"
fi

[ ! -d docs/harness/forest-tales ] || fail "legacy active harness path remains"
if find .agents/skills -maxdepth 1 -type d -name 'forest-tales-*' | grep -q .
then
  fail "legacy active skill path remains"
fi

legacy_pattern='ForestTales|forest-tales|com\.foresttales|ForestTales-debug'
if grep -REn "$legacy_pattern" .agents/skills docs/harness docs/ui
then
  fail "legacy active brand name remains in harness or UI contract"
fi
if grep -En "$legacy_pattern" AGENTS.md README.md project.godot export_presets.cfg \
  docs/01_product_vision.md docs/02_game_design.md docs/03_features_and_ux.md \
  docs/04_technical_architecture.md docs/05_content_art_audio.md \
  docs/06_roadmap_and_acceptance.md docs/07_ai_development_guide.md \
  docs/attack-system-v01.json scripts/export-debug-android.sh \
  scripts/verify-android-package.sh scripts/verify-android-emulator.sh scripts/verify.sh
then
  fail "legacy active brand name remains in canonical runtime files"
fi

grep -qF 'config/name="Forest Arena"' project.godot || fail "Godot display name drift"
grep -qF 'export_path="build/android/ForestArena-debug.apk"' export_presets.cfg || fail "APK export path drift"
grep -qF 'package/unique_name="com.forestarena.welllbeing"' export_presets.cfg || fail "Android package ID drift"
grep -qF 'package/name="Forest Arena"' export_presets.cfg || fail "Android package label drift"

forbidden='2\.5D|Node3D|CharacterBody3D|Area3D|CollisionShape3D|GLB|glTF|Z-plane|Z 평면|3D 모델링'
if grep -REn "$forbidden" AGENTS.md README.md docs .agents/skills
then
  fail "legacy rendering terms found"
fi

echo "verify-harness: PASS"
echo "- required root, product, and operating-index documents"
echo "- 17 role skills and frontmatter, including Godot UI and resource roles"
echo "- ForestArenaResources Autoload, resource registry, quality profiles, and package harness contract"
echo "- team routing, Penpot workflow/templates, workspace evidence, QA states, and online gate"
echo "- Forest Arena active names, Android identity, and legacy active path scan"
echo "- legacy rendering term scan"
