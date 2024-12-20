extends Area2D
@onready var player:Node2D=get_tree().get_root().get_node(get_tree().current_scene.name+"/Player")
@onready var bullet = $Bullet
@onready var area_2d = $"."
var initialDirection=Vector2(Global.player.global_position)
var speed =100
var lerpFactor = 0.05
#inital bullet
func _ready():
	look_at(Global.player.global_position) #bullet goes to player
	bullet.play("bullet")
func _physics_process(delta):
	position = position.move_toward(initialDirection, delta * speed) #uses function to go to players last possition

func _on_body_entered(body): #destory on hit damage if player
	bullet.play("BulletDestroyed")
	await get_tree().create_timer(0.3).timeout
	queue_free()
	if body.has_method("_player_take_damage"):
		body._player_take_damage()


func _on_area_entered(area): #destory
	bullet.play("BulletDestroyed")
	await get_tree().create_timer(0.3).timeout
	queue_free()


func _on_timer_timeout(): #destory when timer ends for bullet basically lifetime
	bullet.play("BulletDestroyed")
	await get_tree().create_timer(0.3).timeout
	queue_free()
