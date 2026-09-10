extends SceneTree


func _initialize() -> void:
	var failures: PackedStringArray = []
	var scene := load("res://scenes/main.tscn") as PackedScene
	var instance := scene.instantiate()
	root.add_child(instance)
	await process_frame
	var controller := instance.get_node("MatchController") as MatchController
	var player := instance.get_node("World/Player") as FighterController
	var dummy := instance.get_node("World/TrainingDummy") as FighterController
	# A final simultaneous boundary crossing always becomes a new sudden-death round.
	player.stocks = 1
	dummy.stocks = 1
	player.global_position = Vector2(controller.rules.ring_left - 1.0, 520)
	dummy.global_position = Vector2(controller.rules.ring_right + 1.0, 520)
	controller.step_fixed_tick()
	if controller.sudden_death_round != 1 or player.stocks != 1 or dummy.stocks != 1:
		failures.append("simultaneous final ring-out did not start sudden death")
	# A non-simultaneous final ring-out produces a winner.
	player.state = FighterController.State.IDLE
	dummy.state = FighterController.State.IDLE
	player.stocks = 1
	dummy.stocks = 1
	player.global_position = Vector2(controller.rules.ring_left - 1.0, 520)
	dummy.global_position = Vector2(850, 520)
	controller.step_fixed_tick()
	if controller.winner_id != dummy.fighter_id:
		failures.append("non-simultaneous final ring-out did not select survivor")
	# Formula uses post-hit damage and defender weight.
	var attack := player.attacks[0]
	var before := dummy.damage_percent
	dummy.receive_hit(player, attack, controller.rules)
	if dummy.damage_percent != before + attack.damage or dummy.hitstun_ticks < controller.rules.hitstun_min_ticks:
		failures.append("damage or hitstun contract failed")
	instance.queue_free()
	if failures.is_empty():
		print("PHASE1_MATCH_RULES: PASS")
		quit(0)
	for failure: String in failures: push_error(failure)
	quit(1)
