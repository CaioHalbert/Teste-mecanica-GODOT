extends "res://Assets/Tiles/Door.gd"

func _on_Door_body_exited(body):
	if body.collision_layer == 1:
		can_click = false
		$CanvasLayer/Numberpad.hide()

func _on_Door_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_click:
		$CanvasLayer/Numberpad.popup_centered()

func _on_Numberpad_combination_correct():
	open_door()
	$CanvasLayer/Numberpad.hide()

func _on_Computer_combination(numbers, lock_group):
	$CanvasLayer/Numberpad.combination = numbers
