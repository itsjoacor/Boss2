extends CanvasLayer

func _ready():
	$Options/Comenzar.grab_focus()
	_update_mute_button()

func _on_start_button_pressed():
	Global.start_timer()
	get_tree().change_scene_to_file("res://Levels/level_1.tscn")

func _on_quit_button_pressed():
	Global.gems_collected = 0
	get_tree().quit()

func _on_reglas_pressed() -> void:
	get_tree().change_scene_to_file("res://Menu/Rules/Rules.tscn")

func _on_mute_button_pressed():
	Global.is_muted = !Global.is_muted
	if Global.is_muted:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
		$Options/MuteButton.text = "🔊"
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
		$Options/MuteButton.text = "🔇"
		
func _update_mute_button():
	if Global.is_muted:
		$Options/MuteButton.text = "🔊"
	else:
		$Options/MuteButton.text = "🔇"
