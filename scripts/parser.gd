extends Node

var instructionSet: Array[Instruction]

func _ready():
	var file = FileAccess.open("res://smallMIPSinstructions.txt", FileAccess.READ)
	var text = file.get_as_text()
	var data = JSON.parse_string(text)
	print(data)
	
	return
	# PARSE INSTRUCTIONS


func parseMIPS():
	return
