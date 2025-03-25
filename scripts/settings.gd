extends Control

@onready var resolution_option: OptionButton = $Panel/CenterContainer/VBoxContainer/VBoxContainer/ResolutionOption
@onready var sound_bar: HScrollBar = $Panel/CenterContainer/VBoxContainer/VBoxContainer2/SoundBar
@onready var music_bar: HScrollBar = $Panel/CenterContainer/VBoxContainer/VBoxContainer6/MusicBar
@onready var check_fullscreen: CheckButton = $Panel/CenterContainer/VBoxContainer/VBoxContainer3/CheckFullscreen

# Define selectables resolutions
var resolutions = {
	#"3840x2160": Vector2i(3840, 2160),
	#"2560x1440": Vector2i(2560, 1440),
	"1920x1080": Vector2i(1920, 1080),
	"1600x900": Vector2i(1600, 900),
	"1366x768": Vector2i(1366, 768),
	"1280x720": Vector2i(1280, 720),
	"1024x576": Vector2i(1024, 576)
}

func _ready() -> void:
	# Populate resolutions in options
	for res in resolutions.keys():
		resolution_option.add_item(res)
	
	# Load the settings and update the current
	load_settings()
	update_res()

	sound_bar.value_changed.connect(_on_sound_bar_value_changed)
	music_bar.value_changed.connect(_on_music_bar_value_changed)

# Save current settings, closing the settings menu and reenabling the buttons
func _on_confirm_set_btn_pressed() -> void:
	SaveManager.save_settings()
	visible = false
	get_tree().paused = false
	for button in get_tree().get_nodes_in_group('Buttons'):
		button.disabled = false

# Change screen resolution based on the selected option
func _on_resolution_option_item_selected(index: int) -> void:
	var selected = resolution_option.get_item_text(index)
	if selected in resolutions:
		DisplayServer.window_set_size(resolutions[selected])
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		SaveManager.config.resolution = index
	await get_tree().process_frame
	update_res()

# Toggle fullscreen on and off
func _on_check_fullscreen_toggled(toggled_on: bool) -> void:
	if toggled_on:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	SaveManager.config.fullscreen = toggled_on
	update_res()

# Update the selected resolution in the UI to match the current window size
func update_res():
	var current_size = DisplayServer.window_get_size()
	for i in range(resolution_option.item_count):
		var res_name = resolution_option.get_item_text(i)
		if res_name in resolutions and resolutions[res_name] == current_size:
			resolution_option.select(i)
			break

# Adjust sound volume
func _on_sound_bar_value_changed(value: float) -> void:
	var db = linear_to_db(value / 100.0)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Sound"), db)
	SaveManager.config.sound = value

# Adjust music volume
func _on_music_bar_value_changed(value: float) -> void:
	var db = linear_to_db(value / 100.0)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), db)
	SaveManager.config.music = value

# Load saved settings and apply them to the settings panel items
func load_settings():
	sound_bar.value = SaveManager.config.sound
	music_bar.value = SaveManager.config.music
	var saved_res = SaveManager.config.resolution
	resolution_option.select(resolution_option.get_item_index(saved_res))
	check_fullscreen.button_pressed = SaveManager.config.fullscreen

	_on_sound_bar_value_changed(sound_bar.value)
	_on_music_bar_value_changed(music_bar.value)
	_on_resolution_option_item_selected(resolution_option.get_selected_id())
	_on_check_fullscreen_toggled(check_fullscreen.button_pressed)
