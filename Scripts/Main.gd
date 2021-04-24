extends Control

export (PackedScene) var sound

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
			if not (x == i):
				var s = sound.instance()
				add_child(s)
				s.add_sound("dice")
				s.play_sound()
				
				explode = false
				if not results == "": results = results + " + " + String(x)
				else: results  = String(x)
			
			if x == i:
				var s = sound.instance()
				add_child(s)
				s.add_sound("explode")
				s.play_sound()
				
				if not results == "": results = results + " + [color=#d44e52]" + String(x) +"[/color]"
				else: results  = "[color=#d44e52]" + String(x) +"[/color]"
	
	output_text.bbcode_text = "[center]" + String(results) + " = " + "[color=#80ac40]" +String(y) +"[/color]"
	results = ""
	new = true
	
func add_to_roll_pool(kind : String) -> void:
	if new: 
		roll_pool.clear()
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
	
