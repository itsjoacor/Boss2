extends Node2D

@export var level_num = 1  # MUST be set in inspector for each level!

func _ready():
	# Set global level first
	Global.current_level = level_num
	
	# Initialize HUD
	$HUD.level(level_num)
	$HUD.gems(Global.gems_collected)
	
	# Connect signals safely
	_connect_signals()
	
	print("Level ", level_num, " loaded. Gems: ", Global.gems_collected)

func _connect_signals():
	# Clear old connections first
	for gem in get_tree().get_nodes_in_group("gems"):
		if gem.gem_collected.is_connected(_on_gem_collected):
			gem.gem_collected.disconnect(_on_gem_collected)
		gem.gem_collected.connect(_on_gem_collected)
	
	for door in get_tree().get_nodes_in_group("doors"):
		if door.player_entered.is_connected(_on_door_player_entered):
			door.player_entered.disconnect(_on_door_player_entered)
		door.player_entered.connect(_on_door_player_entered)

func _on_gem_collected():
	Global.gems_collected += 1
	$HUD.gems(Global.gems_collected)
	print("Gem collected! Total: ", Global.gems_collected)

func _on_door_player_entered(level_path):
	print("Transitioning to: ", level_path)
	get_tree().change_scene_to_file.call_deferred(level_path)

func _input(event):
	if event.is_action_pressed("reset_level"):
		get_tree().reload_current_scene.call_deferred()
