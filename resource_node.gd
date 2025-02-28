class_name ResourceNode

extends Sprite2D

@export var resourceName = ""
@export var amount = 1
@export var priceMulti : float = 1
@export var maxHealth : float = 10
@export var respawnDelay = 2
@export var health : int = 10 :
	set(val):
		health = val
		if $ProgressBar == null:
			return
		$ProgressBar.ratio = val / maxHealth
		if health <= 0:
			get_parent().add_item(resourceName, amount)
		texture_change()

var full_texture : Texture = preload("res://icon.svg")
var half_texture : Texture = preload("res://icon.svg")
var quarter_texture : Texture = preload("res://icon.svg")
var gone_texture : Texture = null

var isHeld : bool = false
var holdTime : float = 0

var respawnDelayDelta : float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture = full_texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if isHeld:
		if holdTime > 1.2:
			applyDamage(2)
			holdTime = 0.2
		else:
			holdTime += delta
		
	if health <= 0:
		respawnDelayDelta += delta
	if respawnDelay <= respawnDelayDelta:
		destroy()

func destroy() -> void:
	health = maxHealth
	respawnDelayDelta = 0
	
func applyDamage(amount: int) -> void:
	if amount < 0:
		amount = 0
	
	if health <= 0:
		return
	
	health -= amount * $"..".damageMulti
	

func click(event: InputEventMouseButton) -> void:
	if event.is_action_pressed("leftClick"):
		isHeld = true
	if event.is_action_released("leftClick"):
		isHeld = false
		if holdTime > 0.2:
			holdTime = 0
		else:
			applyDamage(2)
		return
	if event.is_action_released("rightClick"):
		pass
	return

func texture_change():
	if health >= maxHealth:
		self.texture = full_texture
		return
	
	if health <= 0:
		self.texture = gone_texture
		return
	
	if health <= maxHealth / 4:
		self.texture = quarter_texture
		return
		
	if health <= maxHealth / 1.33:
		self.texture = half_texture
		return
	
	
