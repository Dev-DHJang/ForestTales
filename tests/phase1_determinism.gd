extends SceneTree


func _initialize() -> void:
	var first := await _simulate()
	var second := await _simulate()
	if first != second:
		print("FIRST ", first)
		print("SECOND ", second)
		push_error("same initial snapshot and intent stream produced different hashes")
		quit(1)
	else:
		print("PHASE1_DETERMINISM: PASS %s" % first)
		quit(0)


func _simulate() -> String:
	var instance := (load("res://scenes/main.tscn") as PackedScene).instantiate()
	root.add_child(instance)
	await physics_frame
	await physics_frame
	var controller := instance.get_node("MatchController") as MatchController
	controller.set_physics_process(false)
	controller.reset_match()
	var stream := [
		CombatIntent.new(1, &"ja-hyun", &"move", CombatIntent.Direction.RIGHT, CombatIntent.Edge.PRESS, CombatIntent.Context.GROUND),
		CombatIntent.new(8, &"ja-hyun", &"dash", CombatIntent.Direction.RIGHT, CombatIntent.Edge.PRESS, CombatIntent.Context.GROUND),
		CombatIntent.new(10, &"ja-hyun", &"attack_light", CombatIntent.Direction.RIGHT, CombatIntent.Edge.PRESS, CombatIntent.Context.GROUND),
		CombatIntent.new(20, &"myo-ryung", &"attack_heavy", CombatIntent.Direction.LEFT, CombatIntent.Edge.PRESS, CombatIntent.Context.GROUND),
		CombatIntent.new(24, &"ja-hyun", &"move", CombatIntent.Direction.RIGHT, CombatIntent.Edge.RELEASE, CombatIntent.Context.GROUND),
	]
	for intent: CombatIntent in stream: controller.submit_intent(intent)
	for index: int in 90: controller.step_fixed_tick(false)
	var result := controller.snapshot_hash()
	instance.queue_free()
	await process_frame
	return result
