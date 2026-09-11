class_name LoadoutSelection
extends Resource

@export var schema_version: int = 1
@export var character_id: StringName
@export var job_id: StringName
@export var accessory_id: StringName


func is_valid_definition() -> bool:
	return schema_version == 1 and not character_id.is_empty()
