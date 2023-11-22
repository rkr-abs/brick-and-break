extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 400
var screen_size 

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var movement = Vector2.ZERO
	
	if Input.is_action_pressed("move_left"):
		movement.x -= 3
		
	if Input.is_action_pressed("move_right"):
		movement.x += 3
	
	position += movement
	position.x = clamp(position.x, -30, screen_size.x)

