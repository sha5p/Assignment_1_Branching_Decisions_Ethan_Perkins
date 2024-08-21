extends Sprite2D
@onready var Enemy = load("res://Scences/Enemy/enemy.tscn")
signal spawned(spawn)

func _ready():
	await get_tree().create_timer(2).timeout
	if Global.enemyFighting:
		spawn()
func spawn():
	var spawn=Enemy.instantiate()
	get_tree().get_root().call_deferred("add_child", spawn)
	spawn.global_position =global_position
