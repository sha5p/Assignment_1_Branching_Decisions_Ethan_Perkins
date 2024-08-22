extends Area2D
@onready var teleport = $Teleport
var telported =false
func _ready():
	teleport.play("Unacctive")
	print(Global.currentRoom)
func _on_body_entered(body):
	if body.has_method("_player_take_damage") and Global.Room[Global.currentRoom]["Enemy"]==0 and !telported:
		Global.room_entered.emit(self)
		teleport.play("Teleport")
		await get_tree().create_timer(1).timeout
		Global.Level=Global.Level+1
		get_tree().change_scene_to_file("res://Scences//Levels/Level_"+str(Global.Level)+".tscn")
		telported =true
		Global.currentRoom=Global.currentRoom+1
