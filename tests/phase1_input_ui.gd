extends SceneTree


func _initialize() -> void:
	var failures: PackedStringArray = []
	var instance := (load("res://scenes/main.tscn") as PackedScene).instantiate()
	root.add_child(instance)
	await process_frame
	var controller := instance.get_node("MatchController") as MatchController
	controller.set_physics_process(false)
	var touch := instance.get_node("Interface/TouchCommandSource")
	var player := controller.player

	# Drag transitions release the previous pointer action and press one dominant axis.
	touch.call("_press", 20, &"move_left")
	var drag := InputEventScreenDrag.new()
	drag.index = 20
	var size: Vector2 = touch.get_viewport_rect().size
	drag.position = Vector2(size.x * 0.43, size.y * 0.75)
	touch.call("handle_pointer_event", drag)
	if Input.is_action_pressed(&"move_left") or not Input.is_action_pressed(&"move_right"): failures.append("D-pad drag transition failed")
	touch.release_all_touches()

	# Pause clears held movement and the one-slot buffered intent without advancing ticks.
	player.input_direction = CombatIntent.Direction.RIGHT
	player.buffered_intent = CombatIntent.new(1, player.fighter_id, &"attack_light")
	var paused_tick := controller.tick
	controller.pause_match(true)
	controller.step_fixed_tick(false)
	if player.input_direction != CombatIntent.Direction.NEUTRAL or player.buffered_intent != null: failures.append("pause did not clear fighter input")
	if controller.tick != paused_tick: failures.append("paused match advanced a fixed tick")
	controller.pause_match(false)
	controller.step_fixed_tick(false)
	if controller.tick != paused_tick + 1: failures.append("resume did not continue exactly one tick")

	# HUD rendering consumes a supplied snapshot but cannot mutate fighter authority state.
	var before := player.damage_percent
	var fake := controller.snapshot()
	fake.fighters[0].damage_percent = 87.0
	instance.call("_render_snapshot", fake)
	if player.damage_percent != before: failures.append("HUD mutated fighter damage")
	if not (instance.get_node("Interface/MatchReadout") as Label).text.contains("87%"):
		failures.append("HUD did not render snapshot damage")

	# Camera follows the pair and stays within its configured zoom bounds.
	player.global_position = Vector2(controller.rules.ring_left, 400)
	controller.training_dummy.global_position = Vector2(controller.rules.ring_right, 400)
	var camera := instance.get_node("Camera2D") as Camera2D
	camera.call("_process", 0.016)
	if camera.zoom.x < 0.779 or camera.zoom.x > 1.001: failures.append("camera zoom escaped limits")

	instance.queue_free()
	if failures.is_empty():
		print("PHASE1_INPUT_UI: PASS")
		quit(0)
	else:
		for failure: String in failures: push_error(failure)
		print("PHASE1_INPUT_UI: FAIL (%d)" % failures.size())
		quit(1)
