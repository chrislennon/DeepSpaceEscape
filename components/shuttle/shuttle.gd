extends TextureRect

export (int) var speed = 200
var destination = null
var start_position = Vector2(0,0)

func _physics_process(delta):
	if destination:
		print("moving to ...")
		print(destination)
		print("at location")
		print(rect_global_position)
		rect_global_position = rect_global_position.move_toward(destination, delta * speed)

func init(dest, start_position):
	rect_global_position = start_position
	destination = dest
	print(dest)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
