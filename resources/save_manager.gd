extends Node

const SAVE_DIR = "user://data"
const SAVE_PATH = SAVE_DIR + "/data.res"
const SETTINGS_PATH = SAVE_DIR + "/settings.tres"

var stats = Stats.new()
var config = Config.new()

func _ready() -> void:
	DirAccess.make_dir_recursive_absolute(SAVE_DIR)

	load_game()
	load_settings()

func remove_save():
	if FileAccess.file_exists(SAVE_PATH):
		DirAccess.remove_absolute(SAVE_PATH)
	stats = Stats.new()

func save_game():
	if FileAccess.file_exists(SAVE_PATH):
		DirAccess.remove_absolute(SAVE_PATH)

	var err = ResourceSaver.save(stats, SAVE_PATH, ResourceSaver.FLAG_REPLACE_SUBRESOURCE_PATHS)
	if err != OK:
		print("Failed to save game! Error code:", err)
	else:
		print("Game saved successfully!")


func load_game():
	if ResourceLoader.exists(SAVE_PATH):
		var loaded_data = ResourceLoader.load(SAVE_PATH)
		if loaded_data:
			stats = loaded_data.duplicate(true)
			print("Game loaded successfully!")
			return true
		else:
			print("Failed to load game: File might be corrupted.")
			return false
	else:
		print("Save file does not exist.")
		return false

func save_settings():

	if FileAccess.file_exists(SETTINGS_PATH):
		DirAccess.remove_absolute(SETTINGS_PATH)

	var err = ResourceSaver.save(config, SETTINGS_PATH, ResourceSaver.FLAG_REPLACE_SUBRESOURCE_PATHS)
	if err != OK:
		print("Failed to save settings! Error code:", err)

func load_settings():
	if ResourceLoader.exists(SETTINGS_PATH):
		var loaded_data = ResourceLoader.load(SETTINGS_PATH)
		if loaded_data:
			config = loaded_data.duplicate(true)
			print("Settings loaded successfully!")
		else:
			print("Failed to load settings: File might be corrupted.")
	else:
		print("⚠Settings file does not exist.")
