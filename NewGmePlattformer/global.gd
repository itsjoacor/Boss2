extends Node

var gems_collected = 0
var current_level = 1
var is_muted := false


var elapsed_time := 0.0
var timer_running := false

func _process(delta):
	if timer_running:
		elapsed_time += delta

func start_timer():
	elapsed_time = 0.0
	timer_running = true

func stop_timer():
	timer_running = false

func get_formatted_time() -> String:
	var minutes = int(elapsed_time) / 60
	var seconds = int(elapsed_time) % 60
	return "%02d:%02d" % [minutes, seconds]


# Call this when starting a NEW GAME (not when changing levels)
func reset_gems():
	gems_collected = 0
	
func _ready():
	print("Global initialized - Level: ", current_level, " Gems: ", gems_collected)
	 
