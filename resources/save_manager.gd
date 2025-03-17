extends Node

const SAVE_PATH = 'user://data/data.res'
const SETTINGS_PATH = 'user://data/settings.tres'

var stats = Stats.new()
var config = Config.new()

func _ready() -> void:
	DirAccess.make_dir_absolute(SAVE_PATH)

func save_game():
	ResourceSaver.save(stats, SAVE_PATH, ResourceSaver.FLAG_COMPRESS)

func load_game():
	if ResourceLoader.exists(SAVE_PATH):
		stats = ResourceLoader.load(SAVE_PATH).duplicate(true)
		
func save_settings():
	ResourceSaver.save(config, SETTINGS_PATH)

func load_settings():
	if ResourceLoader.exists(SETTINGS_PATH):
		config = ResourceLoader.load(SETTINGS_PATH).duplicate(true)
