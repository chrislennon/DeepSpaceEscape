extends TextureRect

export var scanned = false
export var scanable = true
export var food = 100
export var energy = 100

signal call_shuttle
 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func init(id):
	pass


func _on_TextureButton_pressed():
	print("calling shuttle")
	emit_signal("call_shuttle", self)
	pass # Replace with function body.
