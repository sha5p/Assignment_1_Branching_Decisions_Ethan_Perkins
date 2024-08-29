extends Control
@onready var options = $Options 
@onready var Main_Pause_Screen = $ColorRect

#sets pasued when pasue button is clicked and if menu then go to the menu 
var paused: bool =false:
	set=set_paused
func _ready():	
	connections()
func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("Pause"):
		paused =!paused
func set_paused(value:bool):
	paused =value
	get_tree().paused=paused
	self.visible=paused
func _on_resume_pressed():
	paused =false
func _on_setting_pressed():
	Main_Pause_Screen.visible=false
	options.visible=true

func _on_menu_pressed():
	var bullet=get_tree().get_nodes_in_group("bullet")
	for i in bullet:
		print(i)
		i.queue_free()
	Global.navcheck=true
	get_tree().paused=false
	get_tree().change_scene_to_file("res://Scences/Menu_Scences/main_menu.tscn")


func connections():
	#using a signal connection to turn on and off the settings visiblity
	#connection same as main menu
	options.exit_options_menu.connect(on_exit_options_menu) 
func on_exit_options_menu():
	Main_Pause_Screen.visible=true
	options.visible=false
