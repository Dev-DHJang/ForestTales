#!/bin/sh
set -eu

godot --headless --path . --editor --quit
godot --headless --path . --script res://tests/phase0_smoke.gd
godot --headless --path . --script res://tests/character_data_contract.gd
godot --headless --path . --script res://tests/character_appearance_contract.gd
godot --headless --path . --script res://tests/character_motion_contract.gd
godot --headless --path . --script res://tests/character_attack_motion_contract.gd
godot --headless --path . --script res://tests/combat_concept_contract.gd
godot --headless --path . --script res://tests/ui_design_contract.gd
./scripts/verify-harness.sh

echo "Forest Arena Phase 0 verification passed."
