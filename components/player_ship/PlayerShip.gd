extends KinematicBody2D


export (int) var speed = 200

var velocity = Vector2()

func get_automatedSpeed():
	velocity = Vector2()
	velocity.y -= 1
	velocity = velocity.normalized() * get_tree().get_current_scene().traversalSpeed

func _physics_process(delta):
	# Use input temporarily to artificially progress
	get_automatedSpeed()
	velocity = move_and_slide(velocity)

# Called when the node enters the scene tree for the first time.
func _ready():
	# establish speed based on time
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
