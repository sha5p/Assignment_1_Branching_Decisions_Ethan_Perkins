extends RayCast2D

const maxrange=1500

var base_width=24
var widthy=base_width
@onready var collision = $Line2D/DamageArea/CollisionShape2D
#add laser to wherever the raycast
func _ready():
	pass
func _physics_process(delta):
	if Global.item[0]["Weapon"] !="Laser":
		$Line2D/DamageArea/CollisionShape2D.disabled = true  
	else:
		$Line2D/DamageArea/CollisionShape2D.disabled = false  
	if $".".is_colliding():
		$Line2D.set_point_position(1,$Line2D.to_local($".".get_collision_point()))
	else:
		$Refrence.global_position=$".".target_position
		$Line2D.points[1]=$Refrence.global_position
	collision.shape.b= $Line2D.points[1]
func _on_damage_area_area_entered():
	pass


func _on_damage_area_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage()
	await get_tree().create_timer(0.4).timeout
