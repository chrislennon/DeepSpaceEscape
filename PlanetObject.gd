extends RigidBody2D

var obtainableResources = {
	
}

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			print("click")
			# Pop planet actions GUI here
	pass
