extends Node2D

const SEMANTIC_ACTIONS: Array[StringName] = [&"move_left", &"move_right", &"move_up", &"move_down", &"jump", &"dash", &"attack_light", &"attack_heavy", &"attack_special"]

@onready var match_controller: MatchController = $MatchController
@onready var touch: Control = $Interface/TouchCommandSource
@onready var readout: Label = $Interface/MatchReadout
@onready var restart: Button = $Interface/Restart


func _ready() -> void:
	match_controller.snapshot_changed.connect(_render_snapshot)
	restart.pressed.connect(match_controller.reset_match)
	_render_snapshot(match_controller.snapshot())


func _notification(what: int) -> void:
	if what == NOTIFICATION_APPLICATION_FOCUS_OUT or what == NOTIFICATION_APPLICATION_PAUSED:
		_release_semantic_actions()
		touch.release_all_touches()
		match_controller.pause_match(true)
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
