extends Sprite2D
@onready var Enemy = load("res://Scences/Enemy/enemy.tscn")
@onready var spawner = $"."

func _ready():
	pass

func spawn():
	if Global.enemyFighting:
		var spawning=Enemy.instantiate()
		get_tree().get_root().call_deferred("add_child", spawning)
		spawning.global_position =spawner.global_position
