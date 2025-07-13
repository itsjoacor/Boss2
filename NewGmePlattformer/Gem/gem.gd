extends Area2D

signal gem_collected


var float_height: float = 4.0
var float_speed: float = 2.0
var time_passed: float = 0.0
var start_position: Vector2


var is_collected: bool = false
@export var collected_texture: Texture2D
@export var collected_scale: float = 0.4 
var original_scale: Vector2

func _ready():
	collision_layer = 1
	collision_mask = 4
	start_position = position
	time_passed = randf_range(0, 2 * PI)
	original_scale = $Sprite2D.scale

func _process(delta):
	if not is_collected:
		time_passed += delta * float_speed
		position.y = start_position.y + sin(time_passed) * float_height

func _on_body_entered(body):
	if body.name == "Player" and not is_collected:
		is_collected = true
		$CollisionShape2D.set_deferred("disabled", true)
		
		$CollectedSfx.play()
		if collected_texture:
			$Sprite2D.texture = collected_texture
			$Sprite2D.scale = original_scale * collected_scale

		var tween = create_tween()
		tween.tween_property($Sprite2D, "scale", original_scale * collected_scale * 0.5, 0.2)
		tween.tween_callback(hide)
		
		Global.gems_collected += 1
		gem_collected.emit()

func _on_collected_sfx_finished():
	queue_free()
