extends Node

var gems_collected = 0
var current_level = 1
var is_muted := false


var time_remaining := 120.0
var timer_running := false
var time_up := false

var best_time := 9999999.0  
var best_gems := 0 

func _process(delta):
	if timer_running and not time_up:
		time_remaining -= delta
		if time_remaining <= 0:
			time_remaining = 0
			time_up = true
			timer_running = false
			get_tree().change_scene_to_file("res://Menu/Game Over/geme_over.tscn")

func start_timer():
	time_remaining = 120.0
	time_up = false
	timer_running = true

func stop_timer():
	timer_running = false

func get_formatted_time(time: float = -1.0) -> String:
	if time < 0:
		time = time_remaining
	var minutes := int(time / 60)
	var seconds := int(time) % 60
	var milliseconds := int((time - int(time)) * 100)
	return "%02d:%02d:%02d" % [minutes, seconds, milliseconds]

func reset_gems():
	gems_collected = 0
	
func _ready():
	pass
