extends CanvasLayer

signal start_game



# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func show_message(text):
	$Message.text = text
	$Message.show()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	$StartButton.hide() # Replace with function body.
	
func update_score(score):
	print(score)
	$ScoreLabel.text = str(score)
	$ScoreLabel.show()
	
func show_game_over():
	show_message("Game Over")
	$StartButton.show()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ScoreLabel.text = str(GlobalVariables.score)


func _on_Button_pressed():
	$StartButton.hide()
	$Message.hide()
	$Srart_Btn_Audio.play()
	emit_signal("start_game")  
	


