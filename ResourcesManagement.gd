extends Node

var foodDecreaseRatePerPeople = 0.05
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
		#draw_text()
		check_game_over()
		get_node("/root/Scene").find_node("Food").update_healthbar(Global.food)
		get_node("/root/Scene").find_node("People").update_healthbar(Global.people)
		get_node("/root/Scene").find_node("Energy").update_healthbar(Global.energy)
		get_node("/root/Scene").find_node("Materials").update_healthbar(Global.materials)
	pass

func _input(ev):
	if Input.is_action_pressed("give_food"):
		Global.food += 10

func decrease_food():
	Global.food -= floor(foodDecreaseRatePerPeople * Global.people)
	Global.food = max(Global.food, 0)

func check_game_over():
	if Global.food <= 0:
		print("game technically over...")
		pass

#$HealthDisplay.update_healthbar(health)
