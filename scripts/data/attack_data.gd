class_name AttackData
extends Resource

enum InputDirection { NEUTRAL, FORWARD, BACK, UP, DOWN, ANY_HORIZONTAL, OMNI }
enum ActivationContext { GROUND, AIR, BOTH }
enum LaunchMode { VECTOR, TOWARD_SOURCE }

@export var schema_version: int = 1
@export var attack_id: StringName
@export var action_id: StringName
@export var input_direction: InputDirection = InputDirection.NEUTRAL
@export var activation_context: ActivationContext = ActivationContext.GROUND
@export_range(0, 4, 1) var combo_step: int = 0
@export var requires_dash: bool = false
@export var startup_ticks: int = 1
@export var active_ticks: int = 1
@export var recovery_ticks: int = 1
@export var damage: float = 0.0
@export var base_knockback: float = 0.0
@export var knockback_growth: float = 0.0
@export var launch_mode: LaunchMode = LaunchMode.VECTOR
@export var launch_vector: Vector2 = Vector2(1.0, -0.18)
@export var hitbox_size: Vector2 = Vector2(60.0, 50.0)
@export var hitbox_offset: Vector2 = Vector2(44.0, -28.0)
@export var max_hits_per_target: int = 1
@export var rehit_interval_ticks: int = 0
@export var is_finisher: bool = false
@export var is_launcher: bool = false
@export var self_impulse: Vector2 = Vector2.ZERO
@export var visual_state_id: StringName


func is_valid_definition() -> bool:
	return schema_version == 1 \
		and not attack_id.is_empty() \
		and not action_id.is_empty() \
		and combo_step >= 0 \
		and startup_ticks > 0 \
		and active_ticks > 0 \
		and recovery_ticks > 0 \
		and damage >= 0.0 \
		and base_knockback >= 0.0 \
		and knockback_growth >= 0.0 \
		and (launch_mode == LaunchMode.TOWARD_SOURCE or not launch_vector.is_zero_approx()) \
		and hitbox_size.x > 0.0 \
		and hitbox_size.y > 0.0 \
		and max_hits_per_target > 0 \
		and (max_hits_per_target == 1 or rehit_interval_ticks > 0) \
		and not visual_state_id.is_empty()
