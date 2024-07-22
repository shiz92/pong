extends Area2D

@onready var timer = $Timer
@export var isScorePlayer : bool
@onready var gameMain = $"../.."

func _on_body_entered(body):
	if body is Ball:
		Engine.time_scale = 0.5
		if isScorePlayer == true:
			Global.score[0] += 1
		else:
			Global.score[1] += 1

		body.queue_free()
		timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1.0
	gameMain.createBall()
	
