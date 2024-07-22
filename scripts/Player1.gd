extends CharacterBody2D

@export var is_cpu: bool = false


func _physics_process(delta):
	velocity = Vector2(0,0)
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	elif Input.is_action_pressed("move_up"):
		velocity.y -= 1
	
	velocity += velocity * get_parent().player_speed
	move_and_collide(velocity * delta)
