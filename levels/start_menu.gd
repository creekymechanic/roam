extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_play_pressed():
	get_tree().change_scene_to_file("res://levels/sub_viewport_container.tscn")

func _on_settings_pressed():
	get_tree().change_scene_to_file("res://settings/settings_menu.tscn")

func _on_exit_pressed():
	get_tree().quit()
