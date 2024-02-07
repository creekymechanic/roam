extends Node

func _input(event):
	if event.is_action_pressed("esc"):
		get_tree().change_scene_to_file("res://levels/start_menu.tscn")
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
