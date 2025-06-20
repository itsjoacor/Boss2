extends CanvasLayer

signal resume_requested



func _on_resume_pressed():
	resume_requested.emit()

func _on_restart_pressed():
	Global.gems_collected = 0  # Reset gems
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_quit_pressed():
	Global.gems_collected = 0  # Reset gems
	get_tree().quit()
