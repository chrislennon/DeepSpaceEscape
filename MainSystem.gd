extends Node2D

var systemClock = rand_range(20, 10)
var traversalDistance = OS.get_window_size().y
var traversalSpeed = traversalDistance/systemClock
var selectedStar = 0
var jumping = false

onready var jumpText = $JumpBox/JumpText

func getSelectedStar():
	return selectedStar

func jumpShip():
	jumping = true
	jumpText.visible = true
	print("Execute System transition")
	# TODO Scene transition FTL online/animation flash/load next system
	SceneChanger.change_scene("res://MainSystem.tscn", 0.1)
	Global.levelnumber +=1 
	

# Called when the node enters the scene tree for the first time.
func _ready():
	# Initialize scene timer
	
	var display_time = "%.1f" % (max(systemClock, 0))
	get_node("ClockCanvas/System Clock/Time").set_text(display_time)
	
	# debug data
	var overlay = load("res://components/debug_overlay/debug_overlay.tscn").instance()
	overlay.add_stat("Selected Star: ", self, "getSelectedStar", true)
	overlay.add_stat("Food: ", Global, "food", false)
	overlay.add_stat("Energy: ", Global, "energy", false)
	overlay.add_stat("Materials: ", Global, "materials", false)
	overlay.add_stat("People: ", Global, "people", false)
	overlay.add_stat("System Level: ", Global, "levelnumber", false)
	add_child(overlay)
	$debug_overlay.get_child(0).hide()
	generate_system()

func generate_system():
	# Planet Generation
	var planet_box = $PlanetBox
	
	for n in rand_range(4, 2):
		var new_planet = createPlanet()
		new_planet.rect_global_position.x = rand_range(0, 1024)
		new_planet.rect_global_position.y = rand_range(0, 600)
		new_planet.connect("call_shuttle", $PlayerShip, "launch_shuttle")
		planet_box.add_child(new_planet)


func createPlanet():
	var planet = load("res://components/planet/Planet.tscn").instance()
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var num = rng.randi_range(0, 1)
	# print("created planet type: " + str(num))
	planet.init(num)
	return planet

func _process(delta):
	# Progress scene timer
	systemClock -=delta
	var display_time = "%.1f" % (max(systemClock, 0))
	get_node("ClockCanvas/System Clock/Time").set_text(display_time)
	# TODO Warning prompt X seconds in this system
	if systemClock <= 0.5 and !jumping:
		jumpShip()
		pass 

	pass

func _on_CheckBox_pressed():
	$debug_overlay.get_child(0).show()
	pass # Replace with function body.
