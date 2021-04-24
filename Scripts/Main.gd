extends Control

var roll_pool : Array = []
var results : String = ""
var new : bool = true

onready var output_text = $VBoxContainer/MarginContainer/CenterContainer/output

func _ready() -> void:
	randomize()
	
	output_text.bbcode_text = ""

func roll():
	if roll_pool.empty(): 
		output_text.bbcode_text = ""
		return
	
	var y = 0
	for i in roll_pool:
		var explode : bool = true
		while explode:
			var x = randi() % i + 1
			y += x
			if not (x == i): ## see if the dice explodes
				explode = false
			if not results == "": results = results + " + " + String(x)
			else: results  = String(x)
	
	output_text.bbcode_text = "[center]" + String(results) + " = " + String(y)
	if roll_pool.size() > 1: roll_pool.clear()
	results = ""
	new = true
	
func add_to_roll_pool(kind : String) -> void:
	if new: roll_pool.clear()
	match kind:
		"d4": roll_pool.append(4)
		"d6": roll_pool.append(6)
		"d8": roll_pool.append(8)
		"d10": roll_pool.append(10)
		"d12": roll_pool.append(12)
		"d20": roll_pool.append(20)
		"d100": roll_pool.append(100)
	
	if not (output_text.bbcode_text == "") and not new:
		output_text.bbcode_text = output_text.bbcode_text + " + " + kind
	elif output_text.bbcode_text == "" or new:
		output_text.bbcode_text = "[center] " + kind
		new = false
	
