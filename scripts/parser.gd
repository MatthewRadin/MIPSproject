extends Node

var instructionSet: Dictionary[String, Instruction] = {}
var mipsProgram: Array[ProgramLine] = []
var labelDict: Dictionary[String, int] = {}

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

func parseMIPS(mipsLines):
	var idx = 0
	for line in mipsLines:
		var splitLine = line.split(" ", false)
		var progLine = ProgramLine.new()
		progLine.text = line
		progLine.label = ""
		if splitLine[0].is_empty():
			print("its empty")
		elif instructionSet.has(splitLine[0]):
				progLine.instruction = splitLine[0]
				var operandNum = instructionSet.get(progLine.instruction).operands.size()
				if splitLine.size() != operandNum+1:
					progLine.is_valid = false
					progLine.error = "Improper number of operands"
				else:
					var rawOp: Array[String] = []
					for i in range(1, operandNum+1):
						rawOp.append(splitLine[i].trim_suffix(","))
					mipsProgram.append(progLine)
		elif splitLine[0].ends_with(":"):
			progLine.label = splitLine[0].trim_suffix(":")
			labelDict[progLine.label] =  idx
			mipsProgram.append(progLine)
		else:
			progLine.is_valid = false
			progLine.error = "Invalid instruction"
		idx += 1

	return mipsProgram
