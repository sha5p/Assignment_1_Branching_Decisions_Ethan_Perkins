extends Area2D
@onready var collision_shape_2d = $CollisionShape2D

func _ready():
	Dialogic.timeline_ended.connect(ended)
func ended():
	Dialogic.timeline_ended.disconnect(ended)
	collision_shape_2d.disabled=true
	await get_tree().create_timer(1).timeout
	collision_shape_2d.disabled=false
	Global.talking=false

func _on_body_entered(body):
	Global.talking=true
	Dialogic.start("Tutorial")
