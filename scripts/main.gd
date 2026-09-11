extends Node2D

const SEMANTIC_ACTIONS: Array[StringName] = [&"move_left", &"move_right", &"move_up", &"move_down", &"jump", &"dash", &"attack_light", &"attack_heavy", &"attack_special"]

@onready var match_controller: MatchController = $MatchController
@onready var touch: Control = $Interface/TouchCommandSource
@onready var readout: Label = $Interface/MatchReadout
@onready var restart: Button = $Interface/Restart
@onready var debug_readout: Label = $Interface/DebugReadout


func _ready() -> void:
	match_controller.snapshot_changed.connect(_render_snapshot)
	restart.pressed.connect(match_controller.reset_match)
	_render_snapshot(match_controller.snapshot())
	debug_readout.visible = OS.is_debug_build()


func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch or event is InputEventScreenDrag or event is InputEventMouseButton or event is InputEventMouseMotion:
		touch.handle_pointer_event(event)


func _notification(what: int) -> void:
	if what == NOTIFICATION_APPLICATION_FOCUS_OUT or what == NOTIFICATION_APPLICATION_PAUSED:
		_release_semantic_actions()
		touch.release_all_touches()
		match_controller.pause_match(true)
		print("FOREST_ARENA_INPUT_RESET reason=pause")
	elif what == NOTIFICATION_APPLICATION_FOCUS_IN or what == NOTIFICATION_APPLICATION_RESUMED:
		match_controller.pause_match(false)


func _release_semantic_actions() -> void:
	for action: StringName in SEMANTIC_ACTIONS:
		Input.action_release(action)


func _render_snapshot(snapshot: Dictionary) -> void:
	var fighters: Array = snapshot.get("fighters", [])
	if fighters.size() < 2:
		return
	var first: Dictionary = fighters[0]
	var second: Dictionary = fighters[1]
	var suffix := ""
	if int(snapshot.get("sudden_death_round", 0)) > 0:
		suffix = " · SUDDEN DEATH %d" % snapshot.sudden_death_round
	if not String(snapshot.get("winner_id", "")).is_empty():
		suffix = " · 승자: %s" % snapshot.winner_id
	readout.text = "자현 %d%% · %d STOCK    묘령 %d%% · %d STOCK%s" % [roundi(first.damage_percent), first.stocks, roundi(second.damage_percent), second.stocks, suffix]
	debug_readout.text = "tick %d  %s:%s  %s:%s" % [snapshot.tick, first.state, first.attack_id, second.state, second.attack_id]
