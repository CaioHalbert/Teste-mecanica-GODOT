extends Popup

var guess = []
var combination = []

onready var display = $VBoxContainer/DisplayContainer/Display
onready var light = $VBoxContainer/ButtonContainer/GridContainer/StatusLight

signal combination_correct

func _ready():
	connect_buttons()
	reset_lock()

func update_display():
	display.text = PoolStringArray(guess).join("")
	if guess.size() == combination.size():
		check_guess()

func connect_buttons():
	for child in $VBoxContainer/ButtonContainer/GridContainer.get_children():
		if child is Button:
			child.connect("pressed", self, "Button_pressed", [child.text])

func Button_pressed(button):
	if button == "ok":
		check_guess()
	else:
		enter_info(int(button))

func check_guess():
	$AudioStreamPlayer.stream = load("res://Assets/SFX/threeTone1.ogg")
	$AudioStreamPlayer.play()
	light.texture = load("res://Assets/GFX/Interface/PNG/dotGreen.png")
	if guess == combination:
		$Timer.start()
	else:
		reset_lock()

func enter_info(button):
	$AudioStreamPlayer.stream = load("res://Assets/SFX/twoTone1.ogg")
	$AudioStreamPlayer.play()
	guess.append(button)
	update_display()

func reset_lock():
	light.texture = load("res://Assets/GFX/Interface/PNG/dotRed.png")
	display.text = ""
	guess.clear()

func _on_Timer_timeout():
	emit_signal("combination_correct")
	reset_lock()
