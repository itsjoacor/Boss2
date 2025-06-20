extends CanvasLayer

func _ready():
	# Wait until the scene is fully ready
	await get_tree().process_frame
	
	# Safely get the button
	var retry_button = $VBoxContainer/RetryButton
	
	if retry_button:
		retry_button.grab_focus()
	else:
		push_error("RetryButton not found! Check node path.")


func _on_quit_pressed() -> void:
		get_tree().quit()


func _on_restart_pressed() -> void:
	Global.gems_collected = 0  # Reset gems
	get_tree().change_scene_to_file("res://Levels/level_1.tscn")
