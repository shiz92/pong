extends Node

const ACCEL_FACTOR = 2.0

func _physics_process(delta: float) -> void:
	
	var actor: CharacterBody2D = get_parent()
	
	if actor.ball != null:
		actor.velocity = Vector2(0,0)
		var ball_direction = actor.ball.position - actor.position
		ball_direction = ball_direction.normalized()
		
		var newVel = (actor.ball.position.y - actor.position.y) / ACCEL_FACTOR
		newVel = clamp(newVel, -1.0, 1.0)
		
		actor.velocity.y = newVel * actor.get_parent().player_speed
		
		print("CPU " + str(actor.position.y))
		actor.move_and_collide(actor.velocity*delta)
	
