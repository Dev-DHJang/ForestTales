# Forest Arena / Godot 4 Setup

The installer copies `res://forest_arena/` into the current project and registers `ForestArenaResources` as an Autoload.

Quality settings: `high`, `medium`, `low`. Only 22 full-screen/background/illustration/FX resources are quality-tiered. UI/buttons/icons/characters/accessories remain common HQ assets.

Use logical IDs:
```gdscript
ForestArenaResources.set_quality("medium")
$TextureRect.texture = ForestArenaResources.load_texture("fa.background.bg.lobby.forest.town")
```
