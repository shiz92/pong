class_name Ball
extends CharacterBody2D

var direction := Vector2()
var new_direction := Vector2()
var speed : int
var motion
var collision
var score = [0,0]

func _ready():
	initialBall()

func _physics_process(delta):
	velocity = Vector2(direction).normalized() * speed
	
	motion = velocity*delta
	var collision = move_and_collide(motion)
	while collision:
		motion = collision.get_remainder()
		motion = motion.bounce(collision.get_normal())
		direction = motion.normalized()
		collision = move_and_collide(motion)

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

func _on_scoring_body_entered(body):
	score[0] += 1
	print(score)

func _on_scoring_2_body_entered(body):
	score[1] += 1
	print(score)
