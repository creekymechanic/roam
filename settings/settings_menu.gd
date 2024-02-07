extends Popup

# Video Settings
# Audio Settings
@onready var master_slider = $SettingTabs/audio/MarginContainer2/AudioSettings/MasterSlider

# Gameplay Settings
@onready var fov_amount = $SettingTabs/gameplay/MarginContainer3/GameplaySettings/FovOption/FovAmount
@onready var fov_slider = $SettingTabs/gameplay/MarginContainer3/GameplaySettings/FovOption/FovSlider
@onready var mouse_sens_amount = $SettingTabs/gameplay/MarginContainer3/GameplaySettings/MouseSensOption/MouseSensAmount
@onready var mouse_slider = $SettingTabs/gameplay/MarginContainer3/GameplaySettings/MouseSensOption/MouseSlider


func _ready():
	
	master_slider.value = Save.game_data.master_vol
	
	fov_slider.value = Save.game_data.fov
	mouse_slider.value = Save.game_data.mouse_sens
	

func _on_MasterSlider_value_changed(value):
	GlobalSettings.update_master_vol(value)


func _on_FovSlider_value_changed(value):
	GlobalSettings.update_fov(value)
	fov_amount.text = str(value)
	

func _on_MouseSlider_value_changed(value):
	GlobalSettings.update_mouse_sens(value)
	mouse_sens_amount.text = str(value)
	
