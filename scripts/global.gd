extends Node

signal score_changed

var score = [0,0]

func add_score(player: int, amount: int):
	score[player] += amount
	score_changed.emit()

