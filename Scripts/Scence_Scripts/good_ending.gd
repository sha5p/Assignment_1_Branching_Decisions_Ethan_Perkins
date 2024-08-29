extends Node2D
var MAIN_MENU = load("res://Scences/Menu_Scences/main_menu.tscn")
@onready var animation_player = $AnimationPlayer

func _ready():
	Fade.fade_in()
	animation_player.play("End")
	Dialogic.signal_event.connect(DialogicSignal)
	Dialogic.start("Ending_good")
func DialogicSignal(arugment: String):
	if arugment =="End":
		Global.navcheck=false
		SaveData.g_data[1]["Weapon"]="Defualt"
		Global.item[0]["Weapon"] ="Defualt"
		SaveData.g_data[2]["Shield"] =0
		Global.item[1]["Shield"]=0
		SaveData.g_data[3]["Room"]=0
		Global.currentRoom=0
		SaveData.g_data[3]["Level"]=0
		Global.Level=0
		SaveData.g_data[4]["HP"]=8
		Global.Health[0]["HP"]=8
		
		
		Global.upgrades["FireRate"] =0
		Global.upgrades["Speed"] =0
		Global.upgrades["Range"] =0
		SaveData.g_data[0]["FireRate"]=0
		SaveData.g_data[0]["Speed"]=0
		SaveData.g_data[0]["Range"]=0
		SaveData.g_data[5]["curcits"]=0
		Global.curcits=0
		SaveData.g_data[6]["FireRate"]=1
		SaveData.g_data[6]["Speed"]=300
		SaveData.g_data[6]["Range"]=0
		SaveData.save_data()
		SaveData.end=false
		SaveData.ending()
		get_tree().change_scene_to_packed(MAIN_MENU)		
