extends Area2D

@export var target_level: int = 1  
@export var is_game_win_door := false 

signal player_entered

func _ready():

	collision_layer = 0   
	collision_mask = 4   
	
func _on_body_entered(body):
	if body.name == "Player":
		if is_game_win_door:
			get_tree().change_scene_to_file("res://Menu/Game Won/game_won.tscn") 
		else:
			player_entered.emit("res://Levels/level_%d.tscn" % target_level)
