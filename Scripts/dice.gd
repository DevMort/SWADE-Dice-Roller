extends TextureButton

export (String) var kind

func _ready() -> void:
	match kind:
		"d4":
			var d4_s = load("res://Sprites/d4.png")
			var d4_sp = load("res://Sprites/d4_p.png")
			set("texture_normal", d4_s)
			set("texture_pressed", d4_sp)
		"d6":
			var d6_s = load("res://Sprites/d6.png")
			var d6_sp = load("res://Sprites/d6_p.png")
			set("texture_normal", d6_s)
			set("texture_pressed", d6_sp)
		"d8":
			var d8_s = load("res://Sprites/d8.png")
			var d8_sp = load("res://Sprites/d8_p.png")
			set("texture_normal", d8_s)
			set("texture_pressed", d8_sp)
		"d10":
			var d10_s = load("res://Sprites/d10.png")
			var d10_sp = load("res://Sprites/d10_p.png")
			set("texture_normal", d10_s)
			set("texture_pressed", d10_sp)
		"d12":
			var d12_s = load("res://Sprites/d12.png")
			var d12_sp = load("res://Sprites/d12_p.png")
			set("texture_normal", d12_s)
			set("texture_pressed", d12_sp)
		"d20":
			var d20_s = load("res://Sprites/d20.png")
			var d20_sp = load("res://Sprites/d20_p.png")
			set("texture_normal", d20_s)
			set("texture_pressed", d20_sp)
		"d100":
			var d100_s = load("res://Sprites/d100.png")
			var d100_sp = load("res://Sprites/d100_p.png")
			set("texture_normal", d100_s)
			set("texture_pressed", d100_sp)
		"dx":
			var dx_s = load("res://Sprites/dx.png")
			var dx_sp = load("res://Sprites/dx_p.png")
			set("texture_normal", dx_s)
			set("texture_pressed", dx_sp)

func roll() -> void:
	var ps = get_tree().get_nodes_in_group("main")
	var main = ps[0]
	
	if kind == 'dx':
		main.roll()
	else:
		main.add_to_roll_pool(kind)
