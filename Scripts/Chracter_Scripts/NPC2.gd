extends Area2D
@onready var collision_shape_2d = $CollisionShape2D
#if colliding if the npc and the talk button is pressed start the dialogue 
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

func _on_body_entered(body):
	var talk = SaveSettings.config.get_value("keybinding", "Talk")
	label.visible=true
	label.text= "Cick: %s to talk" % [talk]
	Global.cantalk=true
func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("Talk"):
		print("debug")
		print(Global.cantalk)
	if event.is_action_pressed("Talk") and Global.cantalk:
		Dialogic.start("Tutorial")
		
func _on_body_exited(body):
	label.visible=false
	Global.cantalk=false
