extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _ready():
	$ShuttleLabel/ShuttleValue.text = str(Global.shuttles)
	$SystemsLabel/SystemsValue.text = str(Global.levelnumber)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ShuttleLabel/ShuttleValue.text = str(Global.shuttles)
	$SystemsLabel/SystemsValue.text = str(Global.levelnumber)
