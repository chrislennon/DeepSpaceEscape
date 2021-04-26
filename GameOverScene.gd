extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Control/GameOverText.text = "You travelled " + str(Global.levelnumber) + " systems deep."

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_TextureButton_pressed():
	Global.resetGlobals()
	SceneChanger.change_scene("res://MainSystem.tscn", 0.1)
	pass # Replace with function body.
