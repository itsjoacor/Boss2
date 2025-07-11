extends Node

var gems_collected = 0
var current_level = 1
var is_muted := false


var elapsed_time := 0.0
var timer_running := false


var best_time := 9999999.0  
var best_gems := 0 

func _process(delta):
	if timer_running:
		elapsed_time += delta

func start_timer():
	elapsed_time = 0.0
	timer_running = true

func stop_timer():
	timer_running = false

func get_formatted_time(time: float = -1.0) -> String:
	if time < 0:
		time = elapsed_time
	var minutes := int(time / 60)
	var seconds := int(time) % 60
	var milliseconds := int((time - int(time)) * 100)
	return "%02d:%02d:%02d" % [minutes, seconds, milliseconds]



func reset_gems():
	gems_collected = 0
	
func _ready():
	print("Global initialized - Level: ", current_level, " Gems: ", gems_collected)
