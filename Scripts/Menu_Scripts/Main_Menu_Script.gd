extends Control
@onready var setting_button = $MarginContainer/HBoxContainer/VBoxContainer/Setting_Button
@onready var options = $Options 
@onready var margin_container = $MarginContainer
@export var choose=preload("res://Options_Game_Countiues.tscn")
@onready var forward_btn = $ForwardBtn
@onready var settings_btn = $SettingsBtn
@onready var exit_btn = $ExitBtn
@onready var audio_stream_player_2d_2 = $AudioStreamPlayer2D2

func _ready():
	#_load_keybindings_from_setting()
	connections()
func on_exit_options_menu():
	margin_container.visible = true
	forward_btn.visible = true
	settings_btn.visible = true
	exit_btn.visible = true
	options.set_process(false)
	options.visible = false
func connections(): #connecyts a signal for visbiblity change
	options.exit_options_menu.connect(on_exit_options_menu) 

func _on_button_button_down():
	get_tree().change_scene_to_packed(choose)


func _on_button_pressed():
	margin_container.visible = false
	options.set_process(true)
	margin_container.set_process(false)
	forward_btn.visible = false
	settings_btn.visible = false
	exit_btn.visible = false
	forward_btn.set_process(false)
	forward_btn.set_process(false)
	settings_btn.set_process(false)
	options.visible = true


func _on_exit_pressed():
	get_tree().quit()


func _on_audio_stream_player_2d_2_finished():
	audio_stream_player_2d_2.play()
