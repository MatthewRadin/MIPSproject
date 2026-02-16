extends Node

var instructionSet: Dictionary[String, Instruction] = {}

func _ready():
	var file = FileAccess.open("res://smallMIPSinstructions.txt", FileAccess.READ)
	var text = file.get_as_text()
	var data = JSON.parse_string(text)
	for name in data["instructions"]:
		var entry = data["instructions"][name]
		var inst = Instruction.new()
		inst.name = name
		inst.type = entry["type"]
		inst.operator = Instruction.Operator[entry["effect"]["op"]]
		inst.operands = []
		for op in entry["operands"]:
			inst.operands.append(str(op))
		inst.dest = str(entry["effect"]["dest"])
		inst.args = []
		for arg in entry["effect"]["args"]:
			inst.args.append(str(arg))
		inst.cycles = 0
		instructionSet[name] = inst
	return instructionSet

func parseMIPS(mipsLines):
	for line in mipsLines:
		print(line)
	return
