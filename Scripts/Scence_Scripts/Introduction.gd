extends Control
@onready var starting = $Starting
@onready var anim = $AnimationPlayer
@onready var space_travel = $SpaceTravel
@export var intro=preload("res://Scences/CutScences/CutScence.tscn")
@onready var zoom = $Zoom

func _ready():
	Dialogic.start("Misson_Briefing_intro1")
	Dialogic.signal_event.connect(DialogicSignal)

func DialogicSignal(arugment: String):
	if arugment== "Click":
		anim.play("Text_Fade_In")
	elif arugment =="Begin":
		$Label.visible=false
		anim.play("Camera_zoom")
		space_travel.play()
	elif arugment =="Map":
		$Label.visible=false
		zoom.play()
		$Timer.start()
		print("hello")
func _on_space_travel_finished():
	print("damnnnnnnnn")
	space_travel.playback_speed = 1.5


func _on_timer_timeout():
	print("hello")
	Fade.fade_in()
	get_tree().change_scene_to_packed(intro)
