extends CanvasLayer

func level(num):
	$CurrentLevel.text = "Level: " + str(num)
	
func gems(num):
	$GemsLabel.text = "Gemas: " + str(num)




func _process(_delta):
	$TimerLabel.text = "Tiempo: " + Global.get_formatted_time()
