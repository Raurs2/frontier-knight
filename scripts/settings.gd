extends Control
@onready var resolution_option: OptionButton = $Panel/CenterContainer/VBoxContainer/VBoxContainer/ResolutionOption

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
	for res in resolutions.keys():
		resolution_option.add_item(res)
	update_res()
func _on_confirm_set_btn_pressed() -> void:
	visible = false


func _on_resolution_option_item_selected(index: int) -> void:
	var selected = resolution_option.get_item_text(index)
	DisplayServer.window_set_size(resolutions[selected])
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	await get_tree().process_frame
	update_res()

func _on_check_fullscreen_toggled(toggled_on: bool) -> void:
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		
	update_res()

func update_res():
	var current_size = DisplayServer.window_get_size()
	for i in range(resolution_option.item_count):
		var res_name = resolution_option.get_item_text(i)
		if resolutions.has(res_name) and resolutions[res_name] == current_size:
			resolution_option.select(i)
			break
