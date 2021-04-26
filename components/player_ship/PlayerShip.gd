extends KinematicBody2D


export (int) var speed = 200

var velocity = Vector2()

func get_automatedSpeed():
	velocity = Vector2()
	velocity.y -= 1
	velocity = velocity.normalized() * get_tree().get_current_scene().traversalSpeed

func _physics_process(_delta):
	# Use input temporarily to artificially progress
	get_automatedSpeed()
	velocity = move_and_slide(velocity)

# Called when the node enters the scene tree for the first time.
func _ready():
	# establish speed based on time
	pass # Replace with function body.

func launch_shuttle(target):
	if Global.shuttles > 0:
		Global.shuttles -= 1
		var shuttle = preload("res://components/shuttle/shuttle.tscn").instance()
		shuttle.init(target, position)
		get_parent().add_child(shuttle)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Planet_call_shuttle(target):
	launch_shuttle(target.rect_global_position)
	pass # Replace with function body.
