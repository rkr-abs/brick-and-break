extends Node

var bg_intro=load("res://Audio/intro.wav")
var bg_loop=load("res://Audio/loop.ogg")
var bat=load("res://Audio/bathit.mp3")
var wall=load("res://Audio/wallhit.mp3")
var brick=load("res://Audio/brickDisappear.mp3")
var start=load("res://Audio/startBtn.mp3")

var audioArray={
	'Bat':bat,'wall-left':wall,
	'wall-right':wall,'wall-top':wall,
	'wall-bottom':wall,"ball":brick,
	'start':start
	}
	


func muteBus(bus_name):
	var thisBus=AudioServer.get_bus_index(bus_name)
	AudioServer.set_bus_mute(thisBus, not AudioServer.is_bus_mute(thisBus))
	

func playTheme():
	$AudioStreamPlayer.stream=bg_intro
	$AudioStreamPlayer.play()
	yield($AudioStreamPlayer,"finished")	
	$AudioStreamPlayer.stream=bg_loop
	$AudioStreamPlayer.play()
	
func playSFX(prop):
	var player=AudioStreamPlayer.new()
	add_child(player)
	if typeof(prop) == TYPE_STRING:
		player.stream=audioArray[prop]
	else:
		player.stream=audioArray[prop.name]
	player.bus="SFX"
	player.play()
	yield(player,"finished")
	remove_child(player)


   
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
