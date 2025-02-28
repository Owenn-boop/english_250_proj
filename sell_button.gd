class_name SellButton

extends Button

@export var resourceName = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.pressed.connect(self.button_pressed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func button_pressed():
	$"../..".sell_item(resourceName)
