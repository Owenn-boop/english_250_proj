class_name LumberNode

extends ResourceNode

func _ready() -> void:
	resourceName = "Lumber"
	full_texture = preload("res://Tree2.png")
	half_texture = preload("res://Tree3.png")
	quarter_texture = preload("res://Tree3.png")
	gone_texture = preload("res://Broken_tree3.png")
	texture = full_texture
	maxHealth = 20
	priceMulti = 2
	
func _process(delta: float) -> void:
	super._process(delta)
