extends Area2D

@export var target_level : int = 2  # MUST be set in inspector!
signal player_entered

var cooldown = false

func _on_body_entered(body):
	if body.name == "Player" and not cooldown:
		cooldown = true
		Global.current_level = target_level
		var path = "res://Levels/level_%d.tscn" % target_level
		print("Door activated to level ", target_level)
		player_entered.emit(path)
		await get_tree().create_timer(1.0).timeout
		cooldown = false
