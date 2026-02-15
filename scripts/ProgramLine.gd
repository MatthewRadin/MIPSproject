class_name ProgramLine

var text: String # raw line of MIPS
var label: String # if its a label, if so what label
var instruction: String # instruction its running
var raw_operands: Array[String] # registers following the instruction
var is_valid: bool # if it is a recognized instruction + appropriate num of operands
var error: String # if its invalid, why
