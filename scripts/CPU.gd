extends CharacterBody2D

func _physics_process(delta):
	if Global.ball != null:
		position.y = Global.ball.position.y
	pass
