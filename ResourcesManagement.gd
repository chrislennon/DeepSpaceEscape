extends Node

var foodDecreaseRatePerPeople = 0.05
var deathRateNoFood = 0.10
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
	pass

func _input(ev):
	if Input.is_action_pressed("give_food"):
		Global.food = clamp(Global.food + 10, 0, Global.max_food)

func decrease_food():
	Global.food -= floor(foodDecreaseRatePerPeople * Global.people)
	Global.food = max(Global.food, 0)
	if Global.food == 0:
		# People eat people
		Global.people -= ceil(deathRateNoFood * Global.people)

func check_game_over():
	#if Global.food <= 0:
		
	if Global.people <= 0:
		print("game technically over...")
		SceneChanger.change_scene("res://GameOverScene.tscn", 0.1)
		pass

#$HealthDisplay.update_healthbar(health)
