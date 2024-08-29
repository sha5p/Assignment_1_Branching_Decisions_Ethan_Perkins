extends Area2D
var distance=200
@onready var shot_gun = $CollisionShape2D/ShotGun
@onready var defualt = $CollisionShape2D/AnimatedSprite2D
@onready var bazoka = $CollisionShape2D/Bazoka
@onready var laser = $CollisionShape2D/Laser
@onready var auto_aim = $CollisionShape2D/Bazoka/AutoAim/CollisionPolygon2D
var target=null
@export var bullet_speed=200

#The bullet propities are altered by the weapon and the upgrade 
func _ready():
	if Global.item[0]["Weapon"] !="Defualt":
		if Global.item[0]["Weapon"] =="LMG":
			bullet_speed=Global.items[4]["Speed"]
			distance=Global.items[4]["Range"]	
			defualt_vis()
			$AnimationPlayer.play("Bullet")
		elif Global.item[0]["Weapon"]=="Sniper":
			defualt_vis()
			bullet_speed=Global.items[3]["Speed"]
			$AnimationPlayer.play("Bullet")
			distance=Global.items[3]["Range"]
		elif Global.item[0]["Weapon"]=="ShotGun":
			bullet_speed=Global.items[2]["Speed"]
			distance=Global.items[2]["Range"]
			shot_gun.play("Shotgun")
			auto_aim.disabled = true
			defualt.visible=false
			$CollisionShape2D.scale=Vector2(2,2)
			shot_gun.visible=true
		elif Global.item[0]["Weapon"]=="Burst Shoty":
			bullet_speed=500
			distance=300
			shot_gun.play("Shotgun")
			auto_aim.disabled = false
			defualt.visible=false
			$CollisionShape2D.scale=Vector2(2,2)
			shot_gun.visible=true
		elif Global.item[0]["Weapon"]=="Bazooka":
			bullet_speed=300
			distance=0
			bazoka.play("Rocket")
			defualt.visible=false
			auto_aim.disabled =false
			$CollisionShape2D.scale=Vector2(3,3)
			bazoka.visible=true
		elif Global.item[0]["Weapon"]=="RailGun":
			bullet_speed=0
			distance=0
			defualt_vis()
		elif Global.item[0]["Weapon"]=="Laser":
			laser.visible=true
		elif Global.item[0]["Weapon"]=="Ak-47":
			bullet_speed=Global.items[4]["Speed"]
			distance=Global.items[4]["Range"]	
			defualt_vis()
			$AnimationPlayer.play("Bullet")
	else:
		defualt_vis()
		bullet_speed=200
		distance=200
		$AnimationPlayer.play("Bullet")
func defualt_vis():
	auto_aim.disabled = true
	defualt.visible=true
	bazoka.visible=false
	laser.visible=false
	shot_gun.visible=false
	$CollisionShape2D.scale=Vector2(1,1)
func _physics_process(delta): #distance equal to save states for weapon 

	if distance <700:
		var direction=Vector2.RIGHT.rotated(rotation)
		distance+=bullet_speed*delta
		position+= direction*bullet_speed*delta
		if target:
			look_at(target.global_position)
	elif distance >699:
		defualt_vis()
		$AnimationPlayer.play("BulletDestroyed")
		await get_tree().create_timer(1).timeout
		queue_free()
	
	
func _on_body_entered(body):   #when the bullet enters an enemy deal damage if it hits anything else destroy bit of delay gains perce
	defualt_vis()
	
	$AnimationPlayer.play("BulletDestroyed")
	if body.has_method("take_damage"):
		body.take_damage()
	await get_tree().create_timer(0.4).timeout
	queue_free()
func _on_area_entered(area):
	$AnimationPlayer.play("BulletDestroyed")
	await get_tree().create_timer(0.4).timeout
	queue_free()


func _on_auto_aim_body_entered(body):
	print("target"+body)
	if body.has_method("take_damage"):
		print("target")
		target=body
