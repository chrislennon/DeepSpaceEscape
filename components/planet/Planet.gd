extends TextureRect

var visited = false
var base_food = 20
var base_energy = 100
var base_materials = 100
var resource
var value

signal call_shuttle

onready var button = $TextureButton

func _ready():
	ui_signals.register_tooltip(button,"\nFood: "+ str(base_food) +" \n\nClick to launch 1 shuttle (5 people)\n")

func init(id):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var planetShader = rng.randi_range(1, 10)
	
	if id == 0:
		resource = 'food'
		value = base_food
		texture = load("res://components/planet/p"+str(planetShader)+"shaded.png")
	elif id == 1:
		resource = 'materials'
		value = base_materials
		texture = load("res://components/planet/p"+str(planetShader)+"shaded.png")
	
	# TODO texture always appears as first loaded as they layer on each other
	# $Tooltip/M2/H1/CenterTex/TextureRect.texture = load("res://assets/icon_"+resource+"_64.png")
	var tooltipIcon = load("res://assets/icons/icon_"+resource+"_64.png")
	find_node("Tooltip").find_node("TextureRect").texture = tooltipIcon

func _on_TextureButton_pressed():
	if !visited:
		# print("calling shuttle")
		Global.people -= Global.shuttle_people
		emit_signal("call_shuttle", self)
		visited = true
		$TextureButton.disabled = true
		pass
