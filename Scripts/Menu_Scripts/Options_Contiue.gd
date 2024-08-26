extends Control
@export var intro=preload("res://Scences/CutScences/Introduction.tscn")
@onready var countiue = $MarginContainer/VBoxContainer/Countiue


func _ready():
	Global.navcheck =false
	if Global.Level ==0:
		countiue.visible=false
func _on_countiue_pressed():
	print(Global.Level)
	if Global.Level >0:
		get_tree().change_scene_to_file("res://Scences//Levels/Level_"+str(Global.Level)+".tscn")
		

func _on_new_pressed():
	Global.navcheck=false
	SaveData.g_data[0]={
		"FireRate":0,
		"Speed":0,
		"Range": 0,
	}
	Global.upgrades ={
		"FireRate":0,
		"Speed":0,
		"Range": 0,
	}
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
	SaveData.save_data()
	get_tree().change_scene_to_packed(intro)
