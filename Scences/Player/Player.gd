extends CharacterBody2D
@onready var timer = $Timer
var input: Vector2
@export var SPEED =300
@export var ACCEL =5
@onready var health = $CanvasLayer2/Health
var Health=8
var pause =false
func _ready():
	#$AnimatedSprite2D.play("idle")
	Global.player = self
func get_input():
	input.x=Input.get_action_strength("Right")-Input.get_action_strength("Left")
	input.y=Input.get_action_strength("Down")-Input.get_action_strength("Up")
	return input.normalized()
func _process(delta):
	var playerInput=get_input()
	if Health >0 and !Global.talking:
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
	if pause ==true:
		pause=false
func _on_timer_timeout():
	$AnimatedSprite2D.stop()
func _player_take_damage():
	Health+=-1
	Global.Health[0]["HP"]+=-1
	if Health >0:
		health.play(str(Health,"HP"))
	else:
		$AnimatedSprite2D.play("Death")
		health.play("Dead")
func shop():
	pause=true
	$Pause.visible=true
		
