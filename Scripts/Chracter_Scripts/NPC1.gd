extends Node2D
@onready var collision_shape_2d = $Area2D/CollisionShape2D


var count = 0
@onready var label = $Label
func _ready():
	Dialogic.signal_event.connect(DialogicSignal)
	
func DialogicSignal(arugment: String):
	print("Received argument:", arugment)
	if arugment =="End":
		print("Global.talking=false")
		Global.talking=false
		collision_shape_2d.disabled=true
		await get_tree().create_timer(1).timeout
		collision_shape_2d.disabled=false


func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("Talk") and Global.cantalk:
		Dialogic.start("Tutorial")
		Global.talking=true

func _on_area_2d_body_entered(body):
	var talk = SaveSettings.config.get_value("keybinding", "Talk")
	label.visible=true
	label.text= "Cick: %s to talk" % [talk]
	Global.cantalk=true
	

func _on_area_2d_body_exited(body):
	label.visible=false
	Global.cantalk=false
