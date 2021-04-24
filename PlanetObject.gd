extends RigidBody2D

signal clicked

var held = false

#func _input_event(viewport, event, shape_idx):
#	if event is InputEventMouseButton:
#		if event.button_index == BUTTON_LEFT and event.pressed:
#			emit_signal("clicked", self)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
		#if event.type == InputEvent.left_click:
			print("click")
	pass
	
