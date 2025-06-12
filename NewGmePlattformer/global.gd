extends Node

var gems_collected = 0
var current_level = 1

# Call this when starting a NEW GAME (not when changing levels)
func reset_gems():
	gems_collected = 0
	
func _ready():
	print("Global initialized - Level: ", current_level, " Gems: ", gems_collected)
	 
