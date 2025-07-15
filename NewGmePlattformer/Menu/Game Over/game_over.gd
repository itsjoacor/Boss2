extends CanvasLayer

@export var lose_sound: AudioStream = preload("res://assets/game_over_sound.mp3")

func _ready():
	play_death_sound()
	$Options/RetryButton.grab_focus()

	await get_tree().process_frame
	$Tiempo.text = "Tiempo Restante: " + Global.get_formatted_time(Global.time_remaining)
	$Gemas.text = "Gemas: " + str(Global.gems_collected)

	Global.stop_timer()

	

	var retry_button = $VBoxContainer/RetryButton
	
	if retry_button:
		retry_button.grab_focus()
	else:
		push_error("RetryButton not found! Check node path.")

func _on_retry_button_pressed():
	Global.gems_collected = 0
	Global.time_remaining = 120.0
	Global.start_timer()

	get_tree().change_scene_to_file("res://Levels/level_1.tscn")



func _on_quit_pressed() -> void:
	Global.gems_collected = 0 
	get_tree().quit()


func _on_menu_principal_pressed() -> void:
	Global.gems_collected = 0 
	get_tree().change_scene_to_file("res://Menu/Main Menu/main_menu.tscn")



func play_death_sound():
	# Access the node directly when needed
	var sound_player = $DeathSoundPlayer
	if lose_sound:
		sound_player.stream = lose_sound
	sound_player.play()
	return sound_player  # Return the player so we can await it
