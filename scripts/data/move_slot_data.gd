class_name MoveSlotData
extends Resource

@export var slot_id: StringName
@export var attack: AttackData


func is_valid_definition() -> bool:
	return not slot_id.is_empty() and attack != null and attack.is_valid_definition()
