extends Node2D

@onready var level_num := int(get_tree().current_scene.scene_file_path.get_file().trim_prefix("level_").trim_suffix(".tscn"))
@onready var pause_menu = preload("res://Menu/Pause Menu/pause_menu.tscn").instantiate()
var is_paused := false

func _ready(): # <-- este nodo escucha tecla aunque el juego esté en pausa

	$HUD.level(level_num)
	set_gems_label()
	for gem in $Gems.get_children():
		gem.gem_collected.connect(_on_gem_collected)

	add_child(pause_menu)
	pause_menu.visible = false
	pause_menu.set_process_mode(Node.PROCESS_MODE_ALWAYS)
	set_process_mode(Node.PROCESS_MODE_ALWAYS)
	pause_menu.resume_requested.connect(_on_resume_requested)

	get_tree().root.add_child(pause_menu)
	

func _on_resume_requested():
	is_paused = false
	get_tree().paused = false
	pause_menu.visible = false


func _on_gem_collected():
	set_gems_label()

func set_gems_label():
	$HUD.gems(Global.gems_collected)

func _on_door_player_entered(level):
	get_tree().change_scene_to_file(level)

func _input(event):
	if event.is_action_pressed("pause"):
		if get_tree().paused:
			_resume_game()
		else:
			_pause_game()

func _pause_game():
	get_tree().paused = true
	pause_menu.visible = true  # Show the pause menu

func _resume_game():
	get_tree().paused = false
	pause_menu.visible = false # Hide the pause menu
