extends Area2D
@onready var teleport = $Teleport
func _ready():
	teleport.play("Unacctive")

func _on_body_entered(body):
	if body.has_method("_player_take_damage") and Global.Room[Global.currentRoom]["Enemy"]==0:
		Global.room_entered.emit(self)
		teleport.play("Teleport")
		Global.Level=Global.Level+1
		await get_tree().create_timer(1).timeout
		get_tree().change_scene("res://Level_"+str(int(get_tree().current_scene.name)+1)+".tscn")
