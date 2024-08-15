extends Sprite2D
@onready var main = $Door/Main
@onready var door = $Door/Door
func _ready():
	main.play("default")

func _on_body_entered(body):
	main.visible=false
	if body.has_method("_player_take_damage"):
		Global.curcits +=100
		door.play("open")

func _on_body_exited(body):
	main.visible=false
	if body.has_method("_player_take_damage"):
		Global.curcits +=100
		door.play("close")
		await get_tree().create_timer(1).timeout
		main.visible=true
