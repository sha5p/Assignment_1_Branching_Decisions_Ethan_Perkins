extends Area2D
var distance=0

@export var bullet_speed=300
@onready var nav_agent = $NavigationAgent2D
@onready var bullet = $AnimatedSprite2D
func _ready():
	$AnimatedSprite2D.play("Bullet")
func _physics_process(delta):
		var dir=to_local(nav_agent.get_next_path_position()).normalized()
		position+=dir*bullet_speed*delta
func _on_timer_timeout():
	makepath()
func makepath() ->void:
	nav_agent.target_position = Global.player.global_position




func _on_body_entered(body):
	bullet.play("BulletDestroyed")
	await get_tree().create_timer(0.3).timeout
	queue_free()
	if body.has_method("_player_take_damage"):
		body._player_take_damage()


func _on_area_entered(area):
	bullet.play("BulletDestroyed")
	await get_tree().create_timer(0.3).timeout
	queue_free()
