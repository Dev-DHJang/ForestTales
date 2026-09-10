class_name FighterController
extends CharacterBody2D

## Deterministic, data-driven Phase 1 fighter. Drawing is intentionally
## separate from this controller: neither visual state nor animation affects a
## hit, knockback, or match result.
enum State { SPAWNING, IDLE, RUN, JUMP, FALL, DASH, ATTACK_STARTUP, ATTACK_ACTIVE, ATTACK_RECOVERY, HITSTUN, KNOCKBACK, RING_OUT, MATCH_ENDED }

@export var fighter_id: StringName
@export var character_data: CharacterData
@export var attacks: Array[AttackData] = []
@export_range(1, 4, 1) var combo_count: int = 2
@export var neutral_special_pulls: bool = false
@export var neutral_special_multi_hit: bool = false
@export var controlled_by_input: bool = false

var state: State = State.SPAWNING
var damage_percent: float = 0.0
var stocks: int = 3
var facing: int = 1
var spawn_position: Vector2
var air_jumps_remaining: int = 0
var aerial_attacks_remaining: int = 2
var up_special_available: bool = true
var invulnerability_ticks: int = 0
var respawn_ticks: int = 0
var hitstun_ticks: int = 0
var dash_ticks: int = 0
var horizontal_axis: int = 0
var active_attack: AttackData
var attack_phase_tick: int = 0
var attack_landed: bool = false
var combo_index: int = 0
var buffered_attack_id: StringName
var activation_serial: int = 0
var diagnostic: String = ""

var _gravity_velocity: float = 0.0


func _ready() -> void:
	spawn_position = global_position
	if attacks.is_empty():
		attacks = Phase1AttackLibrary.build_loadout(String(fighter_id), combo_count, neutral_special_pulls, neutral_special_multi_hit)
	air_jumps_remaining = _stats().air_jump_count
	state = State.IDLE
	queue_redraw()


func reset_for_match(rules: CombatRules) -> void:
	damage_percent = 0.0
	stocks = rules.stocks_per_fighter
	global_position = spawn_position
	velocity = Vector2.ZERO
	_gravity_velocity = 0.0
	active_attack = null
	buffered_attack_id = &""
	combo_index = 0
	air_jumps_remaining = _stats().air_jump_count
	aerial_attacks_remaining = 2
	up_special_available = true
	invulnerability_ticks = 0
	respawn_ticks = 0
	hitstun_ticks = 0
	state = State.IDLE


func set_direction(axis: int) -> void:
	horizontal_axis = clampi(axis, -1, 1)
	if horizontal_axis != 0 and state not in [State.HITSTUN, State.KNOCKBACK, State.RING_OUT]:
		facing = horizontal_axis


func consume_intent(intent: CombatIntent, rules: CombatRules) -> void:
	if intent.edge != CombatIntent.Edge.PRESS or state in [State.SPAWNING, State.RING_OUT, State.MATCH_ENDED, State.HITSTUN, State.KNOCKBACK]:
		return
	if intent.action_id == &"jump":
		_try_jump()
		return
	if intent.action_id == &"dash":
		_try_dash()
		return
	if intent.action_id not in [&"attack_light", &"attack_heavy", &"attack_special"]:
		return
	var next := _select_attack(intent.action_id, intent.direction)
	if next == null:
		return
	if active_attack != null:
		if state == State.ATTACK_RECOVERY and attack_phase_tick >= active_attack.recovery_ticks - rules.combo_window and not active_attack.is_finisher and buffered_attack_id.is_empty():
			if intent.action_id == &"attack_light" or attack_landed:
				buffered_attack_id = next.attack_id
		return
	_start_attack(next)


func step_tick(rules: CombatRules, delta: float) -> void:
	diagnostic = ""
	if invulnerability_ticks > 0:
		invulnerability_ticks -= 1
	if state == State.RING_OUT:
		respawn_ticks -= 1
		if respawn_ticks <= 0:
			_respawn(rules)
		queue_redraw()
		return
	if state in [State.HITSTUN, State.KNOCKBACK]:
		hitstun_ticks -= 1
		if hitstun_ticks <= 0:
			state = State.FALL if not is_on_floor() else State.IDLE
		_apply_motion(rules, delta, false)
		queue_redraw()
		return
	if active_attack != null:
		_advance_attack(rules)
	else:
		_apply_motion(rules, delta, true)
	queue_redraw()


func get_hitbox_rect() -> Rect2:
	if state != State.ATTACK_ACTIVE or active_attack == null:
		return Rect2()
	var offset := active_attack.hitbox_offset
	if active_attack.launch_mode == AttackData.LaunchMode.UP:
		offset = Vector2(0, -86)
	elif active_attack.launch_mode == AttackData.LaunchMode.DOWN:
		offset = Vector2(0, 20)
	else:
		offset.x *= facing
	return Rect2(global_position + offset - active_attack.hitbox_size * 0.5, active_attack.hitbox_size)


func get_hurtbox_rect() -> Rect2:
	return Rect2(global_position + Vector2(-27, -82), Vector2(54, 96))


func register_landed_hit() -> void:
	attack_landed = true
	if active_attack != null and active_attack.is_launcher:
		# The launcher's permission is consumed by the next jump in the same air time.
		air_jumps_remaining = maxi(air_jumps_remaining, 1)


func receive_hit(source: FighterController, attack: AttackData, rules: CombatRules) -> bool:
	if invulnerability_ticks > 0 or state == State.RING_OUT:
		return false
	damage_percent += attack.damage
	var speed := (attack.base_knockback + damage_percent * attack.knockback_growth) / _stats().weight
	var launch := _launch_vector(source, attack) * speed
	velocity = launch
	_gravity_velocity = velocity.y
	hitstun_ticks = clampi(roundi(speed / 20.0), rules.hitstun_min_ticks, rules.hitstun_max_ticks)
	active_attack = null
	buffered_attack_id = &""
	air_jumps_remaining = 0
	aerial_attacks_remaining = 2
	up_special_available = true
	state = State.KNOCKBACK
	return true


func ring_out(rules: CombatRules) -> bool:
	if state == State.RING_OUT:
		return false
	stocks -= 1
	damage_percent = 0.0
	velocity = Vector2.ZERO
	active_attack = null
	buffered_attack_id = &""
	combo_index = 0
	horizontal_axis = 0
	respawn_ticks = rules.respawn_delay_ticks
	state = State.RING_OUT
	return true


func begin_sudden_death(rules: CombatRules) -> void:
	stocks = 1
	damage_percent = 0.0
	global_position = spawn_position
	velocity = Vector2.ZERO
	respawn_ticks = rules.respawn_delay_ticks
	state = State.RING_OUT


func snapshot() -> Dictionary:
	return {"id": String(fighter_id), "state": State.keys()[state], "damage_percent": damage_percent, "stocks": stocks, "position": global_position, "invulnerable": invulnerability_ticks > 0}


func _try_jump() -> void:
	if active_attack != null or state == State.DASH:
		return
	if is_on_floor():
		velocity.y = -_stats().jump_velocity
		_gravity_velocity = velocity.y
		state = State.JUMP
	elif air_jumps_remaining > 0:
		air_jumps_remaining -= 1
		velocity.y = -_stats().jump_velocity
		_gravity_velocity = velocity.y
		state = State.JUMP


func _try_dash() -> void:
	if active_attack != null or not is_on_floor():
		return
	var dash_direction := horizontal_axis if horizontal_axis != 0 else facing
	facing = dash_direction
	velocity.x = _stats().dash_speed * dash_direction
	dash_ticks = roundi(_stats().dash_duration_seconds * 60.0)
	state = State.DASH


func _select_attack(action: StringName, direction: CombatIntent.Direction) -> AttackData:
	var in_air := not is_on_floor()
	if in_air and action != &"attack_special" and aerial_attacks_remaining <= 0:
		return null
	var action_id := action
	if action == &"attack_light":
		if in_air:
			action_id = &"attack_air_light"
		elif state == State.DASH:
			action_id = &"attack_dash_light"
		elif direction == CombatIntent.Direction.UP:
			action_id = &"attack_light_up"
		elif direction == CombatIntent.Direction.DOWN:
			action_id = &"attack_light_down"
		elif direction == CombatIntent.Direction.LEFT or direction == CombatIntent.Direction.RIGHT:
			action_id = &"attack_light" # directional light maps to the neutral chain in Phase 1.
		elif combo_index > 0:
			action_id = &"attack_light"
	elif action == &"attack_heavy":
		if in_air:
			action_id = &"attack_air_heavy"
		elif state == State.DASH:
			action_id = &"attack_dash_heavy"
		elif direction == CombatIntent.Direction.UP:
			action_id = &"attack_heavy_up"
		elif direction == CombatIntent.Direction.DOWN:
			action_id = &"attack_heavy_down"
		else:
			action_id = &"attack_heavy_side"
	elif action == &"attack_special":
		if direction == CombatIntent.Direction.UP:
			if not up_special_available:
				return null
			action_id = &"attack_special_up"
		elif direction == CombatIntent.Direction.LEFT or direction == CombatIntent.Direction.RIGHT or direction == CombatIntent.Direction.DOWN:
			diagnostic = "Phase 1 no-op special direction; deferred to Phase 3"
			return null
		else:
			action_id = &"attack_special_neutral"
	for candidate: AttackData in attacks:
		if candidate.action_id == action_id:
			if action_id == &"attack_light":
				var target_combo := clampi(combo_index + 1, 1, combo_count)
				if String(candidate.attack_id).ends_with("%02d" % target_combo):
					return candidate
			elif action_id != &"attack_light":
				return candidate
	return null


func _start_attack(next: AttackData) -> void:
	active_attack = next
	activation_serial += 1
	attack_phase_tick = 0
	attack_landed = false
	if next.action_id == &"attack_light":
		combo_index = mini(combo_index + 1, combo_count)
	else:
		combo_index = 0
	if not is_on_floor() and next.action_id in [&"attack_air_light", &"attack_air_heavy"]:
		aerial_attacks_remaining -= 1
	if next.action_id == &"attack_special_up":
		up_special_available = false
		velocity += next.self_impulse
	state = State.ATTACK_STARTUP


func _advance_attack(rules: CombatRules) -> void:
	attack_phase_tick += 1
	if state == State.ATTACK_STARTUP and attack_phase_tick >= active_attack.startup_ticks:
		state = State.ATTACK_ACTIVE
		attack_phase_tick = 0
	elif state == State.ATTACK_ACTIVE and attack_phase_tick >= active_attack.active_ticks:
		state = State.ATTACK_RECOVERY
		attack_phase_tick = 0
	elif state == State.ATTACK_RECOVERY and attack_phase_tick >= active_attack.recovery_ticks:
		var queued := _attack_by_id(buffered_attack_id)
		active_attack = null
		buffered_attack_id = &""
		if queued != null:
			_start_attack(queued)
		else:
			combo_index = 0
			state = State.IDLE if is_on_floor() else State.FALL


func _apply_motion(rules: CombatRules, delta: float, accept_input: bool) -> void:
	if not is_on_floor():
		velocity.y = minf(velocity.y + _stats().gravity * delta, rules.max_fall_speed)
		state = State.FALL if state not in [State.JUMP, State.DASH] else state
	else:
		aerial_attacks_remaining = 2
		up_special_available = true
		air_jumps_remaining = _stats().air_jump_count
		if state == State.FALL:
			state = State.IDLE
	if state == State.DASH:
		dash_ticks -= 1
		if dash_ticks <= 0:
			state = State.IDLE
	elif accept_input:
		var desired := float(horizontal_axis) * (_stats().ground_speed if is_on_floor() else _stats().air_speed)
		var accel := rules.ground_acceleration if is_on_floor() else rules.air_acceleration
		if horizontal_axis == 0 and is_on_floor():
			accel = rules.ground_deceleration
		velocity.x = move_toward(velocity.x, desired, accel * delta)
		if is_on_floor():
			state = State.RUN if horizontal_axis != 0 else State.IDLE
	move_and_slide()


func _respawn(rules: CombatRules) -> void:
	global_position = spawn_position
	velocity = Vector2.ZERO
	invulnerability_ticks = rules.respawn_invulnerability_ticks
	air_jumps_remaining = _stats().air_jump_count
	aerial_attacks_remaining = 2
	up_special_available = true
	state = State.IDLE


func _launch_vector(source: FighterController, attack: AttackData) -> Vector2:
	match attack.launch_mode:
		AttackData.LaunchMode.UP:
			return Vector2(0.25 * source.facing, -1.0).normalized()
		AttackData.LaunchMode.DOWN:
			return Vector2(0.25 * source.facing, 1.0).normalized()
		AttackData.LaunchMode.TOWARD_SOURCE:
			return (source.global_position - global_position).normalized()
		_:
			return Vector2(source.facing, -0.18).normalized()


func _attack_by_id(id: StringName) -> AttackData:
	if id.is_empty():
		return null
	for candidate: AttackData in attacks:
		if candidate.attack_id == id:
			return candidate
	return null


func _stats() -> CharacterStats:
	return character_data.base_stats


func _draw() -> void:
	var color := Color("43c782") if fighter_id == &"ja-hyun" else Color("f08a55")
	if invulnerability_ticks > 0 and invulnerability_ticks % 6 < 3:
		color = Color.WHITE
	if state in [State.HITSTUN, State.KNOCKBACK]:
		color = Color("ffdf5a")
	draw_rect(Rect2(-27, -82, 54, 96), color, true)
	draw_rect(Rect2(-27, -82, 54, 96), Color("122033"), false, 3.0)
	draw_string(ThemeDB.fallback_font, Vector2(-22, -42), String(fighter_id).left(3).to_upper(), HORIZONTAL_ALIGNMENT_LEFT, 48, 13, Color.WHITE)
	if state == State.ATTACK_ACTIVE:
		var rect := get_hitbox_rect()
		draw_rect(Rect2(to_local(rect.position), rect.size), Color(1, 0.25, 0.25, 0.25), true)
		draw_rect(Rect2(to_local(rect.position), rect.size), Color("ff5364"), false, 2.0)
