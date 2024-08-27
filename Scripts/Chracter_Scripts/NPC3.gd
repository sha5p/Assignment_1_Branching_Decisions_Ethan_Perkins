extends Node2D
@onready var collision_shape_2d = $Area2D/CollisionShape2D

func _ready():
	print(Global.Level)
	Dialogic.signal_event.connect(DialogicSignal)

	
func DialogicSignal(arugment: String):
	if arugment =="End":
		print("Global.talking=false")
		Global.talking=false
		collision_shape_2d.disabled=true
		await get_tree().create_timer(1).timeout
		collision_shape_2d.disabled=false

func _on_area_2d_body_entered(body):
	if body.has_method("shop") and Global.Level ==2:
		Dialogic.start("warning")
		Global.talking=true
	if body.has_method("shop") and Global.Level ==1:
		Dialogic.start("choice")
		Global.talking=true
