extends SceneTree

const CONTRACT_PATH := "res://docs/ui/non-combat-ui-v01.json"
const ASSET_PATH := "res://assets/ui/asset-requirements.csv"
const REQUIRED_SCREEN_IDS := [
	"SCR_01_Splash", "SCR_02_Login", "SCR_03_Lobby", "SCR_04_CharacterCollection",
	"SCR_05_CharacterDetail", "SCR_06_AccessoryCollection", "SCR_07_AccessoryDetail",
	"SCR_08_Preset", "SCR_09_ModeSelect", "SCR_10_PartyLobby", "SCR_11_Matchmaking",
	"SCR_12_MatchFound", "SCR_13_CharacterSelect", "SCR_14_AccessorySelect", "SCR_15_Loading",
	"SCR_16_Victory", "SCR_17_ResultSummary", "SCR_18_MVP", "SCR_19_Shop",
	"SCR_20_Collection", "SCR_21_Mission", "SCR_22_Social", "SCR_23_Rank", "SCR_24_Profile",
]
const REQUIRED_MODES := ["Story", "Solo", "Team", "AI", "Practice"]
const REQUIRED_ASSET_HEADERS := [
	"asset_slot", "output_path", "category", "purpose", "format", "aspect", "priority",
	"status", "approval_dependency", "source_reference",
]


func _initialize() -> void:
	var failures: PackedStringArray = []
	var contract := _load_contract(failures)
	_validate_brand_and_scope(contract, failures)
	_validate_product_rules(contract, failures)
	_validate_screens(contract, failures)
	_validate_assets(failures)
	_finish(failures)


func _load_contract(failures: PackedStringArray) -> Dictionary:
	var parsed: Variant = JSON.parse_string(FileAccess.get_file_as_string(CONTRACT_PATH))
	if not (parsed is Dictionary):
		failures.append("UI design contract is not a JSON object")
		return {}
	var contract: Dictionary = parsed
	if contract.get("schema_version") != 1 or contract.get("status") != "accepted-design-contract":
		failures.append("UI design contract schema or status is invalid")
	return contract


func _validate_brand_and_scope(contract: Dictionary, failures: PackedStringArray) -> void:
	var product: Dictionary = contract.get("product", {})
	if product.get("display_name") != "Forest Arena" or product.get("logo_text") != "FOREST ARENA" or product.get("slug") != "forest-arena":
		failures.append("Forest Arena brand contract drift")
	var scope: Dictionary = contract.get("scope", {})
	if scope.get("current_phase") != 0 or scope.get("in_game_combat_hud_included") != false:
		failures.append("Phase 0 or non-combat scope drift")
	for deferred_item: String in ["godot-screen-implementation", "image-generation", "penpot-file-editing"]:
		if deferred_item not in scope.get("deferred", []):
			failures.append("missing deferred implementation gate: %s" % deferred_item)
	var resolution: Dictionary = contract.get("resolution", {})
	var penpot_size: Array = resolution.get("penpot_reference", [])
	var runtime_size: Array = resolution.get("runtime_logical", [])
	if penpot_size.size() != 2 or int(penpot_size[0]) != 1920 or int(penpot_size[1]) != 1080 \
			or runtime_size.size() != 2 or int(runtime_size[0]) != 1280 or int(runtime_size[1]) != 720:
		failures.append("Penpot or runtime resolution contract drift")


func _validate_product_rules(contract: Dictionary, failures: PackedStringArray) -> void:
	var rules: Dictionary = contract.get("rules", {})
	if rules.get("modes") != REQUIRED_MODES:
		failures.append("five-mode contract drift")
	var participants: Dictionary = rules.get("participants", {})
	var team: Dictionary = participants.get("team", {})
	if participants.get("max_total") != 8 or team.get("min_per_team") != 1 or team.get("max_per_team") != 4 or team.get("max_total") != 8:
		failures.append("participant or team-size contract drift")
	var accessories: Dictionary = rules.get("accessories", {})
	if accessories.get("rarity_or_grade") != false:
		failures.append("accessory rarity must remain disabled")
	for cue: String in ["rarity-stars", "rarity-tiers", "rarity-color-frames", "legendary-epic-labels", "loot-grades"]:
		if cue not in accessories.get("forbidden_cues", []):
			failures.append("missing forbidden accessory rarity cue: %s" % cue)
	var splash: Dictionary = rules.get("splash", {})
	if splash.get("characters_allowed") != false:
		failures.append("Splash must forbid characters")
	var missing_assets: Dictionary = rules.get("missing_assets", {})
	if missing_assets.get("placeholder_name") != "exact-IMG-slot" or missing_assets.get("visible_register") != "MISSING ASSETS":
		failures.append("missing asset placeholder contract drift")


func _validate_screens(contract: Dictionary, failures: PackedStringArray) -> void:
	var screens: Array = contract.get("screens", [])
	if screens.size() != REQUIRED_SCREEN_IDS.size():
		failures.append("expected 24 UI screens but found %d" % screens.size())
	var seen: Dictionary = {}
	for screen_value: Variant in screens:
		if not (screen_value is Dictionary):
			failures.append("screen entry is not an object")
			continue
		var screen: Dictionary = screen_value
		var screen_id := String(screen.get("id", ""))
		if screen_id.is_empty() or seen.has(screen_id):
			failures.append("missing or duplicate screen ID: %s" % screen_id)
			continue
		seen[screen_id] = screen
		if String(screen.get("runtime_gate", "")).is_empty():
			failures.append("screen is missing runtime gate: %s" % screen_id)
	for required_id: String in REQUIRED_SCREEN_IDS:
		if not seen.has(required_id):
			failures.append("required screen is missing: %s" % required_id)
	if seen.has("SCR_01_Splash"):
		var splash: Dictionary = seen["SCR_01_Splash"]
		for slot: String in splash.get("asset_slots", []):
			if slot.begins_with("IMG/char/"):
				failures.append("Splash contains a character asset slot")
		if "character-free forest" not in splash.get("requirements", []):
			failures.append("Splash character-free requirement is missing")
	if seen.has("SCR_09_ModeSelect"):
		var mode_select: Dictionary = seen["SCR_09_ModeSelect"]
		if mode_select.get("asset_slots", []).size() != 5:
			failures.append("Mode Select must expose five mode assets")
	if seen.has("SCR_10_PartyLobby"):
		var party_lobby: Dictionary = seen["SCR_10_PartyLobby"]
		if "four slots per team" not in party_lobby.get("requirements", []):
			failures.append("Party Lobby four-slot team contract is missing")


func _validate_assets(failures: PackedStringArray) -> void:
	var file := FileAccess.open(ASSET_PATH, FileAccess.READ)
	if file == null:
		failures.append("asset requirements CSV is missing")
		return
	var headers := Array(file.get_csv_line())
	if headers != REQUIRED_ASSET_HEADERS:
		failures.append("asset requirements CSV headers drift")
	var rows: Array[Dictionary] = []
	var slots: Dictionary = {}
	var paths: Dictionary = {}
	while file.get_position() < file.get_length():
		var values := file.get_csv_line()
		if values.size() == 1 and values[0].is_empty():
			continue
		if values.size() != REQUIRED_ASSET_HEADERS.size():
			failures.append("asset row has %d columns instead of %d" % [values.size(), REQUIRED_ASSET_HEADERS.size()])
			continue
		var row: Dictionary = {}
		for index: int in range(REQUIRED_ASSET_HEADERS.size()):
			row[REQUIRED_ASSET_HEADERS[index]] = values[index]
		rows.append(row)
		var slot := String(row["asset_slot"])
		var output_path := String(row["output_path"])
		if not slot.begins_with("IMG/") or slots.has(slot):
			failures.append("invalid or duplicate asset slot: %s" % slot)
		else:
			slots[slot] = row
		if not output_path.begins_with("assets/ui/generated/") or paths.has(output_path):
			failures.append("invalid or duplicate asset output path: %s" % output_path)
		else:
			paths[output_path] = true
	if rows.size() != 61:
		failures.append("expected 61 asset requirements but found %d" % rows.size())
	_validate_character_asset(slots, "IMG/char/mouse/full", "approved-character-ja-hyun", "assets/character/ja-hyun/concept/ja-hyun-concept-v01.png", failures)
	_validate_character_asset(slots, "IMG/char/rabbit/full", "approved-character-myo-ryung", "assets/character/myo-ryung/concept/myo-ryung-concept-v01.png", failures)
	_validate_character_asset(slots, "IMG/char/roster/cat", "approved-character-nabi", "assets/character/nabi/concept/nabi-concept-v01.png", failures)
	for blocked_slot: String in ["IMG/char/roster/fox", "IMG/char/roster/wolf", "IMG/char/roster/deer", "IMG/char/roster/raccoon", "IMG/char/roster/extra-01"]:
		if not slots.has(blocked_slot):
			failures.append("missing approval-gated roster slot: %s" % blocked_slot)
			continue
		var row: Dictionary = slots[blocked_slot]
		if row.get("status") != "blocked" or row.get("approval_dependency") != "character-approval-required":
			failures.append("roster slot is not blocked on character approval: %s" % blocked_slot)
	for row_value: Variant in rows:
		var row: Dictionary = row_value
		if row.get("category") == "accessory" and row.get("approval_dependency") != "no-rarity-required":
			failures.append("accessory asset lacks no-rarity dependency: %s" % row.get("asset_slot"))
	if slots.has("IMG/bg/splash"):
		var splash_row: Dictionary = slots["IMG/bg/splash"]
		if splash_row.get("approval_dependency") != "no-character-required":
			failures.append("Splash asset must require no characters")


func _validate_character_asset(slots: Dictionary, slot: String, dependency: String, source: String, failures: PackedStringArray) -> void:
	if not slots.has(slot):
		failures.append("missing approved character mapping: %s" % slot)
		return
	var row: Dictionary = slots[slot]
	if row.get("approval_dependency") != dependency or row.get("source_reference") != source:
		failures.append("approved character mapping drift: %s" % slot)


func _finish(failures: PackedStringArray) -> void:
	if failures.is_empty():
		print("UI_DESIGN_CONTRACT: PASS")
		quit(0)
		return
	for failure: String in failures:
		push_error(failure)
	print("UI_DESIGN_CONTRACT: FAIL (%d)" % failures.size())
	quit(1)
