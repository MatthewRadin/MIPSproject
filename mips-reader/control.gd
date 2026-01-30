extends Control

@onready var btn_open = $btn_open
@onready var file_dialog = $file_dialog

func _ready():
	file_dialog.access = FileDialog.ACCESS_FILESYSTEM  # allow full filesystem access in editor
	file_dialog.current_dir = OS.get_user_data_dir()   # start somewhere sensible

	# connect signals (you can also connect in the editor)
	btn_open.pressed.connect(_on_btn_open_pressed)
	file_dialog.file_selected.connect(_on_file_selected)

func _on_btn_open_pressed() -> void:
	# Shows the dialog centered on the screen
	file_dialog.popup_centered()

func _on_file_selected(path: String) -> void:
	# Read the file line-by-line and print
	var file := FileAccess.open(path, FileAccess.READ)
	if file == null:
		push_error("Failed to open file: %s" % path)
		return

	while not file.eof_reached():
		var line = file.get_line()
		# `print()` goes to Godot's Output/Terminal (Editor -> Output)
		print(line)
	file.close()
	print("--- done reading %s ---" % path)
