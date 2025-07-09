extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	$Options/Atras.grab_focus()


func _on_fullscreen_button_pressed():
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	elif DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


func _on_atras_pressed() -> void:
		get_tree().change_scene_to_file("res://Menu/Main Menu/main_menu.tscn")
	




func _on_comenzar_pressed() -> void:
	Global.start_timer()
	get_tree().change_scene_to_file("res://Levels/level_1.tscn")
