extends CanvasLayer

signal resume_requested


var current_selection := 0
var menu_items := []
var navigation_enabled := true

func _ready():

	menu_items = [
		$CenterContainer/Resume,
		$CenterContainer/Restart,
		$CenterContainer/Quit,
		$CenterContainer/MuteButton
	]


	_setup_navigation()


	await get_tree().process_frame
	_update_selection()
	_update_mute_button()


	get_viewport().gui_focus_changed.connect(_on_focus_changed)

func _setup_navigation():

	$CenterContainer/Resume.focus_neighbor_bottom = $CenterContainer/Restart.get_path()
	$CenterContainer/Resume.focus_neighbor_top = $CenterContainer/MuteButton.get_path()

	$CenterContainer/Restart.focus_neighbor_top = $CenterContainer/Resume.get_path()
	$CenterContainer/Restart.focus_neighbor_bottom = $CenterContainer/Quit.get_path()

	$CenterContainer/Quit.focus_neighbor_top = $CenterContainer/Restart.get_path()
	$CenterContainer/Quit.focus_neighbor_bottom = $CenterContainer/MuteButton.get_path()

	$CenterContainer/MuteButton.focus_neighbor_top = $CenterContainer/Quit.get_path()
	$CenterContainer/MuteButton.focus_neighbor_bottom = $CenterContainer/Resume.get_path()

func _update_selection():
	if current_selection >= 0 and current_selection < menu_items.size():
		menu_items[current_selection].grab_focus()

func _on_focus_changed(control):
	if control in menu_items:
		current_selection = menu_items.find(control)

func _input(event):
	if not visible or not navigation_enabled:
		return

	if event.is_action_pressed("ui_down"):
		current_selection = wrapi(current_selection + 1, 0, menu_items.size())
		_update_selection()
		get_viewport().set_input_as_handled()

	elif event.is_action_pressed("ui_up"):
		current_selection = wrapi(current_selection - 1, 0, menu_items.size())
		_update_selection()
		get_viewport().set_input_as_handled()

	elif event.is_action_pressed("ui_accept"):
		get_viewport().set_input_as_handled()
		await get_tree().create_timer(0.01).timeout  
		if current_selection >= 0 and current_selection < menu_items.size():
			menu_items[current_selection].emit_signal("pressed")

func _on_visibility_changed():
	if visible:
		await get_tree().process_frame
		current_selection = 0
		_update_selection()
		navigation_enabled = true

func _update_mute_button():
	if Global.is_muted:
		$CenterContainer/MuteButton.text = "Sonido: ON"
	else:
		$CenterContainer/MuteButton.text = "Sonido: OFF"

func _on_mute_button_pressed():
	Global.is_muted = !Global.is_muted
	var master_bus = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(master_bus, Global.is_muted)
	_update_mute_button()

func _on_resume_pressed():
	resume_requested.emit()

func _on_restart_pressed():
	navigation_enabled = false
	Global.elapsed_time = 0.0
	Global.start_timer()
	Global.gems_collected = 0
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Levels/level_1.tscn")

func _on_quit_pressed():
	navigation_enabled = false
	Global.gems_collected = 0
	get_tree().quit()
