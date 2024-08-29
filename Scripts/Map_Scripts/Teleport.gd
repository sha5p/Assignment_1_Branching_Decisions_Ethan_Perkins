extends Area2D
@onready var teleport = $Teleport
@export var telporter=false
var telported =false
#if telporter is a next level telporter it will telport when the mob count is zero and save values via save states
func _ready():
	teleport.play("Unacctive")
	if !telporter:
		teleport.play("Teleport")
		await get_tree().create_timer(1).timeout
		teleport.play("Unacctive")
func _on_body_entered(body): #saves values when telporting to the enxt level
	print(Global.upgrades)
	print(Global.Room[Global.currentRoom]["Enemy"])
	if body.has_method("_player_take_damage") and Global.Room[Global.currentRoom]["Enemy"]==0 and telporter:
		teleport.play("Teleport")
		await get_tree().create_timer(1).timeout
		Global.Level=Global.Level+1
		telported =true
		Global.currentRoom=Global.currentRoom+1
		if Global.upgrades[0]["FireRate"] > 0:
			SaveData.g_data[0]["FireRate"] = Global.upgrades[0]["FireRate"]
		if Global.upgrades[0]["Speed"] >0:
			SaveData.g_data[0]["Speed"]=Global.upgrades[0]["Speed"]
		if Global.upgrades[0]["Range"] >0:
				SaveData.g_data[0]["Range"]=Global.upgrades[0]["Range"]
		if Global.item[0]["Weapon"] =="LMG":
			SaveData.g_data[6]["FireRate"]=Global.items[4]["FireRate"]
			SaveData.g_data[6]["Speed"]=Global.items[4]["Speed"]
			SaveData.g_data[6]["Range"]=Global.items[4]["Range"]
		elif Global.item[0]["Weapon"]=="ShotGun":
			SaveData.g_data[6]["FireRate"]=Global.items[2]["FireRate"]
			SaveData.g_data[6]["Speed"]=Global.items[2]["Speed"]
			SaveData.g_data[6]["Range"]=Global.items[2]["Range"]
		elif Global.item[0]["Weapon"]=="Sniper":
			SaveData.g_data[6]["FireRate"]=Global.items[3]["FireRate"]
			SaveData.g_data[6]["Speed"]=Global.items[3]["Speed"]
			SaveData.g_data[6]["Range"]=Global.items[3]["Range"]	
				
				
				
				
		SaveData.g_data[1]["Weapon"]=Global.item[0]["Weapon"] 
		SaveData.g_data[2]["Shield"]=Global.item[1]["Shield"]
		SaveData.g_data[3]["Room"]=Global.currentRoom
		SaveData.g_data[3]["Level"]=Global.Level
		SaveData.g_data[4]["HP"]=Global.Health[0]["HP"]
		SaveData.g_data[5]["curcits"]=Global.curcits
		SaveData.save_data()
		get_tree().change_scene_to_file("res://Scences//Levels/Level_"+str(Global.Level)+".tscn")
	elif !telporter:
		pass
