extends Area2D

@export var isScorePlayer : bool
@export var gameMain: Node

@onready var timer = $Timer

func _on_body_entered(body):
	if body is Ball:
		Engine.time_scale = 0.5
		
		if isScorePlayer == true:
			Global.add_score(1, 1)
		else:
			Global.add_score(0, 1)
		
		body.queue_free()
		timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1.0
	gameMain.createBall()
	
