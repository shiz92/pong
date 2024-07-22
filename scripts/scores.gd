extends Control

@onready var playerScore = %Player1
@onready var player2Score = %Player2

func _ready() -> void:
	Global.score_changed.connect(_on_score_changed)
	_on_score_changed()

func _on_score_changed() -> void:
	playerScore.text = str(Global.score[0])
	player2Score.text = str(Global.score[1])
