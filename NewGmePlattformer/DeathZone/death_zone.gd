extends Area2D

func _ready():
	collision_layer = 0
	collision_mask = 4
	
func _on_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://Menu/Game Over/geme_over.tscn")
