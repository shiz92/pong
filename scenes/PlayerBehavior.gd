extends Node



func _physics_process(delta: float) -> void:
	get_parent().velocity = Vector2(0,0)
	if Input.is_action_pressed("move_down"):
		get_parent().velocity.y += 1
	elif Input.is_action_pressed("move_up"):
		get_parent().velocity.y -= 1
	
	get_parent().velocity += get_parent().velocity * get_parent().get_parent().player_speed
	print("Player " + str(get_parent().position.y))
	get_parent().move_and_collide(get_parent().velocity * delta)
