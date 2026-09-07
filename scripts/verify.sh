#!/bin/sh
set -eu

godot --headless --path . --editor --quit
godot --headless --path . --script res://tests/phase0_smoke.gd
./scripts/verify-harness.sh

echo "ForestTales Phase 0 verification passed."
