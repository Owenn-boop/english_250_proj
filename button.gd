extends Button

var cost : int = 50 :
	set(val):
		cost = val
		self.text = "Upgrade Damage " + str(cost)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.pressed.connect(self.button_pressed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func button_pressed():
	$"..".upgrade_damage(cost)
