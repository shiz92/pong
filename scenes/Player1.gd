extends StaticBody2D

var direction = Vector2()
var window_height : int
var player_height : int

# Called when the node enters the scene tree for the first time.
func _ready():
	window_height = get_viewport_rect().size.y
	player_height = $CollisionShape2D.shape.get_size().y
	
func _process(delta):
	var direction := Vector2(0,0)
	if Input.is_action_pressed("move_down"):
		direction.y += get_parent().PLAYER_SPEED * delta

	elif Input.is_action_pressed("move_up"):
		direction.y -= get_parent().PLAYER_SPEED * delta
	
	if direction.length() > 1.0:
		direction = direction.normalized()
	
	position += direction * delta * get_parent().PLAYER_SPEED
	position.y = clamp(position.y, player_height / 2, window_height - player_height / 2)
	print(position.y)
