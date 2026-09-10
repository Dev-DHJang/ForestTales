class_name CharacterData
extends Resource

## The sole authored definition for one playable character. Visual references
## are presentation-only and must never decide combat timing or hit results.
@export var schema_version: int = 1
@export var character_id: StringName
@export var display_name: String = ""
@export var concept_asset_id: StringName
@export var concept_image: Texture2D
@export_multiline var concept_summary: String = ""
@export_multiline var background_setting: String = ""
@export var combat_role: String = ""
@export var tags: Array[StringName] = []
@export var move_slot_ids: Array[StringName] = []
@export_multiline var passive_description: String = ""
@export var job_tree_ids: Array[StringName] = []
@export var base_stats: CharacterStats


func has_unique_move_slots() -> bool:
	var seen: Dictionary = {}
	for move_id: StringName in move_slot_ids:
		if move_id.is_empty() or seen.has(move_id):
			return false
		seen[move_id] = true
	return not move_slot_ids.is_empty()


func is_valid_definition() -> bool:
	return schema_version == 1 \
		and not character_id.is_empty() \
		and not display_name.is_empty() \
		and not concept_asset_id.is_empty() \
		and concept_image != null \
		and not concept_summary.is_empty() \
		and not background_setting.is_empty() \
		and not combat_role.is_empty() \
		and not tags.is_empty() \
		and has_unique_move_slots() \
		and not passive_description.is_empty() \
		and base_stats != null \
		and base_stats.is_valid_base_profile()
