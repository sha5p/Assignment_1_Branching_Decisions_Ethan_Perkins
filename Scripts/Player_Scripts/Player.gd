extends CharacterBody2D
@onready var timer = $Timer
var input: Vector2
@export var SPEED =300
@export var ACCEL =5
@onready var health = $CanvasLayer2/Health
@onready var curcits = $CanvasLayer2/CircuitBoard/Label
@onready var shields = $CanvasLayer2/Shields


var pause =false
func _ready():
	#$AnimatedSprite2D.play("idle")
	shields.visible=false
	health.play(str(Global.Health[0]["HP"],"HP"))
	Global.player = self
	Global.enemyFighting=false
func get_input():
	curcits.visible=true
	input.x=Input.get_action_strength("Right")-Input.get_action_strength("Left")
	input.y=Input.get_action_strength("Down")-Input.get_action_strength("Up")
	return input.normalized()
func _process(delta):
	curcits.text="Current Curcits: "+str(Global.curcits)
	var playerInput=get_input()
	if Global.item[1]["Shield"] >0:
		shields.visible=true
		shields.play(str(Global.item[1]["Shield"]))
	if Global.item[1]["Shield"] ==0:
		shields.visible=false
	if Global.Health[0]["HP"] >0 and !Global.talking:
		if velocity.x != 0:
			$AnimatedSprite2D.play("Run")
			$AnimatedSprite2D.flip_h = velocity.x < 0
		elif velocity.y != 0:
			$AnimatedSprite2D.play("Run")
			$AnimatedSprite2D.flip_h = velocity.y > 0
		#print(playerInput)
	#lerp is linear interpolation it just smooths values
		velocity=lerp(velocity,playerInput*SPEED,delta*ACCEL)
		move_and_slide()
	elif Global.talking:
		$AnimatedSprite2D.play("idle")
	if pause ==true:
		pause=false
	health.play(str(Global.Health[0]["HP"],"HP"))
func _on_timer_timeout():
	$AnimatedSprite2D.stop()
func _player_take_damage():
	if Global.item[1]["Shield"] ==0:
		Global.Health[0]["HP"]+=-1
	elif Global.item[1]["Shield"] >0:
		shields.play(str(Global.item[1]["Shield"]))
		Global.item[1]["Shield"]+=-1
	if Global.Health[0]["HP"] >0:
		health.play(str(Global.Health[0]["HP"],"HP"))
	else:
		$AnimatedSprite2D.play("Death")
		health.play("Dead")
func shop():
	$CanvasLayer2/CircuitBoard/Label.visible=false
	pause=true
	$Pause.visible=true
		
