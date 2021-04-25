extends TextureRect

export (int) var speed = 200
var destination = null
var start_position = Vector2(0,0)
var waiting = true
var full = false

export var cooldown = 1.0

func _physics_process(delta):
	if rect_global_position != destination and !full:
		rect_global_position = rect_global_position.move_toward(destination, delta * speed)
	elif rect_global_position == destination and !full:
		print("im on a planet")
		full = true
		#set_process(true)
		$Timer.start()
		#$Label.show()
	elif full and waiting:
		var player_ship = get_node("/root/Scene").find_node("PlayerShip").position
		rect_global_position = rect_global_position.move_toward(player_ship, delta * speed)
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
#	$Label.hide()
#	$CooldownDisplay.value = 0
#	$CooldownDisplay.texture_progress = texture_normal
	$Timer.wait_time = cooldown
#	set_process(false)


func _process(delta):
	#$Label.text = "%3.1f" % $Timer.time_left
	#$CooldownDisplay.value = int(($Timer.time_left / cooldown) * 100)
	pass

func _on_Timer_timeout():
	print("resources mined")
	#$CooldownDisplay.value = 0
	waiting = false
	#$Label.hide()
	#set_process(false)
