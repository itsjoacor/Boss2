extends Area2D

func _ready():
	# Double-check layers
	collision_layer = 0
	collision_mask = 4
	print("DeathZone ready - Mask:", collision_mask)

func _on_body_entered(body):
	print("Collision with:", body.name)
	if body.name == "Player":
		await get_tree().create_timer(0.2).timeout  
		get_tree().change_scene_to_file("res://Menu/Game Over/geme_over.tscn")
