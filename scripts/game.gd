extends Sprite2D

@export var player_speed : int = 100
@export var ball_speed : int = 100

const BALL = preload("res://scenes/ball.tscn")

func createBall():
	var newBall = BALL.instantiate()
	add_child(newBall)
	
	for paddle in get_tree().get_nodes_in_group("paddle"):
		print(paddle)
		paddle.ball = newBall

func _ready():
	createBall()
