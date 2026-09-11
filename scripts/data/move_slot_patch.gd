class_name MoveSlotPatch
extends Resource

@export var slot_id: StringName
@export var replacement: AttackData


func is_valid_definition() -> bool:
	return not slot_id.is_empty() and replacement != null and replacement.is_valid_definition()
