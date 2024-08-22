extends Area2D
@onready var teleport = $Teleport
@onready var defualt = $Defualt


func _on_body_entered(body):
	if body.has_method("_player_take_damage") and Global.Room[Global.currentRoom]["Enemy"]==0:
		Global.room_entered.emit(self)
		get_tree()
