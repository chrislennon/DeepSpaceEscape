extends TextureRect

export (int) var speed = 200
var destination = null
var start_position = Vector2(0,0)
var waiting = false
var full = false

export var cooldown = 3.0

func _physics_process(delta):
	var player_ship = get_node("/root/Scene").find_node("PlayerShip").position
	if rect_global_position != destination and !full:
		$Label.hide()
		rect_global_position = rect_global_position.move_toward(destination, delta * speed)
	elif full and rect_global_position != player_ship:
		#print("returning")
		$Label.hide()
		rect_global_position = rect_global_position.move_toward(player_ship, delta * speed)
		if rect_global_position == player_ship and full:
			#print("touching")
			Global.food += 20
			Global.shuttles += 1
			set_process(false)
			get_parent().remove_child(self)
	elif rect_global_position == destination and !full and !waiting:
		#print("im on a planet")
		waiting = true
		#set_process(true)
		$Timer.start()
		$Label.show()
	elif waiting:
		pass

func init(dest, start_position):
	rect_global_position = start_position
	destination = dest.rect_global_position
	print(dest)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _ready():
	$Timer.wait_time = cooldown
	$CooldownDisplay.value = 0

func _process(delta):
	$Label.text = "%3.1f" % $Timer.time_left
	$CooldownDisplay.value = int(($Timer.time_left / cooldown) * 100)
	#print($Timer.time_left)
	pass

func _on_Timer_timeout():
	print("resources mined")
	#$CooldownDisplay.value = 0
	waiting = false
	full = true
	$Label.hide()
	#set_process(false)
