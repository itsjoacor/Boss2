extends CanvasLayer

signal resume_requested



func _on_resume_pressed():
	resume_requested.emit()

func _on_restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_quit_pressed():
	get_tree().quit()
