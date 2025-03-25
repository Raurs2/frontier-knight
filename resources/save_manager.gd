extends Node

const SAVE_DIR = "user://data"
const SAVE_PATH = SAVE_DIR + "/data.res"
const SETTINGS_PATH = SAVE_DIR + "/settings.tres"

var stats = Stats.new()
var config = Config.new()

# At start try to recursivily create save directory and load game and settings
func _ready() -> void:
	DirAccess.make_dir_recursive_absolute(SAVE_DIR)

	load_game()
	load_settings()

# Remove save files and refresh save in primary memory
func remove_save():
	if FileAccess.file_exists(SAVE_PATH):
		DirAccess.remove_absolute(SAVE_PATH)

	stats = Stats.new()

# First delete saved game if the file exists and after save the game
func save_game():
	if FileAccess.file_exists(SAVE_PATH):
		DirAccess.remove_absolute(SAVE_PATH)

	ResourceSaver.save(stats, SAVE_PATH, ResourceSaver.FLAG_REPLACE_SUBRESOURCE_PATHS)

# try loading the saved game if the save file exists
func load_game():
	if ResourceLoader.exists(SAVE_PATH):
		var loaded_data = ResourceLoader.load(SAVE_PATH)
		if loaded_data:
			stats = loaded_data.duplicate(true)
			return true
		else:
			return false
	else:
		return false

# First delete saved settings if the file exists and after save the settings
func save_settings():
	if FileAccess.file_exists(SETTINGS_PATH):
		DirAccess.remove_absolute(SETTINGS_PATH)

	ResourceSaver.save(config, SETTINGS_PATH, ResourceSaver.FLAG_REPLACE_SUBRESOURCE_PATHS)
	
# try loading the saved settings if the save file exists
func load_settings():
	if ResourceLoader.exists(SETTINGS_PATH):
		var loaded_data = ResourceLoader.load(SETTINGS_PATH)
		if loaded_data:
			config = loaded_data.duplicate(true)
			return true
		else:
			return false
	else:
		return false
