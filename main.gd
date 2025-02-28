extends Node2D

var money : float = 0 :
	set(amt):
		money = amt
		$Money.text = str(money)

var damageMulti : int = 1
		
var resources : Dictionary = {"Ore": 0, "Lumber": 0}
		
var prices : Dictionary = {"Ore": 1, "Lumber": 2}

var nameToNode = {"Ore": $OreNode, "Lumber": $LumberNode}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_prices()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _unhandled_input(event: InputEvent) -> void:
	if(event is InputEventMouseButton):
		for child in get_children():
			if child is not ResourceNode:
				pass
			var pos = child.get_global_position()
			# move position to top left of node
			pos -= Vector2(32, 32)
			# square with length of 64
			var rect = Rect2(pos, Vector2(64, 64))
			if rect.has_point(event.position):
				child.click(event)
				break

func add_item(name: String, count: int):
	if resources.get(name):
		resources[name] += count
	else:
		resources[name] = count
	
	update_item_container()
	
func update_item_container():
	for item in resources:
		$ScoreBoard/Amounts.find_child(item).text = str(resources[item])

func sell_item(item: String) -> void:
	money += prices[item] * resources[item]
	resources[item] = 0
	update_item_container()

func update_prices():
	for item in prices:
		var multi = find_child(item + "Node").priceMulti
		prices[item] = RandomNumberGenerator.new().randi_range(1, 10 * multi)
	
	var item_prices_text = ""
	
	for item in prices:
		item_prices_text += "$" + str(prices[item]) + "\n"
	
	$Prices.text = item_prices_text

func upgrade_damage(cost: int):
	if money >= cost:
		damageMulti += 1
		money -= cost
		$UpgradeDamageButton.cost *= 2
