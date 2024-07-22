extends CharacterBody2D

func _physics_process(delta):
	if Global.ball != null:
		velocity = Vector2(0,0)
		var ball_direction = Global.ball.position - position
		ball_direction = ball_direction.normalized()
		if ball_direction.y > 0:
			velocity.y += 1
		elif ball_direction.y < 0:
			velocity.y -= 1
		velocity += velocity * get_parent().player_speed
		print("CPU " + str(position.y))
		move_and_collide(velocity*delta)
	pass
