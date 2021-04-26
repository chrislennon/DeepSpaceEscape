extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _ready():
	$ShuttleLabel/ShuttleValue.text = str(Global.shuttles)
	$SystemsLabel/SystemsValue.text = str(Global.levelnumber)
	$TextureRect/Food/FoodValue.text = str(Global.food)
	$TextureRect3/Energy/EnergyValue.text = str(Global.energy)
	$TextureRect4/Materials/MaterialsValue.text = str(Global.materials)
	$TextureRect2/People/PeopleValue.text = str(Global.people)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ShuttleLabel/ShuttleValue.text = str(Global.shuttles)
	$SystemsLabel/SystemsValue.text = str(Global.levelnumber)
	$TextureRect/Food/FoodValue.text = str(Global.food)
	$TextureRect3/Energy/EnergyValue.text = str(Global.energy)
	$TextureRect4/Materials/MaterialsValue.text = str(Global.materials)
	$TextureRect2/People/PeopleValue.text = str(Global.people)
	get_node("/root/Scene").find_node("Food").update_healthbar(Global.food)
	get_node("/root/Scene").find_node("People").update_healthbar(Global.people)
	get_node("/root/Scene").find_node("Energy").update_healthbar(Global.energy)
	get_node("/root/Scene").find_node("Materials").update_healthbar(Global.materials)
