extends Area2D
@onready var teleport = $Teleport
@export var telporter=false
var telported =false
func _ready():
	teleport.play("Unacctive")
	print(Global.currentRoom)
	if !telporter:
		teleport.play("Teleport")
		await get_tree().create_timer(1).timeout
		teleport.play("Unacctive")
func _on_body_entered(body):
	if body.has_method("_player_take_damage") and Global.Room[Global.currentRoom]["Enemy"]==0 and !telported and telporter:
		teleport.play("Teleport")
		await get_tree().create_timer(1).timeout
		Global.Level=Global.Level+1
		get_tree().change_scene_to_file("res://Scences//Levels/Level_"+str(Global.Level)+".tscn")
		telported =true
		Global.currentRoom=Global.currentRoom+1
		SaveData.g_data[0]=Global.upgrades
		SaveData.g_data[1]["Weapon"]=Global.item[0]["Weapon"] 
		SaveData.g_data[2]["Shield"]=Global.item[1]["Shield"]
		SaveData.g_data[3]["Room"]=Global.currentRoom
		SaveData.g_data[3]["Level"]=Global.Level
		SaveData.g_data[4]["HP"]=Global.Health[0]["HP"]
		SaveData.save_data()
	elif !telporter:
		print("works")
