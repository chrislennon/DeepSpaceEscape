extends RigidBody2D

var obtainableResources = {
	
}

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			print("click")
			# Pop planet actions GUI here
	pass
