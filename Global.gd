extends Node

var levelnumber = 0
var current_scene = null
var energy = 100
var food = 100  # decreases overtime based on number of people
var materials = 100
var people = 100

var shuttles = 1

func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)
