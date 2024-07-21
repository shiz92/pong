extends Control

@onready var playerScore = %Player1
@onready var player2Score = %Player2

func score():
	playerScore.text = str(Global.score[0])
	player2Score.text = str(Global.score[1])
