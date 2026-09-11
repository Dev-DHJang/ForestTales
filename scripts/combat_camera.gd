extends Camera2D

@export var player: FighterController
@export var training_dummy: FighterController
@export var rules: CombatRules
@export_range(0.5, 1.0, 0.01) var minimum_zoom := 0.78
@export_range(0.5, 1.2, 0.01) var maximum_zoom := 1.0


func _ready() -> void:
	if player == null: player = get_node("../World/Player") as FighterController
	if training_dummy == null: training_dummy = get_node("../World/TrainingDummy") as FighterController


func _process(_delta: float) -> void:
	if player == null or training_dummy == null: return
	var midpoint := (player.global_position + training_dummy.global_position) * 0.5
	var separation := absf(player.global_position.x - training_dummy.global_position.x)
	var desired := clampf(900.0 / maxf(900.0, separation + 320.0), minimum_zoom, maximum_zoom)
	zoom = Vector2(desired, desired)
	var visible_half := get_viewport_rect().size * 0.5 / desired
	position.x = _clamp_axis(midpoint.x, rules.ring_left, rules.ring_right, visible_half.x)
	position.y = _clamp_axis(midpoint.y - 80.0, rules.ring_top, rules.ring_bottom, visible_half.y)


func _clamp_axis(value: float, minimum: float, maximum: float, half_extent: float) -> float:
	if minimum + half_extent > maximum - half_extent:
		return (minimum + maximum) * 0.5
	return clampf(value, minimum + half_extent, maximum - half_extent)
