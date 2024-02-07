extends Node

signal fov_updated(value)
signal mouse_sens_updated(value)

func update_master_vol(vol):
	AudioServer.set_bus_volume_db(0, vol)
	Save.game_data.master_vol = vol
	Save.save_data()

func update_fov(value):
	emit_signal("fov_updated", value)
	Save.game_data.fov = value
	Save.save_data()

func update_mouse_sens(value):
	emit_signal("mouse_sens_updated", value)
	Save.game_data.mouse_sens = value
	Save.save_data()
