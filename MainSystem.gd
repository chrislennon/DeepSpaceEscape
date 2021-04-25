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
	# TODO Scene transition FTL online/animation flash/load next system
	SceneChanger.change_scene("res://MainSystem.tscn", 0.1)
	Global.levelnumber +=1 
	

# Called when the node enters the scene tree for the first time.
func _ready():
	# Initialize scene timer
	get_node("System Clock/Time").set_text(String(systemClock))
	
	# debug data
	var overlay = load("res://components/debug_overlay/debug_overlay.tscn").instance()
	overlay.add_stat("Selected Star: ", self, "getSelectedStar", true)
	overlay.add_stat("Food: ", Global, "food", false)
	overlay.add_stat("Energy: ", Global, "energy", false)
	overlay.add_stat("Materials: ", Global, "materials", false)
	overlay.add_stat("People: ", Global, "people", false)
	overlay.add_stat("System Level: ", Global, "levelnumber", false)
	add_child(overlay)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Progress scene timer
	systemClock -=delta
	
	get_node("System Clock/Time").set_text(String(systemClock))
	# TODO Warning prompt X seconds in this system
	
	if systemClock <= 0 and !jumping:
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
	
func _input(ev):
	if Input.is_action_pressed("launch_shuttle"):
		if Global.shuttles > 0:
			Global.shuttles -= 1
			var shuttle = preload("res://components/shuttle/shuttle.tscn").instance()
			print("fire shuttle")
			print($Planet.rect_global_position)
			shuttle.init($Planet.rect_global_position, $PlayerShip.position)
			get_parent().add_child(shuttle)
