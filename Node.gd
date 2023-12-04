extends Node

export(PackedScene) var brick_scene
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func create_brick():
	for br in range(0,5):
		var brick = brick_scene.instance()
		brick.position = Vector2(300 * br,-100) 
		add_child(brick)
	
	
	

# Called when the node enters the scene tree for the first time.
func _ready():
	create_brick()
	$BGMusic.play()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func new_game():
	GlobalVariables.score = 0
	create_brick()
	$ball/CanvasLayer.update_score(GlobalVariables.score)
	$Bat.show()
	$Bat.position = Vector2.ZERO
	$ball.show()
	$ball._new_game()  # Replace with function body.
	


func _on_ball_game_over():
	$Bat.hide()
	get_tree().call_group("bricks", "queue_free")
	$ball/CanvasLayer.show_game_over() # Replace with function body.


var music_bus=AudioServer.get_bus_index("Music")


func _on_CheckButton_pressed():
	AudioServer.set_bus_mute(music_bus, not AudioServer.is_bus_mute(music_bus))
