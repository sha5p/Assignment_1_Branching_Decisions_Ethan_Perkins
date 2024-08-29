extends Area2D


func _on_body_entered(body):
	print(":o")
	if body.has_method("shop"):
		Global.curcits+=150
		queue_free()
#add curcits if hit 
