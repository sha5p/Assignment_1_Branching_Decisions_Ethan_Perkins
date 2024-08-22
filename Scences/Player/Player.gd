extends CharacterBody2D
@onready var timer = $Timer
var input: Vector2
@export var SPEED =300
@export var ACCEL =5
@onready var health = $CanvasLayer2/Health
var pause =false
func _ready():
	#$AnimatedSprite2D.play("idle")
	health.play(str(Global.Health[0]["HP"],"HP"))
	Global.player = self
func get_input():
	input.x=Input.get_action_strength("Right")-Input.get_action_strength("Left")
	input.y=Input.get_action_strength("Down")-Input.get_action_strength("Up")
	return input.normalized()
func _process(delta):
	var playerInput=get_input()
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
	Global.Health[0]["HP"]+=-1
	if Global.Health[0]["HP"] >0:
		health.play(str(Global.Health[0]["HP"],"HP"))
	else:
		$AnimatedSprite2D.play("Death")
		health.play("Dead")
func shop():
	pause=true
	$Pause.visible=true
		
