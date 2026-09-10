class_name Phase1AttackLibrary
extends RefCounted

static func build_loadout(prefix: String, combo_count: int, neutral_pull: bool = false, neutral_multi_hit: bool = false) -> Array[AttackData]:
	var attacks: Array[AttackData] = []
	for combo_index: int in range(1, combo_count + 1):
		var finisher := combo_index == combo_count
		attacks.append(_make("%s-light-%02d" % [prefix, combo_index], &"attack_light", 6 if finisher else 4, 3, 12 if finisher else 7, 7.0 if finisher else 4.0, 210.0 if finisher else 120.0, 2.4 if finisher else 1.6, AttackData.LaunchMode.FORWARD, finisher, false, &"attack_light_combo_%02d" % combo_index))
	attacks.append(_make("%s-light-up" % prefix, &"attack_light_up", 5, 3, 9, 5.0, 150.0, 1.8, AttackData.LaunchMode.UP, false, false, &"attack_light_up"))
	attacks.append(_make("%s-light-down" % prefix, &"attack_light_down", 5, 3, 9, 5.0, 150.0, 1.8, AttackData.LaunchMode.DOWN, false, false, &"attack_light_down"))
	attacks.append(_make("%s-heavy-side" % prefix, &"attack_heavy_side", 10, 4, 16, 10.0, 260.0, 3.0, AttackData.LaunchMode.FORWARD, true, false, &"attack_heavy_side"))
	attacks.append(_make("%s-heavy-up" % prefix, &"attack_heavy_up", 10, 4, 16, 10.0, 260.0, 3.0, AttackData.LaunchMode.UP, true, true, &"attack_heavy_up"))
	attacks.append(_make("%s-heavy-down" % prefix, &"attack_heavy_down", 10, 4, 16, 10.0, 260.0, 3.0, AttackData.LaunchMode.DOWN, true, false, &"attack_heavy_down"))
	attacks.append(_make("%s-dash-light" % prefix, &"attack_dash_light", 5, 3, 9, 6.0, 170.0, 2.0, AttackData.LaunchMode.FORWARD, false, false, &"attack_dash_light"))
	attacks.append(_make("%s-dash-heavy" % prefix, &"attack_dash_heavy", 8, 4, 14, 10.0, 240.0, 2.8, AttackData.LaunchMode.FORWARD, true, false, &"attack_dash_heavy"))
	attacks.append(_make("%s-air-light" % prefix, &"attack_air_light", 5, 3, 9, 5.0, 150.0, 1.8, AttackData.LaunchMode.FORWARD, false, false, &"attack_air_light"))
	attacks.append(_make("%s-air-heavy" % prefix, &"attack_air_heavy", 8, 4, 14, 9.0, 230.0, 2.7, AttackData.LaunchMode.FORWARD, true, false, &"attack_air_heavy"))
	var neutral := _make("%s-special-neutral" % prefix, &"attack_special_neutral", 8, 4 if not neutral_multi_hit else 8, 16, 8.0 if not neutral_multi_hit else 3.0, 220.0 if not neutral_multi_hit else 90.0, 2.6 if not neutral_multi_hit else 1.0, AttackData.LaunchMode.TOWARD_SOURCE if neutral_pull else AttackData.LaunchMode.FORWARD, false, false, &"special_neutral")
	if neutral_multi_hit:
		neutral.max_hits_per_target = 3
		neutral.rehit_interval_ticks = 3
	attacks.append(neutral)
	var up_special := _make("%s-special-up" % prefix, &"attack_special_up", 6, 5, 18, 7.0, 190.0, 2.3, AttackData.LaunchMode.UP, false, false, &"special_up")
	up_special.self_impulse = Vector2(0.0, -440.0)
	attacks.append(up_special)
	return attacks


static func _make(id: String, action: StringName, startup: int, active: int, recovery: int, damage: float, base_knockback: float, growth: float, launch: AttackData.LaunchMode, finisher: bool, launcher: bool, visual_state: StringName) -> AttackData:
	var data := AttackData.new()
	data.attack_id = StringName(id)
	data.action_id = action
	data.startup_ticks = startup
	data.active_ticks = active
	data.recovery_ticks = recovery
	data.damage = damage
	data.base_knockback = base_knockback
	data.knockback_growth = growth
	data.launch_mode = launch
	data.is_finisher = finisher
	data.is_launcher = launcher
	data.visual_state_id = visual_state
	return data
