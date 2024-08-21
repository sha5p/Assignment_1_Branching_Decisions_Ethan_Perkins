extends Sprite2D
@onready var Enemy = load("res://Scences/Enemy/enemy.tscn")
signal spawned(spawn)

func _ready():
	pass

func spawn():
	if Global.enemyFighting:
		var spawn=Enemy.instantiate()
		get_tree().get_root().call_deferred("add_child", spawn)
		spawn.global_position =global_position
