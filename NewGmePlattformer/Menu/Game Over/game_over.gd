extends Control

func _ready():
	# Wait until the scene is fully ready
	await get_tree().process_frame
	
	# Safely get the button
	var retry_button = $VBoxContainer/RetryButton
	
	if retry_button:
		retry_button.grab_focus()
	else:
		push_error("RetryButton not found! Check node path.")

func _on_retry_button_pressed():
	get_tree().change_scene_to_file("res://Levels/level_1.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
