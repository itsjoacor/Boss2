extends CanvasLayer

@export var victory_sound: AudioStream = preload("res://assets/vitory_sound.mp3")

func _ready():
	play_victory_sound()
	$Options/Restart.grab_focus() 
	
	await get_tree().process_frame
	
	var time_taken = 120.0 - Global.time_remaining
	$Tiempo.text = "Recorrido en: " + Global.get_formatted_time(time_taken)
	$Gemas.text = "Gemas obtenidas: " + str(Global.gems_collected)
	Global.stop_timer()
	
	update_records(time_taken)
	
	$"Best Time".text = "Record de Tiempo: " + Global.get_formatted_time(Global.best_time)
	$"Best Gems".text = "Record de Gemas: " + str(Global.best_gems)

func update_records(time_taken: float):
	if time_taken < Global.best_time or Global.best_time == 0.0:
		Global.best_time = time_taken
	
	if Global.gems_collected > Global.best_gems:
		Global.best_gems = Global.gems_collected
		
func _on_quit_pressed() -> void:
		get_tree().quit()


func _on_restart_pressed() -> void:
	Global.start_timer()
	Global.gems_collected = 0
	get_tree().change_scene_to_file("res://Levels/level_1.tscn")


func _on_menu_principal_pressed() -> void:
	Global.gems_collected = 0 
	get_tree().change_scene_to_file("res://Menu/Main Menu/main_menu.tscn")
	
	
	
func play_victory_sound():

	var sound_player = $VictorySoundPlayer
	if victory_sound:
		sound_player.stream = victory_sound
	sound_player.play()
	return sound_player
