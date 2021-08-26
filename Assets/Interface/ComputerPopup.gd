extends Popup

func set_text(combination):
	$NinePatchRect/CenterContainer/NinePatchRect/Label.text = (
		"The combination is: " + PoolStringArray(combination).join("")
	)
