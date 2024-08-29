extends CharacterBody2D
@onready var player:Node2D=get_tree().get_root().get_node(get_tree().current_scene.name+"/Player")
@onready var nav_agent = $NavigationAgent2D
@onready var shooting_cool_down = $ShootingCoolDown
@onready var  animation = $"66x66x30"
@onready var main =get_tree().get_root().get_node("Level_"+str(Global.Level))
@onready var BULLET = load("res://Scences/Enemy/Enemy_Bullet.tscn")
@onready var health = $Health
@onready var CURCITS = load("res://Scences/Player/curcits.tscn")

var shooting =false
var ACCEL = 50
var SPEED =100 #Sets the values for movment and states
var dead=false
var Health =5
func _ready():
	health.play("Max")
func _physics_process(delta: float) ->void:
	if !shooting and !dead:
		#If the robot is out of the player range it will get the nav agent node to find a path towhere navagnet 
		#nav agent gets player posistion 
		var dir=to_local(nav_agent.get_next_path_position()).normalized()
		velocity=velocity.lerp(dir*SPEED,ACCEL*delta) 
		animation.play("walk")
		animation.flip_h = velocity.x < 0
		move_and_slide()
func _on_timer_timeout():
	makepath() #every 0.1 seconds find the players posistion
func makepath() ->void:
	if !Global.navcheck:
		nav_agent.target_position = player.global_position #Makes a path to the player
	else:
		pass #can get rid of

func _on_shooting_cool_down_timeout(): #When the timer cool down ends add a bullet to the scence
		var new_bullet = BULLET.instantiate()
		new_bullet.position =$".".global_position
		main.add_child.call_deferred(new_bullet)
func take_damage(): #change the damage taken depending on gun
	if Global.item[0]["Weapon"] =="Defualt":
		Health+=-1
	elif Global.item[0]["Weapon"] =="LMG":
		Health+=-1
	elif Global.item[0]["Weapon"] =="ShotGun":
		Health+=-2
	elif Global.item[0]["Weapon"] =="Sniper":
		Health+=-3
	elif Global.item[0]["Weapon"] == "Burst Shoty":
		Health+=-2
	elif Global.item[0]["Weapon"] =="Laser":
		Health+=-1
	elif Global.item[0]["Weapon"] =="RailGun":
		Health+=-5
	elif Global.item[0]["Weapon"] =="Ak-47":
		Health+=-2
	elif Global.item[0]["Weapon"] =="Bazooka":
		Health+=-4
	if Health >0 and Health !=5: #kill the robot
		health.play(str(Health,"HP"))
	elif Health <=0: #change states and add a circuit 
		health.play(str(0,"HP"))
		dead=true
		animation.play("Death")
		await get_tree().create_timer(0.9).timeout
		print(Global.Room[Global.currentRoom]["Enemy"])
		Global.Room[Global.currentRoom]["Enemy"]-=1
		var curcit = CURCITS.instantiate()
		curcit.position =$".".global_position
		main.add_child.call_deferred(curcit)
		Global.final+=1
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
