extends Control
@onready var starting = $Starting
@onready var anim = $AnimationPlayer
@export var level_0=preload("res://Scences/Levels/Level_0.tscn")
#plays inital cut scence
func _ready():
	Dialogic.start("Misson_Briefing_intro1")
	Dialogic.signal_event.connect(DialogicSignal)

func DialogicSignal(arugment: String):
	if arugment== "Click":
		anim.play("Text_Fade_In")
	elif arugment =="Begin":
		$Label.visible=false
		$Timer.start()


func _on_timer_timeout():
	Fade.fade_in()
	get_tree().change_scene_to_packed.call_deferred(level_0)
