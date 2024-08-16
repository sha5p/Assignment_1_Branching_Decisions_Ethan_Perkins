extends Node2D
var Fade:float = 5.0
var ShakeRandom:float =30.0
var shaking:bool=true
var rng= RandomNumberGenerator.new()

var shake_strength: float =0.0

func apply_shake():
	shake_strength= ShakeRandom
func _process(delta):
	if shaking:
		apply_shake()
	if shake_strength>0:
		shake_strength=lerpf(shake_strength,0,Fade*delta)
		$Camera2D.offset =Offset()
func Offset() ->Vector2:
	return Vector2(rng.randf_range(-shake_strength,shake_strength), rng.randf_range(-shake_strength,shake_strength))

func _on_shaking_timeout():
	shaking=false
