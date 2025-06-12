
extends Control


func _on_resume_pressed():
	get_tree().paused = false
	visible = false
	get_tree().get_root().get_node("PauseMenu").is_paused = false  # ⚠️ Cambiá "Main" por tu nodo donde está is_paused


func _on_restart_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_quit_pressed():
	get_tree().quit()
