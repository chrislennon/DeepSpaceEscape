extends Node

# TODO figure out how to make this a singleton that keeps the state between scenes 
# or load the resource variables from a global.gd

var energy = 100
var food = 100  # decreases overtime based on number of people
var materials = 100
var people = 100
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
	pass


func decrease_food():
	food -= floor(foodDecreaseRatePerPeople * people)
	food = max(food, 0)
	
func draw_text():
	# ugly i know =(
	var text = "Resources \n" + "Food: " + str(food) + "\n" + "Energy: " + str(energy) + "\n" + "People: " + str(people) + "\n" + "Materials: " + str(materials)
	get_node("/root/Scene/Resources/ResourcesText").set_text(text)
