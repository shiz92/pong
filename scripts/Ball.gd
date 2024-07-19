class_name Ball
extends CharacterBody2D

var direction := Vector2()
var new_direction := Vector2()
var speed : int

func _ready():
	initialBall()

func _physics_process(delta):
	velocity = Vector2(direction).normalized() * speed
	
	var motion = velocity*delta
	var collision = move_and_collide(motion)
	while collision:
		motion = collision.get_remainder()
		motion = motion.bounce(collision.get_normal())
		
		direction = motion.normalized()
		
		collision = move_and_collide(motion)
	
	#var collider
	##spaguetti code I don't fully understand
	#if collision:
		#collider = collision.get_collider()
		#if collider == %Player1 or %Player2:
			#velocity -= velocity 
			#move_and_collide(velocity*delta)
		#elif collider == %Borders:
			#velocity -= velocity
			#move_and_collide(velocity*delta)
			##outOfBound()
		#elif collider ==  %WallScore:
			#velocity -= velocity
			#move_and_collide(velocity*delta)
			##queue_free and respawn the ball after timer 1s

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

func outOfBound():
	# if ball is out of bound (position.x/y) then queue_free and initball()
	pass
