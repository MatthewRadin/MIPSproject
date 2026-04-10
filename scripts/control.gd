extends Control

@onready var btn_open = $btn_open
@onready var file_dialog = $file_dialog

func _ready():
	file_dialog.access = FileDialog.ACCESS_RESOURCES
	file_dialog.current_dir = "res://"

	btn_open.pressed.connect(_on_btn_open_pressed)
	file_dialog.file_selected.connect(_on_file_selected)

func _on_btn_open_pressed() -> void:
	file_dialog.popup_centered()

func _on_file_selected(path: String) -> void:
	var file := FileAccess.open(path, FileAccess.READ)
	var fileLines: Array[String] = []
	if file == null:
		push_error("Failed to open file: %s" % path)
		return

	while not file.eof_reached():
		var line = file.get_line()
		fileLines.append(line)
	file.close()
	var parser = preload("res://scripts/parser.gd").new()
	add_child(parser)
	await get_tree().process_frame
	var parsedMips = parser.parseMIPS(fileLines)
	print("running command")
	var interpreter = preload("res://scripts/interpreter.gd").new()
	print("line 1")
	interpreter.execute(parsedMips[1])
	print("line 2")
	interpreter.execute(parsedMips[2])
	print ("line 3")
	interpreter.execute(parsedMips[3])
	print("line 4")
	interpreter.execute(parsedMips[4])
	print("line 5")
	interpreter.execute(parsedMips[5])
