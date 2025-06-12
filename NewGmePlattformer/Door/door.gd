extends Area2D

@export var target_level: int = 1  # Default to level 1
@export var is_game_win_door := false  # New export variable

signal player_entered

func _ready():
	# Configure door to ONLY detect the player (layer 4)
	collision_layer = 0   # Door doesn't exist on any layer
	collision_mask = 4    # Detects layer 4 (player)
	
func _on_body_entered(body):
	if body.name == "Player":
		if is_game_win_door:
			get_tree().change_scene_to_file("res://Menu/Game Won/game_won.tscn")  # Special win scene
		else:
			player_entered.emit("res://Levels/level_%d.tscn" % target_level)
