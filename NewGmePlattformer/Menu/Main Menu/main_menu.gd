extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Levels/level_1.tscn")

func _on_fullscreen_button_pressed():
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	elif DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

func _on_quit_button_pressed():
	Global.gems_collected = 0  # Reset gems
	get_tree().quit()


func _on_reglas_pressed() -> void:
	get_tree().change_scene_to_file("res://Menu/Rules/Rules.tscn")
