extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	text = str(Global.shuttles)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = str(Global.shuttles)
