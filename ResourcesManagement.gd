extends Node

var foodDecreaseRatePerPeople = 0.1
var timeCounter = 0
onready var previousTime = OS.get_ticks_msec()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var elapsedTime = OS.get_ticks_msec() - previousTime
	previousTime = OS.get_ticks_msec()
	timeCounter += elapsedTime
	if (timeCounter > 1000):
		# TODO use mod to decrease food multiple times if the frame took too long for a smoother experience
		# decrease resources that are tied to time
		decrease_food()
		timeCounter = timeCounter - 1000
		draw_text()
		check_game_over()
	pass

func _input(ev):
	if Input.is_action_pressed("give_food"):
		Global.food += 10

func decrease_food():
	Global.food -= floor(foodDecreaseRatePerPeople * Global.people)
	Global.food = max(Global.food, 0)
	
func draw_text():
	# ugly i know =(
	var text = "Resources \n" + "Food: " + str(Global.food) + "\n" + "Energy: " + str(Global.energy) + "\n" + "People: " + str(Global.people) + "\n" + "Materials: " + str(Global.materials)
	get_node("/root/Scene/Resources/ResourcesText").set_text(text)

func check_game_over():
	if Global.food <= 0:
		print("game technically over...")
		pass
