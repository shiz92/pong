extends CharacterBody2D

@export var is_cpu: bool = false

var ball: Ball

const CPU_BEHAVIOR = preload("res://scenes/cpu_behavior.tscn")
const PLAYER_BEHAVIOR = preload("res://scenes/player_behavior.tscn")

func _ready() -> void:
	if is_cpu:
		add_child(CPU_BEHAVIOR.instantiate())
	else:
		add_child(PLAYER_BEHAVIOR.instantiate())

func _physics_process(delta):
	pass
