extends Area2D
@onready var main = $Main
@onready var door = $Door
@onready var door_Collision = $CharacterBody2D/CollisionShape2D
@export var no_fighting=false
@onready var door_Collision_buttom = $CharacterBody2D/Buttom
@onready var door_Collision_top = $CharacterBody2D/top
@export var direction = ""

var opened:bool=false
func _ready():
	door_Collision_buttom.disabled=true
	door_Collision_top.disabled=true	
	door_Collision.disabled = true
	main.play("default")
	if no_fighting:
		door_Collision.disabled = false
	
func _on_body_entered(body):
	if "buttom" ==direction:
		door_Collision_buttom.set_deferred("disabled", false)    
	elif "top" ==direction:
		door_Collision_top.set_deferred("disabled", false)    
	if body.has_method("_player_take_damage") and !no_fighting:
		if Global.Room[Global.currentRoom]["Enemy"]==0:
			Global.enemyFighting =false
			door_Collision.set_deferred("disabled", true)    
		if !Global.enemyFighting:
			Global.room_entered.emit(self)
			door.play("open")
			main.visible=false
			door.visible= true
			await get_tree().create_timer(0.4).timeout
			door.play("opened")
	elif body.has_method("_player_take_damage") and no_fighting:
			print("work")
			door_Collision.set_deferred("disabled", true)    
			Global.room_entered.emit(self)
			door.play("open")
			main.visible=false
			door.visible= true
			await get_tree().create_timer(0.4).timeout
			door.play("opened")
func _on_body_exited(body):
	if body.has_method("_player_take_damage"):
		door.play("close")
		await get_tree().create_timer(0.4).timeout
		main.visible=true
		door.visible= false
		if Global.currentRoom ==0 and Global.Room[Global.currentRoom]["Enemy"]==1 and !Global.enemyFighting:
			Global.enemyFighting=true
			var spawner=get_tree().get_nodes_in_group("Spawner")
			for i in spawner:
				i.spawn()
		if Global.currentRoom ==1 and Global.Room[Global.currentRoom]["Enemy"]==2 and !Global.enemyFighting:
			Global.enemyFighting=true
			var spawner=get_tree().get_nodes_in_group("Spawner")
			for i in spawner:
				i.spawn()
		var doors= get_tree().get_nodes_in_group("Door")
		for i in doors:
			i.fight()
		if Global.currentRoom==2:
			door_Collision.set_deferred("disabled", true)    
			
func fight():
	door_Collision.disabled= false

