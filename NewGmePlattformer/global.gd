extends Node

var gems_collected = 0
var current_level = 1

# Call this when starting a NEW GAME (not when changing levels)
func reset_gems():
	gems_collected = 0
	
func _ready():
	print("Global initialized - Level: ", current_level, " Gems: ", gems_collected)
	 



func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		print("🛑 PRESSED P — paused =", get_tree().paused)
		if get_tree().paused:
			_resume_game()
		else:
			_pause_game()

func _pause_game() -> void:
	get_tree().paused = true


func _resume_game() -> void:
	get_tree().paused = false
