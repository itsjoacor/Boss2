extends CanvasLayer

func level(num):
	$CurrentLevel.text = "Level: %d" % num
	
func gems(num):
	$GemsLabel.text = "Gems: %d" % num
