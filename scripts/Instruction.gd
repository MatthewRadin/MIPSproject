class_name Instruction

enum Operator { ADD, SUB, AND, OR } # more to add

var name: String
var type: String #R type, I type, J type, FL type(?)
var operator: Operator
var operands: Array[String] # ex: ["rd", "rs", "rt"]
var dest: String
var args: Array[String]
var cycles: int # num of cycles the instruction takes, mimic actual hardware speed/constraints
