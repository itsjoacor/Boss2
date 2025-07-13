extends CanvasLayer

func level(num):
	$CurrentLevel.text = "Nivel: " + str(num)
	
func gems(num):
	$GemsLabel.text = "Gemas: " + str(num)

func _process(_delta):
	$TimerLabel.text = "Tiempo: " + Global.get_formatted_time()
	if Global.time_remaining <= 30.0:
		$TimerLabel.modulate = Color(255, 0, 0) 
