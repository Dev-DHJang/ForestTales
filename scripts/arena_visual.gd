extends Node2D


func _draw() -> void:
	# Covers expanded ultra-wide viewports while authoritative arena geometry stays fixed.
	draw_rect(Rect2(Vector2(-1000, -1000), Vector2(3280, 2720)), Color("162033"))
	draw_circle(Vector2(1070, 135), 72.0, Color("f2c66d"))
	draw_rect(Rect2(100, 586, 1080, 48), Color("365f4b"))
	draw_rect(Rect2(500, 418, 280, 24), Color("4e8062"))
	draw_dashed_line(Vector2(80, 660), Vector2(1200, 660), Color("e96969"), 4.0, 14.0)
	draw_string(ThemeDB.fallback_font, Vector2(92, 694), "RING-OUT BOUNDARY (PHASE 1)", HORIZONTAL_ALIGNMENT_LEFT, -1.0, 18, Color("f39b9b"))
