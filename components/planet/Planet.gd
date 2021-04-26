extends TextureRect

export var scanned = false
export var scanable = true

var visited = false

var base_food = 20
var base_energy = 100
var base_materials = 100

var resource
var value

signal call_shuttle

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func init(id):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var num = rng.randi_range(1, 10)
	print("planet" + str(num))
	if id == 0:
		resource = 'food'
		value = base_food
		texture = load("res://components/planet/p"+str(num)+"shaded.png")
	elif id == 1:
		resource = 'materials'
		value = base_materials
		texture = load("res://components/planet/p"+str(num)+"shaded.png")
	pass


func _on_TextureButton_pressed():
	if !visited:
		print("calling shuttle")
		emit_signal("call_shuttle", self)
		visited = true
		$TextureButton.disabled = true
		pass
