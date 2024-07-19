extends CharacterBody2D

@export var is_cpu: bool = false


func _physics_process(delta):
	var direction := Vector2(0,0)
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	elif Input.is_action_pressed("move_up"):
		direction.y -= 1
	
	position += direction * delta * get_parent().player_speed
	move_and_slide()
	
	var balls = get_tree().get_nodes_in_group("ball")
	for ball: Ball in balls:
		ball.direction
