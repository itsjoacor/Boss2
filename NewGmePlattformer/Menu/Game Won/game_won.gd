extends CanvasLayer

func _ready():
	$Options/Restart.grab_focus() 
	
	await get_tree().process_frame
	$Tiempo.text = "Tiempo: " + Global.get_formatted_time()
	$Gemas.text = "Gemas: " + str(Global.gems_collected)
	Global.stop_timer()
	

	update_records()
	

	$"Best Time".text = "Mejor Tiempo: " + Global.get_formatted_time(Global.best_time)
	$"Best Gems".text = "Mejor Gemas: " + str(Global.best_gems)
	
	

	var retry_button = $VBoxContainer/RetryButton
	
	if retry_button:
		retry_button.grab_focus()
	else:
		push_error("RetryButton not found! Check node path.")

func update_records():

	if Global.elapsed_time < Global.best_time or Global.best_time == 0.0:
		Global.best_time = Global.elapsed_time
	

	if Global.gems_collected > Global.best_gems:
		Global.best_gems = Global.gems_collected

		
func _on_quit_pressed() -> void:
		get_tree().quit()


func _on_restart_pressed() -> void:
	Global.elapsed_time = 0.0
	Global.start_timer()
	Global.gems_collected = 0
	get_tree().change_scene_to_file("res://Levels/level_1.tscn")


func _on_menu_principal_pressed() -> void:
	Global.gems_collected = 0 
	get_tree().change_scene_to_file("res://Menu/Main Menu/main_menu.tscn")
