extends Node2D

const SEMANTIC_ACTIONS: Array[StringName] = [
	&"move_left",
	&"move_right",
	&"jump",
	&"dash",
	&"attack_light",
	&"attack_heavy",
	&"attack_special",
]

@onready var command_readout: Label = $Interface/CommandReadout


func _process(_delta: float) -> void:
	var active_actions: PackedStringArray = []
	for action: StringName in SEMANTIC_ACTIONS:
		if Input.is_action_pressed(action):
			active_actions.append(String(action))
	command_readout.text = "Phase 0 · 입력 대기" if active_actions.is_empty() else "명령: %s" % ", ".join(active_actions)


func _notification(what: int) -> void:
	if what == NOTIFICATION_APPLICATION_FOCUS_OUT or what == NOTIFICATION_APPLICATION_PAUSED:
		_release_semantic_actions()


func _release_semantic_actions() -> void:
	for action: StringName in SEMANTIC_ACTIONS:
		Input.action_release(action)
