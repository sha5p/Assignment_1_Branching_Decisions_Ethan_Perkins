extends Sprite2D
@onready var Enemy = load("res://Scences/Enemy/enemy.tscn")
@onready var spawner = $"."
#if fighting is true then spawn a mob enemy note this could have also checked type of enemy but was not needed
func _ready():
	pass

func spawn():
	if Global.enemyFighting:
		var spawning=Enemy.instantiate()
		get_tree().get_root().call_deferred("add_child", spawning)
		spawning.global_position =spawner.global_position
