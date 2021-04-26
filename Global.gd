extends Node

var levelnumber = 0
var current_scene = null

var max_energy = 100
var max_food = 100  # decreases overtime based on number of people
var max_materials = 100
var max_people = 100
var max_shuttles = 4

var energy = max_energy
var food = max_food
var materials = max_materials
var people = max_people
var shuttles = max_shuttles

var shuttle_people = 5

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)

func resetGlobals():
	levelnumber = 0
	current_scene = null
	energy = max_energy
	food = max_food
	materials = max_materials
	people = max_people
	shuttles = max_shuttles
