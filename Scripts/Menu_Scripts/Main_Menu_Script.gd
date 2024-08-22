extends Control
@onready var setting_button = $MarginContainer/HBoxContainer/VBoxContainer/Setting_Button
@onready var options = $Options 
@onready var margin_container = $MarginContainer
@export var MAP=preload("res://Scences/Levels/Tutorial.tscn")

func _ready():
	#_load_keybindings_from_setting()
	connections()
func on_exit_options_menu():
	margin_container.visible = true
	options.set_process(false)
	options.visible = false
func connections(): #connecyts a signal for visbiblity change
	options.exit_options_menu.connect(on_exit_options_menu) 

func _on_setting_button_pressed():
	margin_container.visible = false
	options.set_process(true)
	margin_container.set_process(false)
	options.visible = true


func _on_to_main_map_pressed():
	get_tree().change_scene_to_packed(MAP)
