extends CanvasLayer

func _ready():
	$Options/Restart.grab_focus()
	
	await get_tree().process_frame
	$Tiempo.text = "Tiempo: " + Global.get_formatted_time()
	$Gemas.text = "Gemas: " + str(Global.gems_collected)
	Global.stop_timer()
	
	# Safely get the button
	var retry_button = $VBoxContainer/RetryButton
	
	if retry_button:
		retry_button.grab_focus()
	else:
		push_error("RetryButton not found! Check node path.")


func _on_quit_pressed() -> void:
		get_tree().quit()


func _on_restart_pressed() -> void:
	Global.elapsed_time = 0.0
	Global.start_timer()
	Global.gems_collected = 0  # Reset gems
	get_tree().change_scene_to_file("res://Levels/level_1.tscn")
