extends Camera2D
@onready var player = $".."

func _ready()->void:
	Global.room_entered.connect(func(room):
		global_position=room.global_position
		
	)
