extends Node

func execute(progLine):
	match InstructionSet.instructionSet[progLine.instruction].operator:
		Instruction.Operator.ADD:
			print("adding")
			return _add(progLine)
		Instruction.Operator.SUB:
			print("subtracting")
			return _sub(progLine)
		Instruction.Operator.AND:
			print("and-ing")
			return _and(progLine)
		Instruction.Operator.OR:
			print("or-ing")
			return _or(progLine)
		Instruction.Operator.LOAD:
			pass
		Instruction.Operator.STORE:
			pass
	return "Operation not supported"

func _add(progLine):
	match InstructionSet.instructionSet[progLine.instruction].type:
		"R":
			print("R type addition")
			var arguments = progLine.raw_operands
			# dest might not always be the first in the arguments array, make some sort of
			# check to note the index of it, new var of instruction?  or unnecessary assembly-wise
			# hard-coding dest as 0 and args as 1 and 2 for now.
			var arg1 = Registers.registers[Registers.register_map[arguments[1]]]
			var arg2 = Registers.registers[Registers.register_map[arguments[2]]]
			print(arg1)
			print(arg2)
			print(arg1+arg2)
			Registers.registers[Registers.register_map[arguments[0]]] = arg1+arg2
			return 0
		"I":
			print("I type addition")
			var arguments = progLine.raw_operands
			var arg1 = Registers.registers[Registers.register_map[arguments[1]]]
			var arg2 = int(arguments[2])
			print(arg1)
			print(arg2)
			print(arg1+arg2)
			Registers.registers[Registers.register_map[arguments[0]]] = arg1+arg2
			return 0
	return "Type not supported"

func _sub(progLine):
	match InstructionSet.instructionSet[progLine.instruction].type:
		"R":
			print("R type subtraction")
			var arguments = progLine.raw_operands
			var arg1 = Registers.registers[Registers.register_map[arguments[1]]]
			var arg2 = Registers.registers[Registers.register_map[arguments[2]]]
			print(arg1)
			print(arg2)
			print(arg1-arg2)
			Registers.registers[Registers.register_map[arguments[0]]] = arg1-arg2
			return 0
		"I":
			print("I type subtraction")
			var arguments = progLine.raw_operands
			var arg1 = Registers.registers[Registers.register_map[arguments[1]]]
			var arg2 = int(arguments[2])
			print(arg1)
			print(arg2)
			print(arg1-arg2)
			Registers.registers[Registers.register_map[arguments[0]]] = arg1-arg2
			return 0
	return "Type not supported"

func _and(progLine):
	match InstructionSet.instructionSet[progLine.instruction].type:
		"R":
			print("R type AND")
			var arguments = progLine.raw_operands
			var arg1 = Registers.registers[Registers.register_map[arguments[1]]]
			var arg2 = Registers.registers[Registers.register_map[arguments[2]]]
			print(arg1)
			print(arg2)
			print(arg1 & arg2)
			Registers.registers[Registers.register_map[arguments[0]]] = arg1 & arg2
			return 0
		"I":
			print("I type AND")
			var arguments = progLine.raw_operands
			var arg1 = Registers.registers[Registers.register_map[arguments[1]]]
			var arg2 = int(arguments[2])
			print(arg1)
			print(arg2)
			print(arg1 & arg2)
			Registers.registers[Registers.register_map[arguments[0]]] = arg1 & arg2
			return 0
	return "Type not supported"

func _or(progLine):
	match InstructionSet.instructionSet[progLine.instruction].type:
		"R":
			print("R type OR")
			var arguments = progLine.raw_operands
			var arg1 = Registers.registers[Registers.register_map[arguments[1]]]
			var arg2 = Registers.registers[Registers.register_map[arguments[2]]]
			print(arg1)
			print(arg2)
			print(arg1 | arg2)
			Registers.registers[Registers.register_map[arguments[0]]] = arg1 | arg2
			return 0
		"I":
			print("I type OR")
			var arguments = progLine.raw_operands
			var arg1 = Registers.registers[Registers.register_map[arguments[1]]]
			var arg2 = int(arguments[2])
			print(arg1)
			print(arg2)
			print(arg1 | arg2)
			Registers.registers[Registers.register_map[arguments[0]]] = arg1 | arg2
			return 0
	return "Type not supported"
