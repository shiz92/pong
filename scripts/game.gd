extends Sprite2D

@export var player_speed : int = 100
@export var ball_speed : int = 100
var ball = preload("res://scenes/ball.tscn")

func createBall():
	var newBall = ball.instantiate()
	add_child(newBall)
	Global.ball = newBall 
	$Scores.score()

func _ready():
	createBall()
