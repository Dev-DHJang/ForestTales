extends CharacterBody2D

@export var display_name: String = "FIGHTER"
@export var body_color: Color = Color.WHITE


func _ready() -> void:
	queue_redraw()


func _draw() -> void:
	# A replaceable, non-authoritative silhouette. Collision remains a separate child node.
	draw_circle(Vector2(0, -34), 31.0, body_color)
	draw_polygon(PackedVector2Array([Vector2(-27, -10), Vector2(27, -10), Vector2(22, 47), Vector2(-22, 47)]), PackedColorArray([body_color]))
	draw_string(ThemeDB.fallback_font, Vector2(-50, 76), display_name, HORIZONTAL_ALIGNMENT_CENTER, 100.0, 16, Color.WHITE)
