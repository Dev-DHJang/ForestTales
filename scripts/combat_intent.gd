class_name CombatIntent
extends RefCounted

enum Direction { NEUTRAL, LEFT, RIGHT, UP, DOWN }
enum Edge { PRESS, HOLD, RELEASE }
enum Context { GROUND, AIR }

var tick: int
var fighter_id: StringName
var action_id: StringName
var direction: Direction
var edge: Edge
var context: Context


func _init(
	p_tick: int = 0,
	p_fighter_id: StringName = &"",
	p_action_id: StringName = &"",
	p_direction: Direction = Direction.NEUTRAL,
	p_edge: Edge = Edge.PRESS,
	p_context: Context = Context.GROUND,
) -> void:
	tick = p_tick
	fighter_id = p_fighter_id
	action_id = p_action_id
	direction = p_direction
	edge = p_edge
	context = p_context
