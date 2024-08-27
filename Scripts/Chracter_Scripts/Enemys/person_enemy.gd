extends CharacterBody2D
@onready var player:Node2D=get_tree().get_root().get_node(get_tree().current_scene.name+"/Player")
@onready var nav_agent = $NavigationAgent2D
@onready var shooting_cool_down = $ShootingCoolDown
@onready var  animation = $AnimatedSprite2D
@onready var main =get_tree().get_root().get_node("Level_"+str(2))
@onready var BULLET = load("res://Scences/Enemy/Person_enemy_bullet.tscn")
@onready var health = $Health
var shooting =false
var ACCEL = 50
var SPEED =100
var dead=false
var Health =3
func _ready():
	health.play("Max")
func _physics_process(delta: float) ->void:
	if !shooting and !dead:
		var dir=to_local(nav_agent.get_next_path_position()).normalized()
		velocity=velocity.lerp(dir*SPEED,ACCEL*delta)
		animation.play("Run")
		animation.flip_h = velocity.x < 0
		move_and_slide()
func _on_nav_timeout():
	makepath()
func makepath() ->void:
	nav_agent.target_position = player.global_position		
		
func take_damage():
	if Global.item[0]["Weapon"] =="Defualt":
		Health+=-1
	elif Global.item[0]["Weapon"] =="ShotGun":
		Health+=-3
	elif Global.item[0]["Weapon"] =="Sniper":
		Health+=-4
	elif Global.item[0]["Weapon"] == "Burst Shoty":
		Health+=-2
	elif Global.item[0]["Weapon"] =="Laser":
		Health+=-1
	elif Global.item[0]["Weapon"] =="RailGun":
		Health+=-5
	elif Global.item[0]["Weapon"] =="Ak-47":
		Health+=-2
	if Health >0 and Health !=3:
		health.play(str(Health,"HP"))
	elif Health <=0:
		health.play(str(Health,"HP"))
		dead=true
		animation.play("Death")
		await get_tree().create_timer(0.9).timeout
		print(Global.Room[Global.currentRoom]["Enemy"])
		Global.Room[Global.currentRoom]["Enemy"]-=1
		queue_free()

func _on_shooting_cool_down_timeout():
		var new_bullet = BULLET.instantiate()
		new_bullet.position =$".".global_position
		main.add_child.call_deferred(new_bullet)



func _on_detection_body_entered(body):
	if body.has_method("_player_take_damage") and !dead:
		animation.play("Shoot")
		shooting =true
		shooting_cool_down.start()
func _on_detection_body_exited(body):
	if body.has_method("_player_take_damage"):
		shooting_cool_down.stop()
		shooting=false
