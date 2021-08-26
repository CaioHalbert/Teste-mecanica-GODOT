extends CanvasModulate

const DARK = Color("181918")
const NIGHTVISION = Color("26df00")

var up_time = 3
var cooldown = 2.5
var is_up = true

func _ready():
	color = DARK
	visible = true

func cycle_vision_mode():
	if is_up == true:
		NIGHTVISION_mode()
	else:
		DARK_mode()

func DARK_mode():
	if $Timer.get_time_left() == 0:
		color = DARK
		get_tree().call_group("Lights", "show")
		$AudioStreamPlayer2D.stream = load("res://Assets/SFX/nightvision_off.wav")
		$AudioStreamPlayer2D.play()
		$Timer.wait_time = cooldown
		$Timer.start()

func NIGHTVISION_mode():
	if $Timer.get_time_left() == 0:
		color = NIGHTVISION
		get_tree().call_group("Lights", "hide")
		$AudioStreamPlayer2D.stream = load("res://Assets/SFX/nightvision.wav")
		$AudioStreamPlayer2D.play()
		$Timer.wait_time = up_time
		$Timer.start()

func _on_Timer_timeout():
	if $Timer.wait_time == up_time:
		is_up = false
		cycle_vision_mode()
	else:
		is_up = true
