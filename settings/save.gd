extends Node

const SAVEFILE = "user://SAVEFILE.save"

var game_data = {
	"master_vol": -10,
	"fov": 70,
	"mouse_sens": 0.1,
}

func _ready():
	load_data()

func load_data():
	var file = FileAccess.open(SAVEFILE,FileAccess.READ)
	if FileAccess.file_exists(SAVEFILE):
		FileAccess.open(SAVEFILE, FileAccess.READ)
		game_data = file.get_var()
		file.close()
	else:
		save_data()

func save_data():
	var file = FileAccess.open(SAVEFILE,FileAccess.WRITE)
	FileAccess.open(SAVEFILE, FileAccess.WRITE)
	if file.get_error() == OK:
		file.store_var(game_data)
		file.close()
	else:
		print("Error opening file for saving:", file.get_error_string())
