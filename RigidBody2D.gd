extends RigidBody2D
signal game_over

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var velocity = get_linear_velocity()
var original_position = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	set_bounce(1)
	original_position = global_position



func _process(delta):
	pass

func _new_game():
	 position = original_position


func _on_VisibilityNotifier2D_viewport_exited(viewport):
	emit_signal("game_over") # Replace with function body.








func _on_ball_body_entered(body):
	
	var bodies=get_colliding_bodies()	
	if body.name=="Bat":
		$BatHitAudio.play()
	elif body.name.substr(0,4)=="wall":
		$WallHitAudio.play()
	
	
	
