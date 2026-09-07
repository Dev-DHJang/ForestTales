extends Control

const ACTIONS: Array[StringName] = [
	&"move_left", &"move_right", &"jump", &"dash", &"attack_light", &"attack_heavy", &"attack_special"
]
const SAFE_EDGE_RATIO: float = 0.065

var _touch_actions: Dictionary[int, StringName] = {}
var _action_touch_counts: Dictionary[StringName, int] = {}


func _ready() -> void:
	set_process_unhandled_input(true)
	queue_redraw()


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		var touch := event as InputEventScreenTouch
		if touch.pressed:
			_assign_touch(touch.index, touch.position)
		else:
			_release_touch(touch.index)
	elif event is InputEventScreenDrag:
		var drag := event as InputEventScreenDrag
		var next_action: StringName = _action_for_position(drag.position)
		if _touch_actions.get(drag.index, &"") != next_action:
			_release_touch(drag.index)
			if not next_action.is_empty():
				_press_touch(drag.index, next_action)


func release_all_touches() -> void:
	for touch_index: int in _touch_actions.keys():
		_release_touch(touch_index)


func _assign_touch(touch_index: int, position: Vector2) -> void:
	var action: StringName = _action_for_position(position)
	if not action.is_empty():
		_press_touch(touch_index, action)


func _press_touch(touch_index: int, action: StringName) -> void:
	_touch_actions[touch_index] = action
	var count: int = _action_touch_counts.get(action, 0) + 1
	_action_touch_counts[action] = count
	if count == 1:
		Input.action_press(action)


func _release_touch(touch_index: int) -> void:
	if not _touch_actions.has(touch_index):
		return
	var action: StringName = _touch_actions[touch_index]
	_touch_actions.erase(touch_index)
	var count: int = maxi(_action_touch_counts.get(action, 1) - 1, 0)
	_action_touch_counts[action] = count
	if count == 0:
		Input.action_release(action)


func _action_for_position(position: Vector2) -> StringName:
	var viewport_size: Vector2 = get_viewport_rect().size
	var normalized := Vector2(position.x / viewport_size.x, position.y / viewport_size.y)
	if normalized.y < 0.58 or normalized.x < SAFE_EDGE_RATIO or normalized.x > 1.0 - SAFE_EDGE_RATIO:
		return &""
	var usable_x: float = inverse_lerp(SAFE_EDGE_RATIO, 1.0 - SAFE_EDGE_RATIO, normalized.x)
	if usable_x < 0.18:
		return &"move_left"
	if usable_x < 0.36:
		return &"move_right"
	if usable_x < 0.58:
		return &"dash"
	if usable_x < 0.70:
		return &"jump"
	if usable_x < 0.80:
		return &"attack_light"
	if usable_x < 0.90:
		return &"attack_heavy"
	return &"attack_special"


func _notification(what: int) -> void:
	if what == NOTIFICATION_APPLICATION_FOCUS_OUT or what == NOTIFICATION_APPLICATION_PAUSED:
		release_all_touches()


func _draw() -> void:
	var viewport_size: Vector2 = get_viewport_rect().size
	var labels := ["←", "→", "DASH", "JUMP", "LIGHT", "HEAVY", "SPECIAL"]
	var bounds := [0.0, 0.18, 0.36, 0.58, 0.70, 0.80, 0.90, 1.0]
	for index: int in labels.size():
		var left: float = lerpf(SAFE_EDGE_RATIO, 1.0 - SAFE_EDGE_RATIO, bounds[index]) * viewport_size.x
		var right: float = lerpf(SAFE_EDGE_RATIO, 1.0 - SAFE_EDGE_RATIO, bounds[index + 1]) * viewport_size.x
		var rect := Rect2(left + 6.0, viewport_size.y * 0.78, right - left - 12.0, viewport_size.y * 0.18)
		draw_rect(rect, Color(0.13, 0.18, 0.28, 0.72), true)
		draw_rect(rect, Color(0.62, 0.72, 0.86, 0.65), false, 2.0)
		draw_string(ThemeDB.fallback_font, rect.position + Vector2(0, rect.size.y * 0.58), labels[index], HORIZONTAL_ALIGNMENT_CENTER, rect.size.x, 18, Color.WHITE)
