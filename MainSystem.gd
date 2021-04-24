extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var systemClock = rand_range(300, 180)
var traversalDistance = OS.get_window_size().y
var traversalSpeed = traversalDistance/systemClock

# Called when the node enters the scene tree for the first time.
func _ready():
	# Initialize scene timer
	get_node("System Clock/Time").set_text(String(systemClock))
	
	# TODO Scene initiation flash prompt X seconds in this system
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Progress scene timer
	systemClock -=delta
	get_node("System Clock/Time").set_text(String(systemClock))
	
	if systemClock <= 0:
		# TODO Scene transition FTL online/animation flash/load next system
		print("Execute System transition")
		pass 
	pass
