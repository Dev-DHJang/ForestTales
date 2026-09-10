extends SceneTree

const FIGHTERS := [
	"res://scenes/fighters/ja_hyun_fighter.tscn",
	"res://scenes/fighters/myo_ryung_fighter.tscn",
	"res://scenes/fighters/nabi_fighter.tscn",
]
const EXPECTED_COMBOS := {"ja-hyun": 3, "myo-ryung": 4, "nabi": 2}


func _initialize() -> void:
	var failures: PackedStringArray = []
	var ids: Dictionary = {}
	for path: String in FIGHTERS:
		var scene := load(path) as PackedScene
		var fighter := scene.instantiate() as FighterController
		root.add_child(fighter)
		await process_frame
		if ids.has(fighter.fighter_id): failures.append("duplicate fighter ID: %s" % fighter.fighter_id)
		ids[fighter.fighter_id] = true
		if fighter.character_data.character_id != fighter.fighter_id: failures.append("CharacterData mismatch: %s" % fighter.fighter_id)
		if fighter.combo_count != EXPECTED_COMBOS[String(fighter.fighter_id)]: failures.append("incorrect combo count: %s" % fighter.fighter_id)
		var seen: Dictionary = {}
		for attack: AttackData in fighter.attacks:
			if seen.has(attack.attack_id) or not attack.is_valid_definition(): failures.append("invalid attack: %s" % attack.attack_id)
			seen[attack.attack_id] = true
		for action: StringName in [&"attack_light", &"attack_light_up", &"attack_light_down", &"attack_heavy_side", &"attack_heavy_up", &"attack_heavy_down", &"attack_dash_light", &"attack_dash_heavy", &"attack_air_light", &"attack_air_heavy", &"attack_special_neutral", &"attack_special_up"]:
			if not fighter.attacks.any(func(a: AttackData) -> bool: return a.action_id == action): failures.append("missing %s for %s" % [action, fighter.fighter_id])
		fighter.queue_free()
	if ids.size() != 3: failures.append("expected exactly three fighter IDs")
	if failures.is_empty():
		print("PHASE1_COMBAT_CONTRACT: PASS")
		quit(0)
	for failure: String in failures: push_error(failure)
	quit(1)
