extends Area2D
@onready var main = $Main
@onready var door = $Door
@onready var door_Collision = $CharacterBody2D/CollisionShape2D

var opened:bool=false
func _ready():
	door_Collision.disabled = true
	main.play("default")
	
func collision_change(): 
	door_Collision.disabled = true
func _on_body_entered(body):
	print(Global.Room[Global.currentRoom]["Enemy"])
	if body.has_method("_player_take_damage"):
		if Global.Room[Global.currentRoom]["Enemy"]==0:
			Global.enemyFighting =false
			door_Collision.set_deferred("disabled", true)    
		if !Global.enemyFighting:
			Global.room_entered.emit(self)
			door.play("open")
			main.visible=false
			Global.curcits +=100
			door.visible= true
			await get_tree().create_timer(0.4).timeout
			door.play("opened")
func _on_body_exited(body):
	if body.has_method("_player_take_damage"):
		await get_tree().create_timer(0.4).timeout
		door_Collision.disabled= false
		main.visible=true
		door.visible= false
		Global.curcits +=100
		door.play("close")
		if Global.currentRoom ==0 and Global.Room[Global.currentRoom]["Enemy"]==1 and !Global.enemyFighting:
			Global.enemyFighting=true
			var spawner=get_tree().get_nodes_in_group("Spawner1")
			for i in spawner:
				i.spawn()
