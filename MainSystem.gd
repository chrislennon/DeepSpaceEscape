extends Node2D


var systemClock = rand_range(20, 10)
var traversalDistance = OS.get_window_size().y
var traversalSpeed = traversalDistance/systemClock
var selectedStar = 0
var jumping = false

onready var menuButton = $PopupMenu

func getSelectedStar():
	return selectedStar

func jumpShip():
	jumping = true
	get_node("JumpText").visible = true
	print("Execute System transition")
	SceneChanger.change_scene("res://MainSystem.tscn", 0.1)
	
					
# Called when the node enters the scene tree for the first time.
func _ready():
	# Initialize scene timer
	get_node("System Clock/Time").set_text(String(systemClock))
	
	# debug data
	var overlay = load("res://debug_overlay.tscn").instance()
	overlay.add_stat("Selected Star ", self, "getSelectedStar", true)
	add_child(overlay)
	
	# TODO Scene initiation flash prompt X seconds in this system
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Progress scene timer
	systemClock -=delta
	get_node("System Clock/Time").set_text(String(systemClock))
	
	if systemClock <= 0 and !jumping:
		# TODO Scene transition FTL online/animation flash/load next system
		jumpShip()
		pass 

	pass

func _on_NavButton_pressed():
	$PopupMenu.visible = !$PopupMenu.visible

func _on_PopupMenu_id_pressed(id):
	print("Star ID:")
	print(id)
	selectedStar = id
	pass 
