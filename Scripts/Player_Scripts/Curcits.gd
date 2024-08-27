extends Area2D


func _on_body_entered(body):
	print(":o")
	if body.has_method("shop"):
		Global.curcits+=300
		queue_free()
