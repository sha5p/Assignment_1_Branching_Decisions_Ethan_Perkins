extends Control
@export var intro=preload("res://Scences/CutScences/Introduction.tscn")
@onready var countiue = $MarginContainer/VBoxContainer/Countiue
@onready var audio_stream_player_2d_2 = $AudioStreamPlayer2D2

#contiue button is visible if the level is greater then 1 and if countiue next scence
func _ready():
	if Global.Level ==0:
		countiue.visible=false
func _on_countiue_pressed():
	Global.navcheck=false
	print(Global.Level)
	if Global.Level >0:
		get_tree().change_scene_to_file("res://Scences//Levels/Level_"+str(Global.Level)+".tscn")
		
#If instead a new game is chosen then reset all of the save state values
func _on_new_pressed():
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
	get_tree().change_scene_to_packed(intro)


func _on_audio_stream_player_2d_2_finished():
	audio_stream_player_2d_2.play()
