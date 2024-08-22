extends Area2D
var CanShoot=true
@export var bullet_speed=300
var velocity=Vector2(1,0)

@onready var BULLET = load("res://Scences/Player/bullet.tscn")
@onready var bullet_spawn = $WeaponPivot/BulletSpawn
@onready var Sniper = $WeaponPivot/Sniper
@onready var LMG = $WeaponPivot/LMG
@onready var ShotGun = $WeaponPivot/ShotGun
@onready var pistol = $WeaponPivot/Pistol
@onready var ak_47 = $"Ak-47"
@onready var laser = $Laser
@onready var rail_gun = $RailGun
@onready var burst_shoty = $"Burst Shoty"
@onready var bazoka = $Bazoka

@onready var burst_shot_gun = $WeaponPivot/BurstShotGun
@onready var burst_shot_gun_2 = $WeaponPivot/BurstShotGun2



@onready var timer = $Timer
func _physics_process(delta):
	look_at(get_global_mouse_position())
	if CanShoot and !Global.talking:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			if Global.item[0]["Weapon"] =="Laser":
				$Laser2.visible=true
			else:
				shoot()
		else:
			$Laser2.visible=false
	if Global.item[0]["Weapon"] !="Defualt":
		if Global.item[0]["Weapon"] =="LMG":
			timer.wait_time=Global.items[4]["FireRate"]
			LMG.visible=true
			ShotGun.visible=false
			Sniper.visible=false
			burst_shoty.visible=false
			ak_47.visible=false
			laser.visible=false
			rail_gun.visible=false
			bazoka.visible=false
		elif Global.item[0]["Weapon"]=="ShotGun":
			timer.wait_time=Global.items[2]["FireRate"]
			LMG.visible=false
			ShotGun.visible=true
			Sniper.visible=false
			burst_shoty.visible=false
			ak_47.visible=false
			laser.visible=false
			rail_gun.visible=false
			bazoka.visible=false
		elif Global.item[0]["Weapon"]=="Sniper":
			timer.wait_time=Global.items[3]["FireRate"]
			LMG.visible=false
			ShotGun.visible=false
			Sniper.visible=true
			burst_shoty.visible=false
			ak_47.visible=false
			laser.visible=false
			rail_gun.visible=false
			bazoka.visible=false
		elif Global.item[0]["Weapon"] =="Burst Shoty":
			timer.wait_time=0.3
			LMG.visible=false
			ShotGun.visible=false
			Sniper.visible=false
			burst_shoty.visible=true
			ak_47.visible=false
			laser.visible=false
			rail_gun.visible=false
			bazoka.visible=false
		elif Global.item[0]["Weapon"] =="Bazooka":
			timer.wait_time=0.7
			LMG.visible=false
			ShotGun.visible=false
			Sniper.visible=false
			ak_47.visible=false
			laser.visible=false
			rail_gun.visible=false
			burst_shoty.visible=false
			bazoka.visible=true
		elif Global.item[0]["Weapon"] =="RailGun":
			timer.wait_time=0.9
			LMG.visible=false
			ShotGun.visible=false
			Sniper.visible=false
			ak_47.visible=false
			laser.visible=false
			rail_gun.visible=true
			burst_shoty.visible=false
			bazoka.visible=false
		elif Global.item[0]["Weapon"] =="Laser":
			timer.wait_time=1
			LMG.visible=false
			ShotGun.visible=false
			Sniper.visible=false
			ak_47.visible=false
			laser.visible=true
			rail_gun.visible=false
			burst_shoty.visible=false
			bazoka.visible=false
		elif Global.item[0]["Weapon"] =="Ak-47":
			timer.wait_time=0.2
			LMG.visible=false
			ShotGun.visible=false
			Sniper.visible=false
			ak_47.visible=true
			laser.visible=false
			rail_gun.visible=false
			burst_shoty.visible=false
			bazoka.visible=false
		pistol.visible=false
	else:
		timer.wait_time=1
		pistol.visible=true
func shoot():
	var new_bullet = BULLET.instantiate()
	new_bullet.position =bullet_spawn.global_position
	new_bullet.rotation =bullet_spawn.global_rotation
	if Global.item[0]["Weapon"] =="Burst Shoty":
		new_bullet.position =burst_shot_gun.global_position
		new_bullet.rotation =burst_shot_gun.global_rotation
		get_tree().get_root().call_deferred("add_child", new_bullet)
		var burstbullet = BULLET.instantiate()
		burstbullet.position= burst_shot_gun_2.global_position
		burstbullet.rotation= burst_shot_gun_2.global_rotation
		get_tree().get_root().call_deferred("add_child", burstbullet)
	else:
		get_tree().get_root().call_deferred("add_child", new_bullet)
	CanShoot=false
	timer.start()

func _on_timer_timeout():
	CanShoot=true

