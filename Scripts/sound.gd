extends AudioStreamPlayer

func add_sound(kind : String) -> void:
	match kind:
		"dice":
			var x = load("res://Sounds/dice.wav")
			set("stream", x)
		"explode":
			var x = load("res://Sounds/explode.wav")
			set("stream", x)

func play_sound():
	play()
	yield(self, "finished")
	queue_free()
