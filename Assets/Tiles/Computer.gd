extends Node2D

var combination
var can_click = false
var combination_length = 4
var lock_group = 1

signal combination

func _ready():
	generate_combination()
	emit_signal("combination", combination, lock_group)

func _on_Area2D_body_entered(body):
	can_click = true

func _on_Area2D_body_exited(body):
	can_click = false
	$CanvasLayer/ComputerPopup.hide()
	$Light2D.enabled = false
	print(can_click)

func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click:
		print("Click")
		$CanvasLayer/ComputerPopup.popup_centered()
		$Light2D.enabled = true

func generate_combination():
	combination = CombinationGenerator.generate_combination(combination_length)
	set_popup_text()

func set_popup_text():
	$CanvasLayer/ComputerPopup.set_text(combination)
