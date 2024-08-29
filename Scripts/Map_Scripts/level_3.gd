extends Node2D
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

#fades in and countiues game audio loop
func _ready():
	Fade.fade_in()

func _on_audio_stream_player_2d_finished():
	audio_stream_player_2d.play()
