class_name MatchController
extends Node

signal snapshot_changed(snapshot: Dictionary)
signal match_ended(winner_id: StringName)

@export var rules: CombatRules
@export var player: FighterController
@export var training_dummy: FighterController

var tick: int = 0
var paused: bool = false
var winner_id: StringName
var sudden_death_round: int = 0
var _queued_intents: Array[CombatIntent] = []
var _hit_counts: Dictionary = {}


func _ready() -> void:
	if player == null:
		player = get_node("../World/Player") as FighterController
	if training_dummy == null:
		training_dummy = get_node("../World/TrainingDummy") as FighterController
	reset_match()


func _physics_process(_delta: float) -> void:
	if not paused:
		step_fixed_tick()


func submit_intent(intent: CombatIntent) -> void:
	_queued_intents.append(intent)


func step_fixed_tick() -> void:
	if paused or not winner_id.is_empty():
		return
	tick += 1
	_poll_player_input()
	_process_intents()
	player.step_tick(rules, 1.0 / 60.0)
	training_dummy.step_tick(rules, 1.0 / 60.0)
	_resolve_hits()
	_resolve_ring_outs()
	snapshot_changed.emit(snapshot())


func reset_match() -> void:
	tick = 0
	paused = false
	winner_id = &""
	sudden_death_round = 0
	_queued_intents.clear()
	_hit_counts.clear()
	player.reset_for_match(rules)
	training_dummy.reset_for_match(rules)
	snapshot_changed.emit(snapshot())


func pause_match(value: bool) -> void:
	paused = value
	if value:
		_queued_intents.clear()
		player.set_direction(0)


func snapshot() -> Dictionary:
	return {"tick": tick, "paused": paused, "winner_id": winner_id, "sudden_death_round": sudden_death_round, "fighters": [player.snapshot(), training_dummy.snapshot()]}


func _poll_player_input() -> void:
	var axis := int(Input.get_axis(&"move_left", &"move_right"))
	player.set_direction(axis)
	for action: StringName in [&"jump", &"dash", &"attack_light", &"attack_heavy", &"attack_special"]:
		if Input.is_action_just_pressed(action):
			submit_intent(CombatIntent.new(tick, player.fighter_id, action, _current_direction(), CombatIntent.Edge.PRESS, CombatIntent.Context.AIR if not player.is_on_floor() else CombatIntent.Context.GROUND))


func _process_intents() -> void:
	var due: Array[CombatIntent] = []
	for intent: CombatIntent in _queued_intents:
		if intent.tick <= tick:
			due.append(intent)
	for intent: CombatIntent in due:
		_queued_intents.erase(intent)
	due.sort_custom(func(a: CombatIntent, b: CombatIntent) -> bool: return String(a.fighter_id) < String(b.fighter_id))
	for intent: CombatIntent in due:
		var fighter := _fighter_by_id(intent.fighter_id)
		if fighter != null:
			fighter.consume_intent(intent, rules)


func _resolve_hits() -> void:
	var candidates: Array[Dictionary] = []
	for source: FighterController in [player, training_dummy]:
		for target: FighterController in [player, training_dummy]:
			if source == target or source.active_attack == null or not source.get_hitbox_rect().intersects(target.get_hurtbox_rect()):
				continue
			var key := "%s:%d:%s" % [source.fighter_id, source.activation_serial, target.fighter_id]
			var count: int = _hit_counts.get(key, 0)
			if count >= source.active_attack.max_hits_per_target:
				continue
			var last_tick: int = _hit_counts.get("%s:last" % key, -999)
			if count > 0 and tick - last_tick < source.active_attack.rehit_interval_ticks:
				continue
			candidates.append({"source": source, "target": target, "attack": source.active_attack, "key": key})
	candidates.sort_custom(func(a: Dictionary, b: Dictionary) -> bool: return "%s:%s" % [a.source.fighter_id, a.target.fighter_id] < "%s:%s" % [b.source.fighter_id, b.target.fighter_id])
	var valid: Array[Dictionary] = []
	for candidate: Dictionary in candidates:
		if candidate.target.invulnerability_ticks <= 0:
			valid.append(candidate)
	for candidate: Dictionary in valid:
		var source: FighterController = candidate.source
		var target: FighterController = candidate.target
		var attack: AttackData = candidate.attack
		if target.receive_hit(source, attack, rules):
			source.register_landed_hit()
			_hit_counts[candidate.key] = int(_hit_counts.get(candidate.key, 0)) + 1
			_hit_counts["%s:last" % candidate.key] = tick


func _resolve_ring_outs() -> void:
	var ring_outs: Array[FighterController] = []
	for fighter: FighterController in [player, training_dummy]:
		var point := fighter.global_position
		if fighter.state != FighterController.State.RING_OUT and (point.x < rules.ring_left or point.x > rules.ring_right or point.y < rules.ring_top or point.y > rules.ring_bottom):
			ring_outs.append(fighter)
	if ring_outs.is_empty():
		return
	var final_simultaneous := ring_outs.size() == 2 and player.stocks == 1 and training_dummy.stocks == 1
	for fighter: FighterController in ring_outs:
		fighter.ring_out(rules)
	if final_simultaneous:
		sudden_death_round += 1
		player.begin_sudden_death(rules)
		training_dummy.begin_sudden_death(rules)
		return
	for fighter: FighterController in [player, training_dummy]:
		if fighter.stocks <= 0:
			winner_id = training_dummy.fighter_id if fighter == player else player.fighter_id
			player.state = FighterController.State.MATCH_ENDED
			training_dummy.state = FighterController.State.MATCH_ENDED
			match_ended.emit(winner_id)
			return


func _fighter_by_id(id: StringName) -> FighterController:
	if player.fighter_id == id:
		return player
	if training_dummy.fighter_id == id:
		return training_dummy
	return null


func _current_direction() -> CombatIntent.Direction:
	if Input.is_action_pressed(&"move_up"):
		return CombatIntent.Direction.UP
	if Input.is_action_pressed(&"move_down"):
		return CombatIntent.Direction.DOWN
	if Input.is_action_pressed(&"move_left"):
		return CombatIntent.Direction.LEFT
	if Input.is_action_pressed(&"move_right"):
		return CombatIntent.Direction.RIGHT
	return CombatIntent.Direction.NEUTRAL
