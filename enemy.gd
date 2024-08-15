extends CharacterBody2D
@export var player:Node2D
@onready var nav_agent = $NavigationAgent2D
@onready var shooting_cool_down = $ShootingCoolDown
@onready var  animation = $"66x66x30"
@onready var main =get_tree().get_root().get_node("World Map")
@onready var BULLET = load("res://Scences/Enemy/Enemy_Bullet.tscn")
var shooting =false
var ACCEL = 50
var SPEED =100
var dead=false
func _ready():
	pass
func _physics_process(delta: float) ->void:
	if !shooting and !dead:
		var dir=to_local(nav_agent.get_next_path_position()).normalized()
		velocity=velocity.lerp(dir*SPEED,ACCEL*delta)
		animation.play("walk")
		animation.flip_h = velocity.x < 0
		move_and_slide()
func _on_timer_timeout():
	makepath()
func makepath() ->void:
	nav_agent.target_position = player.global_position


func _on_shooting_cool_down_timeout():
		var new_bullet = BULLET.instantiate()
		new_bullet.position =$".".global_position
		main.add_child.call_deferred(new_bullet)
func take_damage():
	dead=true
	animation.play("Death")
	await get_tree().create_timer(0.9).timeout
	queue_free()


func _on_detection_body_entered(body):
	if body.has_method("_player_take_damage") and !dead:
		animation.play("Shooting")
		shooting =true
		shooting_cool_down.start()
func _on_detection_body_exited(body):
	if body.has_method("_player_take_damage"):
		shooting_cool_down.stop()
		shooting=false
