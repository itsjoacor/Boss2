extends Node

var gems_collected = 0
var current_level = 1

func _ready():
	print("Global initialized - Level: ", current_level, " Gems: ", gems_collected)
