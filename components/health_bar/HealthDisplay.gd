extends Node2D

var bar_red = preload("res://components/health_bar/barHorizontal_red.png")
var bar_green = preload("res://components/health_bar/barHorizontal_green.png")
var bar_yellow = preload("res://components/health_bar/barHorizontal_yellow.png")

export var resourceId = 0

onready var healthbar = $HealthBar

func _ready():
	if resourceId == 0:
		healthbar.max_value = Global.max_food
		healthbar.value = Global.food
	if resourceId == 1:
		healthbar.max_value = Global.max_people
		healthbar.value = Global.people
	if resourceId == 2:
		healthbar.max_value = Global.max_energy
		healthbar.value = Global.energy
	if resourceId == 3:
		healthbar.max_value = Global.max_materials
		healthbar.value = Global.materials
	
func _process(_delta):
	global_rotation = 0
	
func update_healthbar(value):
	healthbar.texture_progress = bar_green
	if value < healthbar.max_value * 0.7:
		healthbar.texture_progress = bar_yellow
	if value < healthbar.max_value * 0.35:
		healthbar.texture_progress = bar_red
	if value < healthbar.max_value:
		show()
	healthbar.value = value
