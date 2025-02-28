class_name OreNode

extends ResourceNode

func _ready() -> void:
	resourceName = "Ore"
	full_texture = preload("res://Rock2_1.png")
	half_texture = preload("res://Rock2_3.png")
	quarter_texture = preload("res://Rock2_5.png")
	texture = full_texture
	respawnDelay = 1
	
func _process(delta: float) -> void:
	super._process(delta)
