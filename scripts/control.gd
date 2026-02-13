extends Control

@onready var btn_open = $btn_open
@onready var file_dialog = $file_dialog

func _ready():
	file_dialog.access = FileDialog.ACCESS_FILESYSTEM
	file_dialog.current_dir = OS.get_user_data_dir()

	btn_open.pressed.connect(_on_btn_open_pressed)
	file_dialog.file_selected.connect(_on_file_selected)

func _on_btn_open_pressed() -> void:
	file_dialog.popup_centered()

func _on_file_selected(path: String) -> void:
	var file := FileAccess.open(path, FileAccess.READ)
	if file == null:
		push_error("Failed to open file: %s" % path)
		return

	while not file.eof_reached():
		var line = file.get_line()
		print(line)
	file.close()
	print("--- done reading %s ---" % path)
