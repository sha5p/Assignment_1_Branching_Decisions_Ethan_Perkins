extends Area2D
@onready var collision_shape_2d = $CollisionShape2D

func _ready():
	Dialogic.signal_event.connect(DialogicSignal)
func DialogicSignal(arugment: String):
	if arugment =="End":
		print("Global.talking=false")
		Global.talking=false
		collision_shape_2d.disabled=true
		await get_tree().create_timer(1).timeout
		collision_shape_2d.disabled=false

func _on_body_entered(body):
	Global.talking=true
	Dialogic.start("Tutorial")
