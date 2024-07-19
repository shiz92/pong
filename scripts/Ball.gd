extends CharacterBody2D

var direction := Vector2()
var new_direction := Vector2()
var speed : int

func getInitialDirection():
	var new_direction := Vector2()
	new_direction.x = randi_range(1,-1)
	if new_direction.x == 0:
		new_direction.x = 0.6
	
	new_direction.y = randf_range(1, -1)
	return new_direction.normalized()

func initialBall():
	direction = getInitialDirection()
	speed = get_parent().ball_speed
	print(direction)
	print(speed)

func on_collision():
	pass

func _ready():
	initialBall()

func _physics_process(delta):
	velocity = Vector2(direction).normalized() * speed
	var collision = move_and_collide(velocity*delta)
	var collider
	#spaguetti code I don't fully understand
	if collision:
		collider = collision.get_collider()
		if collider == %Player1:
			velocity = velocity.bounce(collision.get_normal())
			move_and_collide(velocity*delta)
		elif collider == %Player2:
			velocity = velocity.bounce(collision.get_normal())
			move_and_collide(velocity*delta)
		elif collider == %Borders:
			velocity = velocity.bounce(collision.get_normal())
			move_and_collide(velocity*delta)
