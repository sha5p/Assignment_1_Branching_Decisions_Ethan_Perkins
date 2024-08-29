extends Node2D
@onready var animation_player = $AnimationPlayer
@onready var camera = $Camera
var PLAYER = load("res://Scences/Player/Player.tscn")
@onready var _66x_66x_31 = $"66x66x31"
@onready var _66x_66x_32 = $"66x66x32"
@onready var _66x_66x_30 = $"66x66x30"
@onready var main =get_tree().get_root().get_node("Level_4")
@onready var camera_2d = $Camera2D
@onready var label = $Label
@onready var boom = $Boom
@onready var kobob = $Kobob
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

#sets values

func _ready():
	#makes sure you can only talk when all enemys killed and resets values via 
	Global.final=0
	Global.enemyFighting =true
	Dialogic.signal_event.connect(DialogicSignal)
	animation_player.play("Cut Scence")
	Dialogic.start("Final")
	Global.talking=true

func DialogicSignal(arugment: String):
	if arugment =="Camera":
		camera.play("Camera")
	if arugment =="End":
		var spawner=get_tree().get_nodes_in_group("Spawner")
		_66x_66x_30.visible=false
		_66x_66x_31.visible=false
		_66x_66x_32.visible=false
		for i in spawner:
			print(i)
			i.spawn()
		Global.talking=false
		camera_2d.enabled=false
	if arugment =="Bad Ending":
		get_tree().change_scene_to_file("res://Scences/Levels/bad_ending.tscn")
	if arugment =="Boom":
		camera_2d.enabled=true
		kobob.visible=false
		boom.visible=true
		boom.play("default")
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://Scences/Levels/good_ending.tscn")

		
func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("Talk") and Global.cantalk and Global.final==3:
		print(SaveData.end)
		Global.talking=true
		if SaveData.end==true:
			Dialogic.start("kobob_saved_good")
		if SaveData.end==false:
			Dialogic.start("kobob_saved_bad")
func _on_area_2d_body_entered(body):
	var talk = SaveSettings.config.get_value("keybinding", "Talk")
	label.visible=true
	label.text= "Cick: %s to talk" % [talk]
	Global.cantalk=true

func _on_area_2d_body_exited(body): #allows talking
	label.visible=false
	Global.cantalk=false





func _on_audio_stream_player_2d_finished(): #loops through music
	audio_stream_player_2d.play()
